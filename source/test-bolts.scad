
include <bolts.scad>;

rotate(90, [1, 0, 0]) difference() {
	cube([20, 10, 10]);
	translate([5, 5, 0]) bolt(diameter=3, depth=8);
	translate([15, 5, 0]) bolt(diameter=4, depth=8);
}
