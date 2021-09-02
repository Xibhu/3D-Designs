//Hecho por Xibhu

//Cambiar para cambiar el objeto a renderizar. Sacar los archivos STL o los necesarios uno a uno
objetoParaMostrar = 0;

if(objetoParaMostrar == 0){
    caja();
}
if(objetoParaMostrar == 1){
    tapa();
}

//$fa = 1;
$fs = 0.1;
overlap = 0.001;

//Medidas para la tapa
rectanguloInteriorLadoA = 4.6;
rectanguloInteriorLadoB = 15;
margenesLateralesLadoB = 2; //la mitad por cada lado
gruesoTapa = 0.3;

//Medidas para la caja y tapa
baseLadoA = 16;
baseLadoB = rectanguloInteriorLadoB + margenesLateralesLadoB;
gruesoBase = 0.3;

//Medidas de los separadores de la caja
altoSeparadorRail = 1;
cantidadSeparadores = 4;

//Medida para las paredes de la caja
altoParedes = 5.5 + altoSeparadorRail;
gruesoParedes = 0.3;

//Tornillería
radioTornillo = 0.3;
radioSeparador = 1;

offsetPilares = 0.5; //separación de los bordes
posicionesPilaresX = [gruesoParedes + offsetPilares, baseLadoB - gruesoParedes - offsetPilares];
posicionesPilaresY = [gruesoParedes + offsetPilares, baseLadoA - gruesoParedes - offsetPilares];

module caja(){
    difference(){
        union(){
            cube([  baseLadoB,
                baseLadoA,
                gruesoBase]);

            separadoresRailes(0)
            cylinder(altoSeparadorRail + gruesoBase, radioSeparador, radioSeparador);
            
            pilaresTapa(0)
            cylinder(altoParedes + gruesoBase, radioSeparador, radioSeparador);
            
            difference(){
                translate([0,0,gruesoBase - overlap])
                cube([  baseLadoB,
                        baseLadoA,
                        altoParedes]);

                translate([gruesoParedes, gruesoParedes, gruesoBase - overlap])
                cube([  baseLadoB - ( gruesoParedes * 2 ),
                        baseLadoA - ( gruesoParedes * 2 ),
                        altoParedes + overlap]);
        
                }
        
        }

        separadoresRailes(-overlap)
        cylinder(altoSeparadorRail + gruesoBase + (overlap * 2), radioTornillo, radioTornillo);
        pilaresTapa(-overlap)
        cylinder(altoParedes + gruesoBase + (overlap * 2), radioTornillo, radioTornillo);
    
        difference(){
            translate([-1,-1,-0.5])
            cube([baseLadoB + 2, baseLadoA + 2, altoParedes + 1]);
            translate([0,0,0])
            cube([baseLadoB, baseLadoA , altoParedes + gruesoBase]);
            
            
        }
    }
    
    }
    

module tapa(){
    difference(){
        translate([0,0,0])
        cube([baseLadoB, baseLadoA, gruesoTapa]);
        translate([baseLadoB / 2, baseLadoA / 2, 0])
        cube([rectanguloInteriorLadoB, rectanguloInteriorLadoA, 1], center = true);
        pilaresTapa(-overlap)
        cylinder(1, radioTornillo, radioTornillo);
        }
    
    }


//Colocación de los separadores
module separadoresRailes(inicioZ){
    for( i = [ 1 : cantidadSeparadores ] ){
            translate([(i/(cantidadSeparadores + 1)) * baseLadoB, baseLadoA / 2, inicioZ])
            children();
        }
    }

//Posición de los pilares en las esquinas para el cierre de la tapa con varillas roscadas
module pilaresTapa(inicioZ){
        for(i = [0:1]){
                for(j = [0:1]){
                    translate([posicionesPilaresX[j], posicionesPilaresY[i], inicioZ])
                    children();
                    }
            }
    }