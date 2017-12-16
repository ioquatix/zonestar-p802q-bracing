
use <bolts.scad>;

// I find that adjusting the support bars is a good way to fix level issues.
// In my case I print 23 for the front clamps and 24 for the back.
internal_height = 24;

difference() {
	hull() {
		translate([-18, -2, 0]) cube([18*2, 14, 4]);
		translate([0, 0, internal_height-4]) rotate([-90, 0, 0]) cylinder(d=20, h=10);
	}
	
	translate([0, -2, 0]) hull() {
		rotate([-90, 0, 0]) cylinder_outer(20, 8/2);
		translate([0, 0, internal_height-4]) rotate([-90, 0, 0]) #cylinder_outer(20, 8/2);
	}
	
	translate([-18, -2, -10]) cube([18*2, 14, 10]);
	
	translate([-13, 5, 0]) countersunk_hole(4, 6, inset=40);
	translate([13, 5, 0]) countersunk_hole(4, 6, inset=40);
}