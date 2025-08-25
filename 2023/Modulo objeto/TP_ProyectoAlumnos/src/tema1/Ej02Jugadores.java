package tema1;
//Paso 1: Importar la funcionalidad para lectura de datos
import PaqueteLectura.GeneradorAleatorio;
public class Ej02Jugadores {
    public static void main(String[] args) {
        // Paso 2: Declarar la variable vector de double
        int dimF = 15;
        // Paso 3: Crear el vector para 15 double
        double[] vectores = new double[dimF];
        // Paso 4: Declarar indice y variables auxiliares a usar
        int i;
        double result = 0;
        double suma = 0;
        // Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando
        // la suma de alturas
        for (i = 0; dimF > i; i++) {
            //System.out.println("Ingrese la altura de jugador:");
            vectores[i] = GeneradorAleatorio.generarDouble(10);
            System.out.println(vectores[i]);
            suma = +vectores[i];
        }
        // Paso 7: Calcular el promedio de alturas, informarlo
        result += suma / 15;
        System.out.println("La altura promedio es " + (double) result);
        // Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por
        // encima del promedio)
        int cant = 0;
        for (i = 0; i < dimF; i++) {
            if (vectores[i] > result) {
                cant++;
            }
        }
        // Paso 9: Informar la cantidad.
        System.out.println("La cantidad de alturas que esta por encima del promedio: " + cant);
    }
}