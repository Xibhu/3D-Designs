$fn = 0;    //número de fragmentos
$fa = 3;    //ángulo mínimo
$fs = 0.1;  //tamaño mínimo
offset = 0.001;
difference(){
    cylinder(h = 0.5, d = 6.5);
    translate([0,0, - offset])
    cylinder(h = 1.5, d = 5);
    }

difference(){
    difference(){
        translate([0,0,0.5 - offset])
        cylinder(h = 1.5, d = 6.2);

        translate([0,0,0.5 - offset * 2])
        cylinder(h = 1.6, d = 5.4);

        }


    union(){
        translate([1.6, 0, 0])
        cube([2.2, 7, 5], center = true);
        translate([-1.6, 0, 0])
        cube([2.2, 7, 5], center = true);
        translate([0, 1.6, 0])
        rotate([0,0,90])
        cube([2.2, 7, 5], center = true);
        translate([0, -1.6, 0])
        rotate([0,0,90])
        cube([2.2, 7, 5], center = true);

        }
}
/*
difference(){
    union(){
        cylinder(h = 0.8, d = 14.7);

        translate([0,0,0.8])
        cylinder(h = 4.2, d = 6.1);

        translate([0,0,5])
        cylinder(h = 0.4, d1 = 6.6, d2 = 6.1);
    
    
    }

    translate([0,0,3.5])
    cube(5, center = true);
    }
    */