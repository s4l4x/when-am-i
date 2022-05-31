$fn = 200; // number of fragments

// [] Get the actual width of the screen
// [] Position the screens properly
// [] Include gutter for ribbon cable

//--------------------------------------------
// Screen: two halves that sandwich the screen
//--------------------------------------------
bezelOuterRadius = 7.1;
screenBackThickness = 0.45; // 0.42

screwPositioningRadius = bezelOuterRadius - 0.25;
screwHeightFudge = 0.1;
screwHeight = 0.35 + screwHeightFudge;

screenTop = 6.85;
screenLeft = -6.6;
screenRight = -screenLeft;

module screenCutout() {
  // Top ribbon cable
  ribbonWidth = 3.1;
  ribbonHeight = 6.85;
  ribbonThickness = 0.05;
  translate([ -ribbonWidth / 2, screenTop - ribbonHeight, 0 ]) cube([ ribbonWidth, ribbonHeight, ribbonThickness ]);

  // Back ribbon cable
  backRibbonWidth = 1.5;
  backRibbonHeight = 3;
  backRibbonThickness = 5;
  backRibbonFromTop = 6.45;
  translate(
      [ 4.8 + screenLeft, screenTop - backRibbonFromTop - backRibbonThickness, -backRibbonHeight + ribbonThickness ])
      cube([ backRibbonWidth, backRibbonThickness, backRibbonHeight ]);

  // Screen geometry
  // Scanned files fit within a 1cm square
  // then we scale them back up to real world size in cm
  fileScale = 14.2;
  screenThickness = 0.5; // 0.225 actual, increased to 0.5 for boolean
  translate([ 0, 0, ribbonThickness ]) {
    linear_extrude(height = screenThickness) {
      rotate([ 0, 0, 180 ]) scale(fileScale) import("../scans/scan-to-geometry/screen.svg");
    }
  }
}

module screwPosts(count = 4, height = 4, diameter = 0.19, rotation = 0) {
  rotate([ 0, 0, rotation ]) {
    for (i = [0:count - 1]) {
      pos = i / count * 360;
      x = sin(pos) * screwPositioningRadius;
      y = cos(pos) * screwPositioningRadius;
      translate([ x, y, 0 ]) cylinder(r = diameter / 2, h = height, center = true);
    }
  }
}

module screenBack() {
  // Subtract the screenCutout from a disc
  difference() {
    cylinder(r = bezelOuterRadius, h = screenBackThickness);
    translate([ 0, 0, 0.1 ]) screenCutout();
    translate([ 0, 0, screenBackThickness - screwHeight / 2 + screwHeightFudge ])
        screwPosts(count = 4, height = screwHeight, diameter = 0.21, rotation = 45);
  }
  standWidth = 2;
  standHeight = 1;
  standThickness = 0.1;
  translate([ -standWidth / 2, -screenTop - standHeight, 0 ]) cube(size = [ standWidth, standHeight, standThickness ]);
}

module screenFront() {
  // Subtract two discs
  difference() {
    cylinder(r = bezelOuterRadius, h = 0.1);
    cylinder(r = screenRight - 0.28, h = 10, center = true);
  }
  postHeight = min(screwHeight, 0.15);
  translate([ 0, 0, -postHeight / 2 ]) screwPosts(count = 4, height = postHeight, diameter = 0.19, rotation = 45);
}

// translate([ 0, 0.25, screenBackThickness ]) {
//   screenFront();
// }
translate([ 0, 0.25, 0 ]) {
  screenBack();
}

//-------------------------------------
// Base: holds electronics, has ports
//-------------------------------------
// ...
