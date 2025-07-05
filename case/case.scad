use <hggh/usb_c_breakout_case_holder.scad>
include <BOSL/constants.scad>
use <BOSL/metric_screws.scad>

$fn=190;

SIZE_X_OUTSIDE = 130;
SIDE_Y_OUTSIDE = 82;
SIZE_Z = 35-1.2;


module akku() {
    cube([75, 20, 20]);
}





module switch() {
    translate([6, 0, 0])
    rotate([0, 180, 0]) {
    difference() {
        cube([6, 20, 1]);
        
        translate([3, 2.5, 0]) cylinder(d=2-0.2, h=10);
        translate([3, 2.5+15, 0]) cylinder(d=2-0.2, h=10);
    }
    translate([0, 4, -29]) cube([6, 12, 29]);
    translate([0.5, 7, 1]) cube([5, 6, 5]);
    }
}

module case() {
    difference() {
        translate([SIZE_X_OUTSIDE/2, SIDE_Y_OUTSIDE/2, 0]) {
            linear_extrude(35) {
                resize([SIZE_X_OUTSIDE, SIDE_Y_OUTSIDE]) { 
                    circle(d=SIZE_X_OUTSIDE);
                }
            }
        }
    
        translate([(SIZE_X_OUTSIDE)/2, (SIDE_Y_OUTSIDE)/2, -1]) {
            linear_extrude(SIZE_Z + 1) {
                resize([SIZE_X_OUTSIDE-4, SIDE_Y_OUTSIDE-4]) { 
                    circle(d=SIZE_X_OUTSIDE);
                }
            }
        }
    
        //Schrauben
        translate([7.3, 38.250, -1]) {
            cube([5.5, 5.5, 50]);
        }
        translate([117.200, 38.25, -1]) {
            cube([5.5, 5.5, 50]);
        }
    
        // Display
        translate([49.6, 51, 0]) {
            cube([30.9, 14.5, 50]);
        }
    
        // Button left
        translate([30.6, 24.950, 0]) {
            cylinder(d=16.3, h=50);
        }
    
        // KY-040
        translate([99.4, 24.950, 0]) {
            cylinder(d=7.5, h=50);
        }
        //usb c connector
        translate([57.500, 0, 2.750]) {
            cube([15, 20,  9]);
        }
    }

    // lid stand left, right
    translate([2+1, SIDE_Y_OUTSIDE/2, 2]) {
        hull() {
            cylinder(d=2, h=SIZE_Z-0.8);
            translate([-1, 0, 0]) cylinder(d=2, h=SIZE_Z-0.8);
        }
    }
    translate([SIZE_X_OUTSIDE-2-1, SIDE_Y_OUTSIDE/2, 2]) {
        hull() {
            cylinder(d=2, h=SIZE_Z-0.8);
            translate([1, 0, 0]) cylinder(d=2, h=SIZE_Z-0.8);
        }
    }

    //lid stand top
    difference() {
        union() {
            translate([65, 78, 2]) {
                linear_extrude(SIZE_Z-.8) {
                    resize([37.187, 5.808]) { 
                        circle(d=37.187);
                    }
                }
            }
            translate([48.539, 71.810, 2]) {
                cube([32.923, 6.380, SIZE_Z-.8]);
            }
        }
        translate([55, 71+6, 4.9]) {
            rotate([0,0, 270])
            switch();
        }
        translate([55, 71, 0]) {
            cube([20, 6, 4]);
        }
    }

    // lid stand bottom
    translate([35.419, 8.615, 2]) {
        cylinder(d=7, h=SIZE_Z-0.8);
    }

    translate([89.837, 6.877, 2]) {
        cylinder(d=7, h=SIZE_Z-0.8);
    }


    // mutter holder
    translate([7.870, 49.084, 2]) {
        mutter_holder();
    }
    translate([SIZE_X_OUTSIDE-7.870, 49.084+10.080, 2]) {
        rotate([0, 0, 180])mutter_holder();
    }
    translate([99.4 - (16/2), 24.950 - (16/2), SIZE_Z - 4]) {
    difference() {
        cube([16, 16, 4]);
        translate([1.5, 1.5, -1]) cube([13, 13, 5]);
    }
}


//stand for battery holder
translate([28.6, 51.550, SIZE_Z-(12-1.2)]) {
    cube([9, 15, 12-1.2]);
}
translate([92.4, 51.550, SIZE_Z-(12-1.2)]) {
    cube([9, 15, 12-1.2]);
}

}



module mutter_holder() {
    difference() {
        cube([7.5, 10.08, SIZE_Z-0.8]);
        translate([7.5/2, 10.08/2, -1]) cylinder(d=3.25, h=50);
        
        translate([0, 2.2900-0.05, 4]) cube([12, 5.5+0.1, 3]);
    }
}



module lid() {
    difference() {
        union() {
            translate([SIZE_X_OUTSIDE/2, SIDE_Y_OUTSIDE/2, 0]) {
                linear_extrude(1.6) {
                    resize([SIZE_X_OUTSIDE-4-0.7, SIDE_Y_OUTSIDE-4-0.7]) { 
                        circle(d=SIZE_X_OUTSIDE);
                    }
                }
                
            }
            
            // PCB Holder
            translate([55, 2.9, 1.6]) {
                cube([20, 11, 12]);
            }
            translate([52, 3.4, 1.6]) {
                cube([3, 3, 12]);
            }
            translate([75, 3.4, 1.6]) {
                cube([3, 3, 12]);
            }
            
            //left notch
            translate([16.370, 39.164, 1.6]) {
                cube([7, 11+2.4, 5.3]);
            }
            //right notch
            translate([SIZE_X_OUTSIDE-7-16.370, 39.164, 1.6]) {
                cube([7, 11+2.4, 5.3]);
            }
            
        }
        translate([55, 2.9-0.1, 1.6+2+0.1]) {
            pcb();
        }
        translate([55, 5, 4]) cube([30, 30, 30]);
        //left notch
        translate([17.720, 39.164+1.2, 1.6]) {
            cube([4.3, 11, 30]);
            translate([0, 0, -2]) {
                cube([4.3, 5.3, 2.6]);
            }
        }
        //right notch
        translate([SIZE_X_OUTSIDE-4.3-17.720, 39.164+1.2, 1.6]) {
            cube([4.3, 11, 30]);
            translate([0, 0, -2]) {
                cube([4.3, 5.3, 2.6]);
            }
        }

        // screws
        translate([11.620, 54.124, -1]) {
            cylinder(d=3.2, h=10);
        }
        translate([SIZE_X_OUTSIDE-11.620, 54.124, -1]) {
            cylinder(d=3.2, h=10);
        }
        
        // on/off switch
        translate([61, 72.250, -1]) {
            cube([8, 3.5, 10]);
        }

        translate([SIZE_X_OUTSIDE/2, SIDE_Y_OUTSIDE/2, 0])
        linear_extrude(0.2) {
            rotate([0, 180,0])
        text("B & S",
            size=18,
            font = "Noto Sans:style=SemiBold",
            halign="center",
            valign="center",
            $fn=190
        );
        }
    }  
}



module notch_lid() {
    
    difference() {
        cube([7+2.4, 11+2.4+1.2, 3]);
        translate([1.2, 1.2, 0])cube([7, 11+2.4, 2]);
        
        translate([0, 5, 0]) cube([50, 50, 50]);
    }
    translate([1.2, 0, 2]) cube([7, 11+2.4+1.2, 1]);
}

translate([0, 0, -30]) {
    //case();
}


translate([0, 0, -50]) {
   //lid();
/*
    translate([SIZE_X_OUTSIDE/2, SIDE_Y_OUTSIDE/2, 0]) {
        linear_extrude(0.2) {
            rotate([0, 180,0])
        text("B & S",
            size=18,
            font = "Noto Sans:style=SemiBold",
            halign="center",
            valign="center",
            $fn=190
        );
        }
    }
 */
}

//notch_lid();





module usb() {
    
    difference() {
        union() {
      
            
            // PCB Holder
            translate([55, 2.9, 1.6]) {
                cube([20, 11, 12]);
            }
            translate([52, 3.4, 1.6]) {
                cube([3, 3, 12]);
            }
            translate([75, 3.4, 1.6]) {
                cube([3, 3, 12]);
            }
            

            
        }
        translate([55, 2.9-0.1, 1.6+2+0.1]) {
            pcb();
        }
        translate([55, 5, 4]) cube([30, 30, 30]);


        // screws
        translate([11.620, 54.124, -1]) {
            cylinder(d=3.2, h=10);
        }
        translate([SIZE_X_OUTSIDE-11.620, 54.124, -1]) {
            cylinder(d=3.2, h=10);
        }
        
        // on/off switch
        translate([61, 72.250, -1]) {
            cube([8, 3.5, 10]);
        }

        
    }  

}

usb();