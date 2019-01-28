//mounting holes separation 62.5mm 311.5mm
//mounting holes to border 12.5mm to top 24mm to bottom
mounting_hole_A = 62.5;
mounting_hole_B = 311.5;
total_length = 318;
total_width = 98.50;
case_width = 120;
case_length = 325;
case_height = 27;

mounting_screws();
keyboard();
translate([-total_width/2, -total_length/2, -13])cube([total_width, total_length, 13]);

case();

module case(){
    color("Red"){
        difference(){
            hull(){
                translate([-case_width+60, case_length/2, case_height/2-case_height/3])rotate([90, 0, 0])cylinder(h=case_length/1,r = case_height/3);
                translate([-case_width+60, case_length/2, -(case_height/2-case_height/3)])rotate([90, 0, 0])cylinder(h=case_length/1,r = case_height/3);
                translate([case_width-60, case_length/2, case_height/2-case_height/3])rotate([90, 0, 0])cylinder(h=case_length/1,r = case_height/3);
                translate([case_width-60, case_length/2, -(case_height/2-case_height/3)])rotate([90, 0, 0])cylinder(h=case_length/1,r = case_height/3);
            }
            translate([-case_width+48, -(case_length-50)/2, (case_height/2-case_height/3)+1])cube([case_width,case_length-50,12]);
        }
        translate([case_width-70, -(case_length-40)/2, (case_height/2)])cube([5,case_length-40,5]);
    }
}

module case_old(){
    case_width = 110;
    case_length = 325;
    color("green"){
        //top
        //rotate([0, -main_angle, 0])translate([-case_width/2, -case_length/2, 10])cube([case_width, case_length, 1]);
        translate([-case_width+50/2+30, -case_length/2, 10])cube([case_width+20, case_length, 1]);
        //bottom
        
        //front cyl
        translate([-case_width+60, case_length/2, -7.5])rotate([90, 0, 0])cylinder(h=case_length/1,r = 12);
        
        difference(){
            translate([case_width-110/2, case_length/2, 0])rotate([90, 0, 0])cylinder(h=case_length,r = 20);
            //back cyl
            translate([case_width-110/2, case_length/2-6/2, 0])rotate([90, 0, 0])cylinder(h=case_length-6,r = 17);
            translate([case_width/2+20, case_length/2+40, 0])rotate([0,0,180])cube([40, case_length+80, 20]);
        }
        //horizontal
        translate([-case_width/2, -case_length/2, -20])cube([case_width, case_length, 1]);
        //back
        translate([case_width/2+20, case_length/2, 0])rotate([0,0,180])cube([3, case_length, 20]);
    }
}

module keyboard(){
    keyboard_thick_side = 8;
    keyboard_thick_centre = 15;
    length_centre = 270;
    length_total = 270+25+25;
    width = 99;
    
    translate([0,0,-10]){
        mounting_screws();
        translate([0,0,23])keycaps();
        //keycaps_bulk();
        translate([-width/2, -length_centre/2, 0])cube([width, length_centre, keyboard_thick_centre]);
        translate([-width/2, -length_total/2, keyboard_thick_side])cube([width, length_total, keyboard_thick_side]);
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
    rotate([0,0,270])import("../custom_keycaps/length-1.stl");
}

module key_and_half(){
    rotate([0,0,270])import("../custom_keycaps/length-1.5.stl");
}

module key_double(){
    rotate([0,0,270])import("../custom_keycaps/length-2.stl");
}

module spacebar(){
    rotate([0,0,270])import("../custom_keycaps/spacebar.stl");
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