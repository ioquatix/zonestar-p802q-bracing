
use <bolts.scad>;
use <zcube.scad>;

difference() {
	hull() {
		zcube([30, 50, 1]);
		zcube([30, 40, 30]);
	}
	
	countersunk_hole(4, 4);
	
	rotate([10, 0, 0])
	translate([0, 4, 6 + sqrt(140*140+140*140)/2]) {
		rotate([0, 45, 0]) {
			cube([140, 25, 140], center=true);
			
			translate([124.5/2, -30, -124.5/2])
			rotate([-90, 0, 0])
			hole(4, 60);
		}
	}
	
	translate([0, 0, 25])
	rotate([10, 0, 0])
	zcube([50, 50, 50]);
}