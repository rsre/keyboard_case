//mounting holes separation 62.5mm 311.5mm
//mounting holes to border 12.5mm to top 24mm to bottom
//$fn = 255;

mounting_hole_A = 62.5;
mounting_hole_B = 311.5;
keyboard_length = 318;
keyboard_width = 98.50;

main_angle = 8;

case_width = 130;
case_length = 310;
corner_inclination = 5;

top_case_height = 10;
bottom_case_height = 5;

total_case_height = 20;


complete_case();
translate([0,0,-15.5])rotate([0,-(main_angle-2),0])base();

module complete_case(){
    union(){
        rotate([0,-main_angle,0]){
            keyboard();
            top_case();
            bottom_case();
        }
    }
}

module top_case(){
    translate([0,0,-total_case_height/2])difference(){
        hull(){
            translate([case_width/2,case_length/2,top_case_height/2-4])rotate([corner_inclination,-corner_inclination,0])cylinder(h=top_case_height+8, r = 8, center=true);
            translate([-case_width/2,case_length/2,top_case_height/2])cylinder(h=top_case_height,r = 8, center=true);
            translate([case_width/2,-case_length/2,top_case_height/2-4])rotate([-corner_inclination,-corner_inclination,0])cylinder(h=top_case_height+8,r = 8, center=true);
            translate([-case_width/2,-case_length/2,top_case_height/2])cylinder(h=top_case_height,r = 8, center=true);
        }
        translate([-case_width/2-25,-(case_length+30)/2,top_case_height/2-3])rotate([0,-15,0])cube([40,case_length+30,20]);
        translate([-(case_width+30)/2,-(case_length+30)/2,-total_case_height/2])cube([case_width+30,case_length+30,10]);
    }
}

module bottom_case(){
    translate([0,0,-(bottom_case_height+top_case_height)])rotate([0,2,0])difference(){
        hull(){
            translate([case_width/2,case_length/2,bottom_case_height/2+4])rotate([-corner_inclination,corner_inclination,0])cylinder(h=bottom_case_height+8,r = 8, center=true);
            translate([-case_width/2,case_length/2,bottom_case_height/2])cylinder(h=bottom_case_height,r = 8, center=true);
            translate([case_width/2,-case_length/2,bottom_case_height/2+4])rotate([corner_inclination,corner_inclination,0])cylinder(h=bottom_case_height+8,r = 8, center=true);
            translate([-case_width/2,-case_length/2,bottom_case_height/2])cylinder(h=bottom_case_height,r = 8, center=true);
        }
    translate([-(case_width+30)/2,-(case_length+30)/2,bottom_case_height/2])rotate([0,-2,0])cube([case_width+30,case_length+30,20]);
    }
}

//translate([0,0,-15])cube([case_width+10,case_length,15], center = true);
//translate([-(case_width+30)/2,-(case_length+30)/2,0])rotate([0,-main_angle,0])cube([case_width+30,case_length+30,20]);
//translate([-case_width/2-25,-(case_length+30)/2,-20])rotate([0,-15,0])cube([40,case_length+30,20]);
//linear_extrude(height = 15, scale = 14/17) square([case_width,case_length], center = true);

/*translate([-25,0,0])polyhedron(
    points=[[0,0,0],[17,0,0],[17,17,0],[0,17,0],[1.5,1.5,2],[15.5,1.5,2],[15.5,15.5,2],[1.5,15.5,2]], 
    faces =[[0,1,2,3],[4,5,1,0],[5,6,2,1],[6,7,3,2], [7,4,0,3],[7,6,5,4]]
);

translate([25,0,0])polyhedron(
    points=[[0,0,0],[17,0,0],[17,17,0],[0,17,0],[1.5,1.5,0],[15.5,1.5,0],[15.5,15.5,2],[1.5,15.5,2]], 
    faces =[[0,1,2,3],[4,5,1,0],[5,6,2,1],[6,7,3,2],[7,4,0,3],[7,6,5,4]]
);


polyhedron(
    points=[[17,17,0],[0,17,0],[1.5,1.5,0],[15.5,1.5,0],[15.5,15.5,2],[1.5,15.5,2]], 
    faces =[[0,1,2,3],[4,5,1,0],[0,3,4],[1,2,5],[2,3,4,5]]
);*/


module base(){
    A = case_width/2;
    B = case_length/2;
    base_taper = 20;
    back_taper = 10;
    height = 10;
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
module keyboard(){
    mounting_screws();
    keycaps();
    translate([-keyboard_width/2, -keyboard_length/2, -13])cube([keyboard_width, keyboard_length, 13]);
}

module mounting_screws(){
    height = 10;
    diameter = 4;
    color("MediumSlateBlue"){
        translate([mounting_hole_A/2, mounting_hole_B/2, 0])cylinder(h=height,d=diameter);
        translate([-mounting_hole_A/2, mounting_hole_B/2, 0])cylinder(h=height,d=diameter);
        translate([mounting_hole_A/2, -mounting_hole_B/2, 0])cylinder(h=height,d=diameter);
        translate([-mounting_hole_A/2, -mounting_hole_B/2, 0])cylinder(h=height,d=diameter);
    }
}

module keycaps(){
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
