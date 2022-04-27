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
  pegRadius = 10;
  pegThickness = 4;
  for (i = [0:11]) {
    r = totalOuterRadius - totalInset - pegRadius - pegInset;
    translate([ sin(i * 30) * r, cos(i * 30) * r, 5 ]) {
      cylinder(r = pegRadius, h = pegThickness);
    }
  }
}
