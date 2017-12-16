
use <bolts.scad>;

internal_height = 22;

difference() {
	union() {
		translate([-18, 0, 0]) cube([18*2, 10, 4]);
		hull() {
			rotate([-90, 0, 0]) cylinder(d=16, h=10);
			translate([0, 0, internal_height-4]) rotate([-90, 0, 0]) cylinder(d=16, h=10);
		}
	}
	
	hull() {
		rotate([-90, 0, 0]) cylinder_outer(20, 8/2);
		translate([0, 0, internal_height-4]) rotate([-90, 0, 0]) #cylinder_outer(20, 8/2);
	}
	
	translate([-14, 0, -10]) cube([14*2, 10, 10]);
	
	translate([-13, 5, 0]) countersunk_hole(4, 4);
	translate([13, 5, 0]) countersunk_hole(4, 4);
}