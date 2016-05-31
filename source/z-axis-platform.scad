
$fs = 0.01;

include <bolts.scad>;

module support() {
	translate([3, 0, 1]) rotate(90, [0, -1, 0]) linear_extrude(height=8, scale=[1, 2.5]) square([6, 5], center=true);
}

base_thickness = 8;
bar_tolerance = 0.6;
bar_offset = 17;
support_rotation = 60.0;
support_rotations = [support_rotation, -support_rotation];

skew = [[2, 0, -1.8, 0],
        [0, 0.8, 0, 0],  // The "0.8" is the skew value; pushed along the y axis
        [0, 0, 1, 0],
        [0, 0, 0, 1]]; 

difference() {
	union() {
		color("green") translate([0, 0, base_thickness/2]) difference() {
			cube([54, 42, base_thickness], center=true);
			translate([-15, 0, 0]) cube([30, 20, base_thickness], center=true);
		}
		
		translate([0,0,2]) {
			translate([bar_offset, 0, 2]) cylinder(h=10, d=18);
			for(i = support_rotations) {
				translate([bar_offset, 0, 0]) rotate(i, [0, 0, 1]) {
					translate([10, 0, 8]) support();
				}
			}
			
			for(i = support_rotations) {
				translate([bar_offset, 0, 0]) rotate(180-i, [0, 0, 1]) {
					translate([10, 0, 8]) multmatrix(skew) support();
				}
			}
		}
	}
	translate([0, 0, -1]) {
		cylinder(h=22, d=22.5);
	}
	for(i = [0:90:360]) {
		rotate(45+i, [0, 0, 1]) translate([43.81/2, 0, 0]) hole(depth=8, inset=0);
	}
	translate([bar_offset, 0, 0]) {
		translate([0, 0, -1]) cylinder_outer(22, 4);
		
		for(i = support_rotations) {
			rotate(i, [0, 0, 1]) {
				translate([3, 0, 11]) {
					rotate(90, [0,0,1]) rotate(90, [1,0,0]) bolt(depth=10, nut_offset=2, inset=0);
				}
			}
		}
	}
	
	// 6 holes around outside
	for(i = [90:180:360]) {
		rotate(i, [0, 0, 1]) {
			translate([14, -22, 4]) rotate(90, [0,0,1]) rotate(90, [1,0,0]) bolt();
			translate([14, 0, 4]) rotate(90, [0,0,1]) rotate(90, [1,0,0]) bolt();
			translate([14, 22, 4]) rotate(90, [0,0,1]) rotate(90, [1,0,0]) bolt();
		}
	}
}
