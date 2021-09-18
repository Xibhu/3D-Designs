$fn = 0;    //número de fragmentos
$fa = 8;    //ángulo mínimo
$fs = 0.1;  //tamaño mínimo

offset = 0.001;

grosorParedes = 0.1;
alturaCaja = 9;
alturaTapa = alturaCaja + 0.2;

figuraParaMostrar = 1;
if(figuraParaMostrar == 0){
    cajaDePared();
    }
if(figuraParaMostrar == 1){
    tapaConAgujeros();
    }
if(figuraParaMostrar == 2){
    cajaDePared();
    tapaConAgujeros();
    }
    
    
module agujeros(){
    union(){
        cylinder(0.5, d = 0.8);
        translate([-0.4,0,0])
        cube([0.8, 0.4, 0.5]);
    
        }
    }

module tapaConAgujeros(){
    difference(){
        tapa();
    
        translate([8.3,0.4 - offset,4.5])
        rotate([0,90,180])
        agujeros();
    
        translate([0.4 - offset,7.8,4.5])
        rotate([-90,90,0])
        agujeros();
        
        }
    }

module tapa(){
    cubePoints = [
    [8,0,0],
    [8,3,0],
    [3,8,0],
    [0,8,0],
    
    [0,                 8 + grosorParedes,  0],
    [3,                 8 + grosorParedes,  0],
    [8 + grosorParedes, 3,                  0],
    [8 + grosorParedes, 0,                  0],
    
    [8,0,alturaTapa],
    [8,3,alturaTapa],
    [3,8,alturaTapa],
    [0,8,alturaTapa],
    
    [0,                 8 + grosorParedes,  alturaTapa],
    [3,                 8 + grosorParedes,  alturaTapa],
    [8 + grosorParedes, 3,                  alturaTapa],
    [8 + grosorParedes, 0,                  alturaTapa]
    ];

    cubeFaces = [
    [0,7,6,5,4,3,2,1],
    [8,9,10,11,12,13,14,15],
    [0,8,15,7],
    [3,4,12,11],
    [0,1,9,8],
    [1,2,10,9],
    [2,3,11,10],
    [7,15,14,6],
    [6,14,13,5],
    [5,13,12,4]
    ];
    
    polyhedron(cubePoints, cubeFaces);
    
    translate([1, 8 - grosorParedes * 3,    grosorParedes])
    soporte();

    translate([7.7, 2,                      grosorParedes])
    rotate([0,0,-90])
    soporte();

    translate([2, 8 - grosorParedes * 3,    alturaCaja - grosorParedes])
    rotate([0,180,0])
    soporte();

    translate([7.7, 1,                      alturaCaja - grosorParedes])
    rotate([-180,0,90])
    soporte();
    
    
    }

module cajaDePared(){
    difference(){
        union(){
            cube([8,                grosorParedes,  alturaCaja]);
            cube([grosorParedes,    8,              alturaCaja]);
            ladoPoli(0);
            ladoPoli(alturaCaja - grosorParedes);
        }
    
        translate([5.22,5.22,-0.2])
        rotate([0,0,-45])
        agujeros();
        }
    
    }

module ladoPoli(altura){
    cubePoints = [
    [0,0,altura],
    [8,0,altura],
    [8,3,altura],
    [3,8,altura],
    [0,8,altura],

    [0,0,altura + grosorParedes],
    [8,0,altura + grosorParedes],
    [8,3,altura + grosorParedes],
    [3,8,altura + grosorParedes],
    [0,8,altura + grosorParedes]
    ];

    cubeFaces = [
    [0,1,2,3,4],
    [5,9,8,7,6],
    [0,5,6,1],
    [1,6,7,2],
    [2,7,8,3],
    [3,8,9,4],
    [4,9,5,0]
    ];
    polyhedron(cubePoints, cubeFaces);
    }
    

module soporte(){
    union(){
        translate([0,0,0.2])
        triangulosSoportes();
        cube([1, 0.3, 0.2]);
    
        }
    }

module triangulosSoportes(){
    cubePoints = [
    [0,0,0],
    [0,0.3,0],
    [0,0.3,0.5],
    
    [1,0,0],
    [1,0.3,0],
    [1,0.3,0.5]
    
    ];
    
    cubeFaces = [
    [0,1,2],
    [3,5,4],
    [5,3,0,2],
    [4,5,2,1],
    [3,4,1,0]
    ];
    
    polyhedron(cubePoints, cubeFaces);
    }
