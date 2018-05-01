echo(version=version());

// units in mm
BASE_WIDTH = 113.0;
BASE_HEIGHT = 43.0;
BASE_WALL = 4.0;
INNER_RIDGE_HEIGHT = 6.0;
INNER_RIDGE_WIDTH = 2.0;

SUPPORT_WIDTH = BASE_WIDTH - INNER_RIDGE_WIDTH * 4;
SUPPORT_HEIGHT = 20.0;

RISER_HEIGHT = 4.0;

ROD_WIDTH = 8.1; // m8 
ROD_DEPTH = 10.0;

// stepper dims
STEPPER_WIDTH = 42.3;
STEPPER_HEIGHT = 33.0;
STEPPER_SCREW_SPACE = 31.0; 
STEPPER_HALF_SPACE = STEPPER_SCREW_SPACE / 2;
STEPPER_SCREW_SIZE = 3.1; // m3
STEPPER_SHAFT = 7.0;

ACCESS_HOLE_WIDTH = 20;
ACCESS_HOLE_Z_OFFSET = 15;

// support 
difference() {
    cylinder(h=BASE_HEIGHT, d=SUPPORT_WIDTH);
    cylinder(h=BASE_HEIGHT - SUPPORT_HEIGHT, d=(SUPPORT_WIDTH - 2 * BASE_WALL));
    translate([-1 * STEPPER_WIDTH / 2, -1 *STEPPER_WIDTH / 2, BASE_HEIGHT - STEPPER_HEIGHT])
        cube([STEPPER_WIDTH, STEPPER_WIDTH, STEPPER_HEIGHT]);
    
    // support rods
    translate([SUPPORT_WIDTH / 4, SUPPORT_WIDTH / 4, BASE_HEIGHT - ROD_DEPTH])
        cylinder(h=ROD_DEPTH, d=ROD_WIDTH);
    translate([-1 * SUPPORT_WIDTH / 4, SUPPORT_WIDTH / 4, BASE_HEIGHT - ROD_DEPTH])
        cylinder(h=ROD_DEPTH, d=ROD_WIDTH);
    translate([SUPPORT_WIDTH / 4, -1 * SUPPORT_WIDTH / 4, BASE_HEIGHT - ROD_DEPTH])
        cylinder(h=ROD_DEPTH, d=ROD_WIDTH);
    
    
    translate([SUPPORT_WIDTH / 2 - BASE_WALL * 2, 0, ACCESS_HOLE_Z_OFFSET])
    rotate ([0, 90, 0]) 
        cylinder(h=BASE_WALL * 4, d=ACCESS_HOLE_WIDTH);   
}

// top shelf
translate([0, 0, BASE_HEIGHT])
    difference() {
        cylinder(h=RISER_HEIGHT, d=BASE_WIDTH);
        
        // stepper shaft
        cylinder(h=RISER_HEIGHT, d=STEPPER_SHAFT);
        
        // stepper mounting screws
        translate([STEPPER_HALF_SPACE, STEPPER_HALF_SPACE, 0])
            cylinder(h=RISER_HEIGHT, d=STEPPER_SCREW_SIZE);
        translate([-1 * STEPPER_HALF_SPACE, STEPPER_HALF_SPACE, 0])
            cylinder(h=RISER_HEIGHT, d=STEPPER_SCREW_SIZE);
        translate([-1 * STEPPER_HALF_SPACE, -1 * STEPPER_HALF_SPACE, 0])
            cylinder(h=RISER_HEIGHT, d=STEPPER_SCREW_SIZE);
        translate([STEPPER_HALF_SPACE, -1 * STEPPER_HALF_SPACE, 0])
            cylinder(h=RISER_HEIGHT, d=STEPPER_SCREW_SIZE);
        
        // support rods
        translate([SUPPORT_WIDTH / 4, SUPPORT_WIDTH / 4, 0])
            cylinder(h=ROD_DEPTH, d=ROD_WIDTH);
        translate([-1 * SUPPORT_WIDTH / 4, SUPPORT_WIDTH / 4, 0])
            cylinder(h=ROD_DEPTH, d=ROD_WIDTH);
        translate([SUPPORT_WIDTH / 4, -1 * SUPPORT_WIDTH / 4, 0])
            cylinder(h=ROD_DEPTH, d=ROD_WIDTH);
    }