//mounting holes separation 62.5mm 311.5mm
//mounting holes to border 12.5mm to top 24mm to bottom
$fn = 255;

mounting_hole_A = 62.5;
mounting_hole_B = 311.5;

main_angle = 8;
bottom_angle = 2.5;

case_width = 130;
case_length = 310;
corner_inclination = 5;

top_case_height = 10;
bottom_case_height = 8;

wiggle_factor = 0.1;


complete_case();

module usb_support(){
    case_angle = 45;
    hole_separation = 30;
    usb_width = 10;
    usb_poke = 2;
    
    difference(){
        translate([-30,-(hole_separation+10)/2,-25/2])cube([30,hole_separation+10,usb_width+16]);

        
        translate([-usb_poke-0.01,-usb_width/2,0])cube([usb_width,usb_width,usb_width]);
        translate([-32,-(usb_width+5)/2,-5/2])cube([30,usb_width+5,usb_width+5]);
        rotate([0,case_angle,180])translate([3,-hole_separation+5,-9])cube([30,hole_separation+20,hole_separation+40]);

        
        translate([-10,hole_separation/2,usb_width/2])rotate([0,90,0])cylinder(h=20,r=1.5);
        translate([-10,-hole_separation/2,usb_width/2])rotate([0,90,0])cylinder(h=20,r=1.5);
    }
}

module usb_hole(){
    case_angle = 45;
    hole_separation = 30;
    usb_width = 10;
    usb_poke = 2;

    translate([-usb_poke-0.01,-usb_width/2,0])cube([usb_width,usb_width,usb_width]);
    translate([-32,-(usb_width+5)/2,-5/2])cube([30,usb_width+5,usb_width+5]);    
}

module usb_cutout_top(){
    case_angle = 45;
    hole_separation = 30;
    usb_width = 10;
    usb_poke = 2;
    translate([-10,-(hole_separation+10)/2-1,-25/2+1])cube([12,hole_separation+10+2,usb_width+16+2]);
}

module complete_case_cut(){
    difference(){
        union(){
            rotate([0,-main_angle,0]){
                //color("DimGray")keyboard();
                color("MediumPurple")top_case();
                color("PapayaWhip")bottom_case();
            }
        }
        translate([-70,0,-70])cube([150,140,150]);
    }
}

module complete_case(){
    rotate([0,-main_angle,0]){
        //color("DimGray")keyboard();
        color("MediumPurple")top_case();
        color("PapayaWhip")bottom_case();
    }
}

module top_case(){
    difference(){
        union(){
            difference(){
                top_case_block();
                interlock(1,9);
            }
            interlock(1,7);
        }
        keys_cutout();
        keyboard_base_cutout_top();
        screw_holes();
        translate([53,90,-23])rotate([0,-main_angle,180])usb_cutout_top();
    }
}

module bottom_case(){
    difference(){
        union(){
            difference(){
                bottom_case_block();
                interlock(1+wiggle_factor,7+wiggle_factor);
            }
            keyboard_support();
        }
        keyboard_base_cutout_bottom();
        translate([0,0,-12])rotate([0,bottom_angle,0])base_cutout();
        screw_holes();
        //#translate([0,0,-(top_case_height+bottom_case_height)-5])rotate([0,main_angle,0])branding();
        translate([0,0,-(top_case_height+bottom_case_height)-3.7 ])rotate([0,main_angle-2,0])branding();
        translate([53,90,-23])rotate([0,-main_angle,180])usb_hole();
    }
    translate([53,90,-23])rotate([0,-main_angle,180])usb_support();
}

module top_case_block(){
    translate([0,0,-top_case_height])difference(){
        hull(){
            translate([case_width/2,case_length/2,top_case_height/2-4])rotate([corner_inclination,-corner_inclination,0])cylinder(h=top_case_height+8, r = 8, center=true);
            translate([-case_width/2,case_length/2,top_case_height/2-4])rotate([corner_inclination,0,0])cylinder(h=top_case_height+8, r = 8, center=true);
            translate([case_width/2,-case_length/2,top_case_height/2-4])rotate([-corner_inclination,-corner_inclination,0])cylinder(h=top_case_height+8, r = 8, center=true);
            translate([-case_width/2,-case_length/2,top_case_height/2-4])rotate([-corner_inclination,0,0])cylinder(h=top_case_height+8, r = 8, center=true);
        }
        translate([-case_width/2-25,-(case_length+30)/2,top_case_height/2-3])rotate([0,-15,0])cube([40,case_length+30,20]);
        translate([-(case_width+30)/2,-(case_length+30)/2,-10])cube([case_width+30,case_length+30,10]);
    }
    translate([case_width-80, -(case_length-30)/2, -top_case_height+10])cube([5,case_length-30,5]);
}

module bottom_case_block(){
    translate([0,0,-(bottom_case_height+top_case_height)])difference(){
        hull(){
            translate([case_width/2,case_length/2,bottom_case_height/2+4])rotate([-corner_inclination,corner_inclination,0])cylinder(h=bottom_case_height+8, r = 8, center=true);
            translate([-case_width/2,case_length/2,bottom_case_height/2+4])rotate([-corner_inclination,0,0])cylinder(h=bottom_case_height+8, r = 8, center=true);
            translate([case_width/2,-case_length/2,bottom_case_height/2+4])rotate([corner_inclination,corner_inclination,0])cylinder(h=bottom_case_height+8, r = 8, center=true);
            translate([-case_width/2,-case_length/2,bottom_case_height/2+4])rotate([corner_inclination,0,0])cylinder(h=bottom_case_height+8, r = 8, center=true);
        }    
    	translate([-(case_width+30)/2,-(case_length+30)/2,bottom_case_height])cube([case_width+30,case_length+30,10]);
	    rotate([0,0,0])translate([(case_width+18)/2,(case_length+30)/2,-10.5])rotate([0,-bottom_angle,180])cube([case_width+18,case_length+30,10]);
    }
    translate([0,0,-15.2])rotate([0,bottom_angle,0])base();
}

module base(){
    A = case_width/2;
    B = case_length/2;
    base_taper = 20;
    base_taper2 = 5;
    back_taper = 10;
    front_height = 3;
    height = 10; //old value was 10, should be calc according to bottom_angle and main_angle
    color("green")polyhedron(
        points=[
            //base
            [A,B,0],//0 TR
            [A,-B,0],//1 BR
            [-(A+base_taper2),-(B-base_taper+base_taper2),0],//2 BL
            [-(A+base_taper2),B-base_taper+base_taper2,0],//3 TL
            //top
            [A-back_taper,B-base_taper,-height],//4 TR
            [A-back_taper,-(B-base_taper),-height],//5 BR
            [-A,-(B-base_taper),-front_height],//6 BL
            [-A,B-base_taper,-front_height]//7 TL
        ], 
        faces =[
            [0,1,2,3],  // bottom
            [4,5,1,0],  // front
            [7,6,5,4],  // top
            [5,6,2,1],  // right
            [6,7,3,2],  // back
            [7,4,0,3] // left
        ]
    );
}

module base_cutout(){
    A = case_width/2;
    B = case_length/2;
    base_taper = 20;
    base_taper2 = 5;
    back_taper = 10;
    front_height = 3;
    height = 10; //old value was 10, should be calc according to bottom_angle and main_angle
    color("green")polyhedron(
        points=[
            //base
            [A,B,10],//0 TR
            [A,-B,10],//1 BR
            [-(A+base_taper2),-(B-base_taper+base_taper2),0],//2 BL
            [-(A+base_taper2),B-base_taper+base_taper2,0],//3 TL
            //top
            [A-back_taper,B-base_taper,-height],//4 TR
            [A-back_taper,-(B-base_taper),-height],//5 BR
            [-A,-(B-base_taper),-front_height],//6 BL
            [-A,B-base_taper,-front_height]//7 TL
        ], 
        faces =[
            [0,1,2,3],  // bottom
            [4,5,1,0],  // front
            [7,6,5,4],  // top
            [5,6,2,1],  // right
            [6,7,3,2],  // back
            [7,4,0,3] // left
        ]
    );
}

module keyboard(){
    translate([0,0,-16]){
        translate([0,0,23])keycaps();
        //keys_cutout();
        keyboard_base();
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

module keyboard_base(){
    keyboard_thick_side = 8;
    keyboard_thick_centre = 15;
    length_centre = 270;
    length_total = 270+25+25;
    width = 99;
    translate([-width/2, -length_centre/2, 0])cube([width, length_centre, keyboard_thick_centre]);
    difference(){
        translate([-width/2, -length_total/2, keyboard_thick_side])cube([width, length_total, keyboard_thick_side]);
        mounting_screws();
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

module keycaps_bulk(){
    keyboard_width = 99;
    keyboard_length = 320;
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

module keys_cutout(){
    keyboard_width = 99;
    keyboard_length = 320;
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
    color("black"){
        translate([keyboard_width/2-d_to_top-1U,-keyboard_length/2 + 38,-0.1])cube([1U,row_1,18]);
        translate([keyboard_width/2-d_to_top-2*1U-spacing,-keyboard_length/2 + 29,-0.1])cube([1U+2,row_2,18]);
        translate([keyboard_width/2-d_to_top-3*1U-2*spacing,-keyboard_length/2 + 24.5,-0.1])cube([1U+2,row_3,18]);
        translate([keyboard_width/2-d_to_top-4*1U-3*spacing,-keyboard_length/2 + 43.5,-0.1])cube([1U+2,row_4,18]);
        translate([keyboard_width/2-d_to_top-5*1U-4*spacing,-keyboard_length/2 + 91,-0.1])cube([1U+2,spacebar,18]);
    }
}

module keyboard_base_cutout_top(){
    keyboard_thick_side = 8;
    keyboard_thick_centre = 15;
    length_centre = 270;
    length_total = 270+25+25;
    width = 99;
    translate([0,0,-16]){
        translate([-width/2, -length_centre/2, 0])cube([width, length_centre, keyboard_thick_centre]);
        difference(){
            translate([-width/2, -length_total/2, keyboard_thick_side])cube([width, length_total, keyboard_thick_side]);
            mounting_screws();
        }
    }
    translate([-width/2, -length_total/2, keyboard_thick_side-19])cube([width, length_total, keyboard_thick_side]);
}

module keyboard_base_cutout_bottom(){
    keyboard_thick_side = 8;
    keyboard_thick_centre = 15;
    length_centre = 270;
    length_total = 270+25+25;
    width = 99;
    translate([0,0,-16]){
        translate([-width/2, -length_centre/2, 0])cube([width, length_centre, keyboard_thick_centre]);
    }
}

module keyboard_support(){
    keyboard_thick_side = 8;
    length_total = 270+25+25;
    width = 99;
    support_width = 24;
    support_height = 10;
    steel_thick = 1;
    
    translate([0,0,-16]){
        translate([-width/2+steel_thick, -length_total/2, 2*keyboard_thick_side-support_height-steel_thick])cube([width-2*steel_thick, support_width, support_height]);
        translate([-width/2+steel_thick, length_total/2-support_width, 2*keyboard_thick_side-support_height-steel_thick])cube([width-2*steel_thick, support_width, support_height]);
        mounting_posts();
    }
}

module mounting_posts(){
    height = 11.2;
    diameter = 3.8;
    color("MediumSlateBlue")translate([0,0,5]){
        translate([mounting_hole_A/2, mounting_hole_B/2, 0])cylinder(h=height,d=diameter);
        translate([-mounting_hole_A/2, mounting_hole_B/2, 0])cylinder(h=height,d=diameter);
        translate([mounting_hole_A/2, -mounting_hole_B/2, 0])cylinder(h=height,d=diameter);
        translate([-mounting_hole_A/2, -mounting_hole_B/2, 0])cylinder(h=height,d=diameter);
    }
}

module interlock(height,radius){
    rotate([0,-0.05,0])translate([0,0,-top_case_height])hull(){
        translate([case_width/2,case_length/2,0])cylinder(h=height, r = radius, center=true);
        translate([-case_width/2,case_length/2,0])cylinder(h=height, r = radius, center=true);
        translate([case_width/2,-case_length/2,0])cylinder(h=height, r = radius, center=true);
        translate([-case_width/2,-case_length/2,0])cylinder(h=height, r = radius, center=true);
    }
}

module screw_hole(x,y,z,angle_x,,angle_y,angle_z){
    height = 10;
    diameter = 2.98;
    head_height = 30;
    head_diameter = 5;
    rotate([angle_x,angle_y,angle_z]){
        translate([x, y, z-height])cylinder(h=height,d=diameter);
        translate([x, y, z-(height+head_height-3)])cylinder(h=head_height,d=head_diameter);
    }
}

module screw_holes(){
    x = case_width/2;
    y = (1/3)*case_length+36;
    screw_hole(x,y,-5,0,0,0);
    screw_hole(x,-y,-5,0,0,0);
    screw_hole(-x+4 ,y-8,-4.5,0,0,0);
    screw_hole(-x+4,-y+8,-4.5,0,0,0);
}

module branding(){
    n = 0.2;
    rotate([0,180,270])scale([n,n,n/2])import("../RS.stl");
    translate([-25,-20,0])rotate([180,0,90])linear_extrude(height = 1) {
       text("keyboard", center=true, font="Bree Serif:style=Regular",size= 7);
     }
}
