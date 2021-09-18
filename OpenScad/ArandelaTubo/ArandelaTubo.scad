$fn = 0;    //número de fragmentos
$fa = 4;    //ángulo mínimo
$fs = 0.1;  //tamaño mínimo
offset = 0.001;
radioTubo = 13;
diametroTubo = 26; //25 en realidad, 1mm de margen
grosorTop = 2;
grosorBottom = 2;
altura = 7;
separacionEntreAros = 1;

piezaParaMostrar = 1;

if(piezaParaMostrar == 0){
    semiArandelaConHuecos();
    }
if(piezaParaMostrar == 1){
    tacoMacho();
    }


module semiArandelaConHuecos(){
    difference(){
        arandela();
        translate([0,-20,-offset])
        cube([20,40,10]);
        
        translate([-1,-16.4,1.5])
        tacoHembra();
        translate([-1,14.8,5])
        tacoHembra();
        translate([-1,-14.8,5])
        tacoHembra();
        translate([-1,16.4,1.5])
        tacoHembra();
        }
    }

//Multiplicar por 2 cada medida, uno por cada lado
module arandela(){
        difference(){
        cylinder(   altura, 
                    d1 = diametroTubo + (grosorBottom * 2) + (grosorTop * 2) + (separacionEntreAros * 2),
                    d2 = diametroTubo + (grosorTop * 2));
            
        translate([0,0,-offset])
        cylinder(   altura + (offset * 2),
                    d1 = diametroTubo + (grosorBottom * 2) + (separacionEntreAros * 2),
                    d2 = diametroTubo);
        }
    }

module tacoHembra(){
    rotate([0,90,0])
    taco(2, 0.75);
    }

module tacoMacho(){
    taco(1.8, 0.7);
    }

module taco(largo, diametro){
    cylinder(largo, d = diametro);
    }
