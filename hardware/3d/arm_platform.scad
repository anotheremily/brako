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

ROD_WIDTH = 8.5; // m8 
ROD_DEPTH = 10.0;
ROD_PLACEMENT = (BASE_WIDTH - INNER_RIDGE_WIDTH * 4) / 4;

BEARING_HEIGHT = 25.0;
BEARING_WIDTH = 15.2;
ROD_SHAFT_HEIGHT = BEARING_HEIGHT;
ROD_SHAFT_WIDTH = BEARING_WIDTH + 4;

STEPPER_ROD_NUT_WIDTH = 16.0;
STEPPER_ROD_HEIGHT = 5.0;
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
translate([0, 0, PLATFORM_HEIGHT]) {
    translate([ROD_PLACEMENT, ROD_PLACEMENT, 0])
        difference() {
            cylinder(h=ROD_SHAFT_HEIGHT, d=ROD_SHAFT_WIDTH);
            cylinder(h=ROD_SHAFT_HEIGHT, d=BEARING_WIDTH);
        }
        
    translate([-1 * ROD_PLACEMENT, ROD_PLACEMENT, 0])
        difference() {
            cylinder(h=ROD_SHAFT_HEIGHT, d=ROD_SHAFT_WIDTH);
            cylinder(h=ROD_SHAFT_HEIGHT, d=BEARING_WIDTH);
        }
        
    translate([ROD_PLACEMENT, -1 * ROD_PLACEMENT, 0])
        difference() {
            cylinder(h=ROD_SHAFT_HEIGHT, d=ROD_SHAFT_WIDTH);
            cylinder(h=ROD_SHAFT_HEIGHT, d=BEARING_WIDTH);
        }
}

 // m8 stepper rod
translate([0, 0, PLATFORM_HEIGHT])
rotate([0, 0, 15])
     difference() {
        cylinder($fn=6, h=STEPPER_ROD_HEIGHT, d=STEPPER_ROD_NUT_WALL);
        cylinder($fn=6, h=STEPPER_ROD_HEIGHT, d=STEPPER_ROD_NUT_WIDTH);
     }
  