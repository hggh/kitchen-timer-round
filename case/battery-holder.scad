use <hggh/usb_c_breakout_case_holder.scad>
include <BOSL/constants.scad>
use <BOSL/metric_screws.scad>

$fn=190;

module mutterr() {
    difference() {
        cube([10, 10, 14]);
        translate([5, 5, 0]) {
            cylinder(d=3.2, h=20);
            cylinder(r = 5.5 / 2 / cos(180 / 6) + 0.05, h=8, $fn=6);
        }
        translate([0, 0, 10]) cube([8.5, 8.5, 20]);
    }
    translate([20, 10, 0]) cube([9, 15, 12-1.2]);
}


mutterr();
translate([0, 20, 0]) holderr();



module holderr () {    
    cube([7, 2, 10]);
    
    translate([7, 3, 0]) {
        difference() {
            union() {
                translate([0, -3, 0]) cube([2, 10, 10]);
                translate([1, 0, 0])
                cube([8.5, 8.5, 2]);
            }
            translate([5+1, 5, -1]) cylinder(d=3.2, h=10);
            //translate([0, 1, -1]) cube([7, 7, 1.8]);
        }
    }
}

