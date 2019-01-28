//mounting holes separation 62.5mm 311.5mm
//mounting holes to border 12.5mm to top 24mm to bottom
//$fn = 255;

mounting_hole_A = 62.5;
mounting_hole_B = 311.5;
keyboard_length = 318;
keyboard_width = 98.50;

main_angle = 8;
bottom_angle = 2.5;

case_width = 130;
case_length = 310;
corner_inclination = 5;

top_case_height = 10;
bottom_case_height = 8;

total_case_height = 20;


complete_case();
translate([0,0,-15.5])rotate([0,-(main_angle-bottom_angle),0])base3();

module complete_case(){
    union(){
        rotate([0,-main_angle,0]){
            keyboard();
            #color("MediumPurple")top_case();
            #color("red")bottom_case();
        }
    }
}

module top_case(){
    translate([0,0,-top_case_height])difference(){
        hull(){
            translate([case_width/2,case_length/2,top_case_height/2-4])rotate([corner_inclination,-corner_inclination,0])cylinder(h=top_case_height+8, r = 8, center=true);
            translate([-case_width/2,case_length/2,top_case_height/2])cylinder(h=top_case_height,r = 8, center=true);
            translate([case_width/2,-case_length/2,top_case_height/2-4])rotate([-corner_inclination,-corner_inclination,0])cylinder(h=top_case_height+8,r = 8, center=true);
            translate([-case_width/2,-case_length/2,top_case_height/2])cylinder(h=top_case_height,r = 8, center=true);
        }
        translate([-case_width/2-25,-(case_length+30)/2,top_case_height/2-3])rotate([0,-15,0])cube([40,case_length+30,20]);
        translate([-(case_width+30)/2,-(case_length+30)/2,-10])cube([case_width+30,case_length+30,10]);
    }
}

module bottom_case(){
    translate([0,0,-(bottom_case_height+top_case_height)])difference(){
        hull(){
            translate([case_width/2,case_length/2,bottom_case_height/2+4])rotate([-corner_inclination,corner_inclination,0])cylinder(h=bottom_case_height+8,r = 8, center=true);
            translate([-case_width/2,case_length/2,bottom_case_height/2])cylinder(h=bottom_case_height,r = 8, center=true);
            translate([case_width/2,-case_length/2,bottom_case_height/2+4])rotate([corner_inclination,corner_inclination,0])cylinder(h=bottom_case_height+8,r = 8, center=true);
            translate([-case_width/2,-case_length/2,bottom_case_height/2])cylinder(h=bottom_case_height,r = 8, center=true);
        }    
    	translate([-(case_width+30)/2,-(case_length+30)/2,bottom_case_height])cube([case_width+30,case_length+30,10]);
	    rotate([0,0,0])translate([(case_width+18)/2,(case_length+30)/2,-10.5])rotate([0,-bottom_angle,180])cube([case_width+18,case_length+30,10]);
    }
}

module base(){
    A = case_width/2;
    B = case_length/2;
    base_taper = 20;
    back_taper = 10;
    height = 10; //old value was 10, should be calc according to bottom_angle and main_angle
    color("green")polyhedron(
        points=[
            [A,B,0],[A,-B,0],[-A,-(B-base_taper),0],[-A,B-base_taper,0],//base
            [A-back_taper,-(B-base_taper),-height],[A-back_taper,B-base_taper,-height]
        ], 
        faces =[
            [0,3,2,1],//base
            [0,1,4,5],//back
            [0,5,3],//side
            [1,2,4],//side
            [2,3,5,4]//top
        ]
    );
}

module base2(){
    A = case_width/2;
    B = case_length/2;
    base_taper = 20;
    back_taper = 10;
    front_height = 3;
    height = 10; //old value was 10, should be calc according to bottom_angle and main_angle
    color("green")polyhedron(
        points=[
            [A,B,0],[A,-B,0],[-A,-(B-base_taper),0],[-A,B-base_taper,0],//base
            [A-back_taper,-(B-base_taper),-height],[A-back_taper,B-base_taper,-height],
            [-A,B-base_taper,-front_height],[-A,-(B-base_taper),-front_height]
        ], 
        faces =[
            [0,3,2,1],//base
            [0,1,4,5],//back
            [0,5,6,3],//side
            [1,2,7,4],//side
            [2,3,6,7],//front
            [7,6,5,4]//top
        ]
    );
}

module base3(){
    A = case_width/2;
    B = case_length/2;
    base_taper = 20;
    base_taper2 = 5;
    back_taper = 10;
    front_height = 3;
    height = 10; //old value was 10, should be calc according to bottom_angle and main_angle
    color("green")polyhedron(
        points=[
            [A,B,0],[A,-B,0],[-(A+base_taper2),-(B-base_taper+base_taper2),0],[-(A+base_taper2),B-base_taper+base_taper2,0],//base
            [A-back_taper,-(B-base_taper),-height],[A-back_taper,B-base_taper,-height],
            [-A,B-base_taper,-front_height],[-A,-(B-base_taper),-front_height]
        ], 
        faces =[
            [0,3,2,1],//base
            [0,1,4,5],//back
            [0,5,6,3],//side
            [1,2,7,4],//side
            [2,3,6,7],//front
            [7,6,5,4]//top
        ]
    );
}

module keyboard(){
    keyboard_thick_side = 8;
    keyboard_thick_centre = 15;
    length_centre = 270;
    length_total = 270+25+25;
    width = 99;
    
    translate([0,0,-16]){
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

module keycaps_bulk(){
    d_to_top = 3;
    d_to_bot = 1;
    1U = 18;
    1point5U = 28;
    2U = 36;
    spacebar = 150;
    spacing = 1;
    row_1 = 13*1U + 12*spacing;
    row_2 = 14*1U + 13*spacing;
    row_3 = 12*1U + 2U + 13*spacing;
    row_4 = 2*1point5U + 10*1U + 11*spacing;
    color("Green"){
        translate([keyboard_width/2-d_to_top-1U,-keyboard_length/2 + 38,0])cube([1U,row_1,18]);
        translate([keyboard_width/2-d_to_top-2*1U-spacing,-keyboard_length/2 + 29,0])cube([1U,row_2,18]);
        translate([keyboard_width/2-d_to_top-3*1U-2*spacing,-keyboard_length/2 + 24.5,0])cube([1U,row_3,18]);
        translate([keyboard_width/2-d_to_top-4*1U-3*spacing,-keyboard_length/2 + 43.5,0])cube([1U,row_4,18]);
        translate([keyboard_width/2-d_to_top-5*1U-4*spacing,-keyboard_length/2 + 91,0])cube([1U,spacebar,18]);
    }
}
