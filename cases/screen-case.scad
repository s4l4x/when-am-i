$fn = 100; // number of fragments

// [] Get the actual width of the screen
// [] Position the screens properly
// [] Include gutter for ribbon cable

//--------------------------------------------
// Screen: two halves that sandwich the screen
//--------------------------------------------
screenOuterRadius = 14;

module screenCutout(height = 1) {
  linear_extrude(height = height, center = false) {
    // NOTE: Imported files fit within a 1cm box and then scaled to real world size
    scaleToCentimeters = 28;
    scale([ scaleToCentimeters, scaleToCentimeters, 1 ]) {
      import("../scans/scan-to-geometry/screen.svg");
    }
  }
  // FIXME: Include gutter for ribbon cable
}

module screenBack() {
  // Subtract the screenCutout from a disc
  difference() {
    // FIXME: Set this so that it's slightly higher than the screen
    linear_extrude(height = 0.5, center = false) circle(screenOuterRadius);
    // FIXME: Get the actual width of the screen
    translate([ 0, 0, 0.1 ]) screenCutout(1);
  }
}

module screenFront() {
  // Subtract two discs
  translate([ 0, 0, 2 ]) {
    difference() {
      linear_extrude(height = 0.2, center = true) circle(screenOuterRadius);
      linear_extrude(height = 2, center = true) circle(12.75);
    }
  }
}

screenFront();
screenBack();

//-------------------------------------
// Base: holds electronics, has ports
//-------------------------------------
// ...
