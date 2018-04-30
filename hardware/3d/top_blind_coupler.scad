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

BEARING_HEIGHT = 25.0;
BEARING_WIDTH = 15.2;
ROD_SHAFT_HEIGHT = BEARING_HEIGHT;
ROD_SHAFT_WIDTH = BEARING_WIDTH + 4;

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

// top shelf
difference() {
    cylinder(h=PLATFORM_HEIGHT, d=BASE_WIDTH);
    
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