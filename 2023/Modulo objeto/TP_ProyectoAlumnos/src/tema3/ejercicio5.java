/*
 5.a) Definir una clase para representar círculos. Los círculos se caracterizan por su radio
        (double), el color de relleno (String) y el color de línea (String).
        Provea un constructor que reciba todos los datos necesarios para iniciar el objeto.
        Provea métodos para:
            - Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)
            - Calcular el perímetro y devolverlo (método calcularPerimetro)
            - Calcular el área y devolverla (método calcularArea)
 b) Realizar un programa que instancie un círculo, le cargue información leída de teclado e
      informe en consola el perímetro y el área.

NOTA: la constante PI es Math.PI
 */
package tema3;

import PaqueteLectura.Lector;
public class ejercicio5 {
    public static void main(String[] args) {
        Circulos cir = new Circulos();
        
        System.out.println ("------------> CIRCULOS <------------");
        System.out.print ("Ingrese un numero de radio: ");
        cir.setRadio(Lector.leerDouble());
        System.out.print ("Ingrese un color de relleno: ");
        cir.setRelleno(Lector.leerString());
        System.out.print ("Ingrese una linea: ");
        cir.setLinea(Lector.leerString());
        System.out.println ();
        System.out.println (cir.toString());
        
    }
    
}
