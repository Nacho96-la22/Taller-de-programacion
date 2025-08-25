package tema1;

//Paso 1. importar la funcionalidad para generar datos aleatorios
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ej03Matrices {
    public static void main(String[] args) {
        //Paso 2. iniciar el generador aleatorio     
        GeneradorAleatorio.iniciar();
        //Paso 3. definir la matriz de enteros de 5x5 e iniciarla con nros. aleatorios 
        int [] [] tabla = new int[5][5];
        int f, c;
        for (f=0;f<5;f++){
            for (c=0;c<5;c++) {
                tabla[f][c]= GeneradorAleatorio.generarInt(31);
            }
        }
        //Paso 4. mostrar el contenido de la matriz en consola
        System.out.println("-----------------> MATRICES <-------------------");
        for (f=0;f<5;f++){
            for (c=0;c<5;c++) {
                System.out.print(tabla[f][c] + " ");
            }
           System.out.println();
        }
        //Paso 5. calcular e informar la suma de los elementos de la fila 1
        System.out.println("-----------------------------------------------");
        int suma1;
        suma1 = 0;
        for (c=0; c<5; c++){
            suma1= suma1 + tabla[1][c];
        }
        System.out.println("El resultado de la suma en la fila 1: "+ suma1);
        //Paso 6. generar un vector de 5 posiciones donde cada posición j contiene 
        //la suma de los elementos de la columna j de la matriz. 
        //        Luego, imprima el vector.
        System.out.println("------------------------------------------------");
        int [] vector = new int[5];
        for (f=0; f<5; f++){
            for (c=0; c<5; c++){
                vector[c]= vector[c] + tabla[f][c];
            }
        }
        int i;
        for (i=0; i<5; i++){
            System.out.println(i +" posicion del columna, el resultado es "+ vector[i]);
        }
        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz. En caso de encontrarse indique su ubicación (fila y columna)
        //   y en caso contrario imprima "No se encontró el elemento".
        System.out.println("------------------------------------------------");
        System.out.println("Ingrese un numero:");
        int num = Lector.leerInt();
        boolean ok = false;
        for (f=0; f<5 && !ok; f++){
            for (c=0; c<5; c++){
                if (num == tabla[f][c]){
                    System.out.println("Ha encontrado este elemento en la fila ["+ f +"] y la columna ["+ c +"].");
                    ok = true;    
                }
            }
        }
        if (!ok){
            System.out.println("No ha encontrado este elemento.");
            }
    }
}
