
width = 22;

bar_offset = [-54.8, -26, 0];

use <bolts.scad>;

module ugrip(height=6) {
	cylinder(d=22, h=height);
	translate([-11, -12, 0]) cube([22, 12, height]);
}

difference() {
	union() {
		hull() {
			translate([-5, -4, 0]) cube([44 + 10, 8, 6]);
			translate(bar_offset) ugrip(6);
		}
		translate(bar_offset) ugrip(12);
	}
	hull() {
		translate(bar_offset) {
			cylinder_outer(12, 4);
			rotate(angle, [0, 0, 1]) translate([0, -20, 0]) cylinder_outer(12, 4);
		}
	}
	translate(bar_offset + [-12, -7, 6]) rotate(90, [0,0,1]) rotate(90, [1,0,0]) bolt(depth=23, inset=30);
	translate([0, 0, 0]) hole();
	translate([22, 0, 0]) hole();
	translate([44, 0, 0]) hole();
	
	//translate([0, 0, 11]) cube([140, 100, 20], true);
	//translate(bar_offset + [20, 0, 0]) cube([12, 30, 20], true);
}

