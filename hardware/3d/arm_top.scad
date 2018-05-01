echo(version=version());

// units in mm
BASE_WIDTH = 113.0;
BASE_HEIGHT = 53.0;
BASE_WALL = 4.0;
INNER_RIDGE_HEIGHT = 6.0;
INNER_RIDGE_WIDTH = 2.0;

PLATFORM_WIDTH = 100.0;
PLATFORM_HEIGHT = 4.0;

SUPPORT_WIDTH = BASE_WIDTH - INNER_RIDGE_WIDTH * 4;
SUPPORT_HEIGHT = 20.0;

ROD_WIDTH = 8.1; // m8 
ROD_DEPTH = 10.0;
ROD_PLACEMENT = (BASE_WIDTH - INNER_RIDGE_WIDTH * 4) / 4;

ROD_SHAFT_HEIGHT = 2 * ROD_WIDTH + 4;
ROD_SHAFT_WIDTH = ROD_WIDTH + 4;

STEPPER_ROD_NUT_WIDTH = 13.0;
STEPPER_ROD_HEIGHT = ROD_SHAFT_HEIGHT;
STEPPER_ROD_NUT_WALL = STEPPER_ROD_NUT_WIDTH + 4;

// stepper dims
STEPPER_WIDTH = 42.3;
STEPPER_HEIGHT = 33.0;
STEPPER_SCREW_SPACE = 31.0; 
STEPPER_HALF_SPACE = STEPPER_SCREW_SPACE / 2;
STEPPER_SCREW_SIZE = 3.1; // m3
STEPPER_SHAFT = 7.0;

ARM_ROD_SUPPORT_DEPTH = ROD_SHAFT_HEIGHT;
ARM_ROD_SUPPORT_HEIGHT = ROD_SHAFT_WIDTH;
ARM_ROD_SUPPORT_WIDTH = ROD_SHAFT_WIDTH;

// top shelf
difference() {
    cylinder(h=PLATFORM_HEIGHT, d=PLATFORM_WIDTH);
    
    // stepper shaft
    cylinder(h=PLATFORM_HEIGHT, d=ROD_WIDTH);
    
    // support rods
    translate([ROD_PLACEMENT, ROD_PLACEMENT, 0])
        cylinder(h=ROD_DEPTH, d=ROD_WIDTH);
    translate([-1 * ROD_PLACEMENT, ROD_PLACEMENT, 0])
        cylinder(h=ROD_DEPTH, d=ROD_WIDTH);
    translate([ROD_PLACEMENT, -1 * ROD_PLACEMENT, 0])
        cylinder(h=ROD_DEPTH, d=ROD_WIDTH);
    
     // bottom/top connections
     translate([ROD_PLACEMENT, 0, 0])
        cylinder(h=PLATFORM_HEIGHT, d=STEPPER_SCREW_SIZE);
     translate([-1 * ROD_PLACEMENT, 0, 0])
        cylinder(h=PLATFORM_HEIGHT, d=STEPPER_SCREW_SIZE);
     translate([0, ROD_PLACEMENT, 0])
        cylinder(h=PLATFORM_HEIGHT, d=STEPPER_SCREW_SIZE);
    translate([0, -1 * ROD_PLACEMENT, 0])
        cylinder(h=PLATFORM_HEIGHT, d=STEPPER_SCREW_SIZE);
}

// rod support + bearing housing
rotate(a=[90, 0, 135]) {
    // middle support
    translate([ROD_PLACEMENT / 2, 0, -1 * ROD_WIDTH - 2]) {
        difference() {
            union() {
                cube([ARM_ROD_SUPPORT_WIDTH, ARM_ROD_SUPPORT_HEIGHT, ARM_ROD_SUPPORT_DEPTH]);
                translate([ARM_ROD_SUPPORT_WIDTH / 2, ARM_ROD_SUPPORT_HEIGHT, 0]) {
                    cylinder(h=ROD_SHAFT_HEIGHT, d=ROD_SHAFT_WIDTH);
                }
            }
            translate([ARM_ROD_SUPPORT_WIDTH / 2, ARM_ROD_SUPPORT_HEIGHT, 0]) {
                cylinder(h=ROD_SHAFT_HEIGHT, d=ROD_WIDTH);
            }
        }
    
        // back support
        translate([0, 0, 40])
        difference() {
            union() {
                cube([ARM_ROD_SUPPORT_WIDTH, ARM_ROD_SUPPORT_HEIGHT, ARM_ROD_SUPPORT_DEPTH / 2]);
                translate([ARM_ROD_SUPPORT_WIDTH / 2, ARM_ROD_SUPPORT_HEIGHT, 0]) {
                    cylinder(h=ROD_SHAFT_HEIGHT / 2, d=ROD_SHAFT_WIDTH);
                }
            }
            translate([ARM_ROD_SUPPORT_WIDTH / 2, ARM_ROD_SUPPORT_HEIGHT, 0]) {
                cylinder(h=ROD_SHAFT_HEIGHT / 4, d=ROD_WIDTH);
            }
        }
    }

    translate([-1 * ROD_PLACEMENT, 0, -1 * ROD_WIDTH - 2]) {
        difference() {
            union() {
                cube([ARM_ROD_SUPPORT_WIDTH, ARM_ROD_SUPPORT_HEIGHT, ARM_ROD_SUPPORT_DEPTH]);
                translate([ARM_ROD_SUPPORT_WIDTH / 2, ARM_ROD_SUPPORT_HEIGHT, 0])
                    cylinder(h=ROD_SHAFT_HEIGHT, d=ROD_SHAFT_WIDTH);
            }
            translate([ARM_ROD_SUPPORT_WIDTH / 2, ARM_ROD_SUPPORT_HEIGHT, 0])
                cylinder(h=ROD_SHAFT_HEIGHT, d=ROD_WIDTH);
        }
        
        // back support
        translate([0, 0, 40])
        difference() {
            union() {
                cube([ARM_ROD_SUPPORT_WIDTH, ARM_ROD_SUPPORT_HEIGHT, ARM_ROD_SUPPORT_DEPTH / 2]);
                translate([ARM_ROD_SUPPORT_WIDTH / 2, ARM_ROD_SUPPORT_HEIGHT, 0])
                    cylinder(h=ROD_SHAFT_HEIGHT / 2, d=ROD_SHAFT_WIDTH);
            }
            translate([ARM_ROD_SUPPORT_WIDTH / 2, ARM_ROD_SUPPORT_HEIGHT, 0])
                cylinder(h=ROD_SHAFT_HEIGHT / 4, d=ROD_WIDTH);
        }
    }
    
    // middle support
    translate([-1 * ROD_PLACEMENT / 2 + ARM_ROD_SUPPORT_WIDTH / 2 + 1, 0, -1 * ROD_PLACEMENT]) {
        difference() {
            union() {
                cube([ARM_ROD_SUPPORT_WIDTH, ARM_ROD_SUPPORT_HEIGHT, ARM_ROD_SUPPORT_DEPTH]);
                translate([ARM_ROD_SUPPORT_WIDTH / 2, ARM_ROD_SUPPORT_HEIGHT, 0]) {
                    cylinder(h=ROD_SHAFT_HEIGHT, d=ROD_SHAFT_WIDTH);
                }
            }
            translate([ARM_ROD_SUPPORT_WIDTH / 2, ARM_ROD_SUPPORT_HEIGHT, 0]) {
                cylinder(h=ROD_SHAFT_HEIGHT, d=ROD_WIDTH);
            }
        }
    }
}

difference() {
    union() {
        cylinder(h=ROD_SHAFT_HEIGHT, d=ROD_SHAFT_WIDTH);
        translate([ROD_SHAFT_WIDTH / 2, -2.5, 0]) {
            rotate(a=135) {
                cube([ROD_SHAFT_WIDTH, ROD_SHAFT_WIDTH, ROD_SHAFT_HEIGHT]);
            }
        }
    }
    cylinder(h=ROD_SHAFT_HEIGHT, d=ROD_WIDTH);
}