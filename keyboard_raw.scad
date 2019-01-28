mounting_hole_A = 62.5;
mounting_hole_B = 311.5;

keyboard();

module keyboard(){
    keyboard_thick_side = 8;
    keyboard_thick_centre = 15;
    length_centre = 270;
    length_total = 270+25+25;
    width = 99;
    
    translate([0,0,-16]){
        translate([0,0,23])keycaps();
        difference(){
            union(){
                translate([-width/2, -length_centre/2, 0])cube([width, length_centre, keyboard_thick_centre]);
                translate([-width/2, -length_total/2, keyboard_thick_side])cube([width, length_total, keyboard_thick_side]);
            }
        mounting_screws();
        }
    }
}

module mounting_screws(){
    height = 16.2;
    diameter = 4;
    color("MediumSlateBlue"){
        translate([mounting_hole_A/2, mounting_hole_B/2, 0])cylinder(h=height,d=diameter);
        translate([-mounting_hole_A/2, mounting_hole_B/2, 0])cylinder(h=height,d=diameter);
        translate([mounting_hole_A/2, -mounting_hole_B/2, 0])cylinder(h=height,d=diameter);
        translate([-mounting_hole_A/2, -mounting_hole_B/2, 0])cylinder(h=height,d=diameter);
    }
}

module key(){
    rotate([0,0,270])import("./custom_keycaps/length-1.stl");
}

module key_and_half(){
    rotate([0,0,270])import("./custom_keycaps/length-1.5.stl");
}

module key_double(){
    rotate([0,0,270])import("./custom_keycaps/length-2.stl");
}

module spacebar(){
    rotate([0,0,270])import("./custom_keycaps/spacebar.stl");
}

module keycaps(){
    //translate([0,0,-7])cube([20,20,20]);//spacer
    //row 1
    translate([-40,7,0])spacebar();
    //row 2
    translate([-21,-100,0]){
        key_and_half();
        translate([0,23.5,0])for(i = [0 : 9]){
            translate([0,19*i,0])key();
        }
        translate([0,28+19*10,0])key_and_half();
    }
    //row 3
    translate([-2,-125,0]){
        translate([0,0,0])key();
        translate([0,28.5,0])key_double();
        translate([0,57,0])for(i = [0 : 10]){
            translate([0,19*i,0])key();
        }
    }
    //row 4
    translate([17,-120,0])for(i = [0 : 13]){
        translate([0,19*i,0])key();
    }
    //row 5
    translate([36,-112,0])for(i = [0 : 12]){
        translate([0,19*i,0])key();
    }
}