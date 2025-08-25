/*1) A- Definir una clase para representar triángulos. Un triángulo se caracteriza por el
        tamaño de sus 3 lados (double), el color de relleno (String) y el color de línea (String).
        Provea un constructor que reciba todos los datos necesarios para iniciar el objeto.
        Provea métodos para:
        
        - Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)
        - Calcular el perímetro y devolverlo (método calcularPerimetro)
        - Calcular el área y devolverla (método calcularArea)
     
        B- Realizar un programa que instancie un triángulo, le cargue información leída desde
        teclado e informe en consola el perímetro y el área.

        NOTA: Calcular el área con la fórmula Área = √s(s − a)(s − b)(s − c) , donde a, b y c son
        los lados y s = 𝐚+𝐛+𝐜/2. La función raíz cuadrada es Math.sqrt(#) 
*/

package tema3;

import PaqueteLectura.Lector;
public class ejercicio1 {
    public static void main (String[] args){           /* <=== Esta es la principal programa */
        Triangulo tri = new Triangulo();               /* <=== Este es para crear la clase de objeto */

        System.out.println("------------> TRIANGULO <------------");
        System.out.print ("Ingrese un lado 1: ");
        tri.setLado1(Lector.leerInt());
        System.out.print ("Ingrese un lado 2: ");
        tri.setLado2(Lector.leerInt());
        System.out.print ("Ingrese un lado 3: ");
        tri.setLado3(Lector.leerInt());
        System.out.print ("Ingrese un color relleno: ");
        tri.setRelleno(Lector.leerString());
        System.out.print("Ingrese un color linea: ");
        tri.setLinea(Lector.leerString());
        System.out.println ();
        System.out.println ("Informa el triangulo del perimetro: "+ tri.getPerimetro());
        System.out.println ("Informa el triangulo del área: "+ tri.getArea());
    }
}
