
/*4- Un edificio de oficinas está conformado por 8 pisos (1..8) y 4 oficinas por piso
     (1..4). Realice un programa que permita informar la cantidad de personas que 
     concurrieron a cada oficina de cada piso. Para esto, simule la llegada de personas
     al edificio de la siguiente manera: a cada persona se le pide el nro. de piso y nro. 
     de oficina a la cual quiere concurrir. La llegada de personas finaliza al indicar un 
     nro. de piso 9. Al finalizar la llegada de personas, informe lo pedido.*/

package tema1;
import PaqueteLectura.Lector;

public class ejercicio4{
    public static void main(String[] args) {
        int [] [] edificio = new int [8][4]; // inicializar martices
        int f, c;                            // fila y columna
        System.out.println("-----------------> EDIFICIO <-----------------");
        System.out.println("Ingrese el numero de piso:");
        int piso = Lector.leerInt();
        while (piso != 9) {                  // corte del control 
            System.out.println("Ingrese el numero de oficina:");
            int oficina = Lector.leerInt();
            edificio[piso-1][oficina-1]++;
            System.out.println();
            System.out.println("Ingrese el numero de piso:");
            piso = Lector.leerInt();
        }
        System.out.println(); 
        System.out.println("Informo la cantidad de personas en el edificio:"); 
        for (f=0; f<8; f++){
            System.out.print ((f+1) + " piso: ");
            for (c=0; c<4; c++){
                System.out.print (edificio[f][c]+ " ");
            }
            System.out.println ();
        }
    }
}