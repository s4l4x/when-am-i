$fn = 100; // number of fragments

body();

module body() {
  totalOuterRadius = 130;
  totalInset = 10;
  totalThickness = 10;
  difference() {
    cylinder(r = totalOuterRadius, h = totalThickness);
    translate([ 0, 0, 5 ]) {
      cylinder(r = totalOuterRadius - totalInset, h = totalThickness);
    }
  }

  // Numbers
  pegInset = 7;
  pegRadius = 4;
  pegThickness = 5;
  count = 24;
  for (i = [0:count - 1]) {
    r = totalOuterRadius - totalInset - pegRadius - pegInset;
    translate([ sin(i * 360 / count) * r, cos(i * 360 / count) * r, 5 ]) {
      cylinder(r = pegRadius, h = pegThickness);
    }
  }
}
