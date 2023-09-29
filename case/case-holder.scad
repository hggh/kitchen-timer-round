use <hggh/usb_c_breakout_case_holder.scad>

$fn=190;

SIZE_X_OUTSIDE = 130;
SIDE_Y_OUTSIDE = 82;
SIZE_Z = 35-1.2;

module key() {
    difference() {
        cube([3.5, 4.5, 5]);
        translate([0, 2.5, 0]) {
            cube([10, 10, 2]);
        }
    }
}

translate([17.870 - 2, 39.164 , 0]) {
    cube([94.260 + 2 + 2, 5, 6]);
    
    translate([(94.260 + 2 + 2)/2 - 8, 0-16, 0]) {
        cube([16, 16, 6]);
    }
}
translate([18.120, 39.164, 6]) {
    key();
}
translate([SIZE_X_OUTSIDE-18.120-3.5, 39.164, 6]) {
    key();
}

translate([47.010, 33.750+6, 0]) {
    cube([36, 18, 2]);
}