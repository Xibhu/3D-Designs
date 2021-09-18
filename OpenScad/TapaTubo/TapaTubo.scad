//Tapa para detener la caída del agua en un bajante y que no deteriore el suelo

$fn = 0;    //número de fragmentos
$fa = 8;    //ángulo mínimo
$fs = 0.1;  //tamaño mínimo

offset = 0.001;

Tubo = 5; //diámetro exterior en centímetros

diametroTubo = Tubo - 0.05; //Para que quede el tubo ajustado en las muescas

inclinacionTubo = -3;       //Para que el agua no se quede estancada
offsetTuboX = 0.1;          //Si al inclinar el tubo queda una pared endeble, mueve el tubo

grosorParedes = 0.3;
grosorMuesca = 0.12;
muescaFinal = grosorParedes - grosorMuesca;
alturaParedes = 3;
alturaMuesca = 1.5;

cube([diametroTubo, diametroTubo + (muescaFinal * 2), grosorParedes]);

difference(){
    union(){
        
        translate([0, 0, grosorParedes])
        cube([diametroTubo, grosorParedes, alturaParedes]);

        translate([0, grosorParedes, grosorParedes])
        cube([grosorParedes, diametroTubo - (grosorMuesca * 2), alturaParedes]);

        translate([0,diametroTubo + grosorParedes - (grosorMuesca * 2), grosorParedes])
        cube([diametroTubo, grosorParedes, alturaParedes]);
        }
    
    rotate([0,inclinacionTubo,0])
    translate([diametroTubo / 2 + muescaFinal + offsetTuboX, diametroTubo / 2 + muescaFinal, alturaMuesca])
    cylinder(h = 20, d = diametroTubo);
    
    }
