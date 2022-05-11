$fn = 100; // number of fragments
scaleHoudiniScanner = 28;

scale(scaleHoudiniScanner) {
  rotate([ 90, 0, 0 ]) {
    import("../scans/scan-to-geometry/screen-1-28.stl");
  }
}
