cutter(0);
#cutter(1);

module cutter(side = 0){
    if (side == 0){
        difference(){
            translate([0,200.01,0])cube([200,400,50], center = true);
            translate([0,-200,0])cube([200,400,50], center = true);
            tab(0);
            tab(-50);
            tab(50);
        }
    } else {
        translate([0,-200,0])cube([200,400,50], center = true);
        tab(0);
        tab(-50);
        tab(50);
    }
}

module tab(distance){
    tab_deep = 7;
    difference(){
        translate([distance,tab_deep-0.1,0])scale([1,1,9])rotate([90,0,0])linear_extrude(height = tab_deep, scale = 14/17) square(15, center = true);
        translate([0,0,-50.001])cube([210,210,50], center = true);
        translate([0,0,50.001])cube([210,210,50], center = true);
    }
}
