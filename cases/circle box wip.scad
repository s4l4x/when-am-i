
// Copyright 2022 by Excretia of Unconscious Processes, LLC



/*Set up some variables  */

$fa=4;      // minimum fragment angle (low number=high quality, def=12)
diam=128;   // diameter of the screen
dep=10;     // depth of the screen section


module screen_lid () {
    difference() {
        translate([0,0,(dep+3)/2])
            cylinder(h=dep+3, d=diam+6, center=true);
        translate([0,0,(dep)/2+3])
            cylinder(h=dep, d=diam, center=true);
    }
}


screen_lid();
