/*3.a) Defina una clase para representar estantes. Un estante almacena a lo sumo 20 libros.
          Implemente un constructor que permita iniciar el estante sin libros. Provea métodos para:
          (i) devolver la cantidad de libros que almacenados (ii) devolver si el estante está lleno
          (iii) agregar un libro al estante (iv) devolver el libro con un título particular que se recibe.
      b) Realice un programa que instancie un estante. Cargue varios libros. A partir del estante,
          busque e informe el autor del libro “Mujercitas”.
*/
package tema3;
import PaqueteLectura.GeneradorAleatorio;

public class ejercicio3 {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Estante estante = new Estante();
        
        int i;
        for(i=0; i<10;i++){
            Autor unAutor = new Autor (GeneradorAleatorio.generarString(5),GeneradorAleatorio.generarString(10),GeneradorAleatorio.generarString(7)); 
            Libro libro = new Libro (GeneradorAleatorio.generarString(5), GeneradorAleatorio.generarString(4),GeneradorAleatorio.generarInt(4), unAutor ,GeneradorAleatorio.generarString(4),GeneradorAleatorio.generarDouble(6));
            if (i == 7){
                libro.setTitulo("Mujecitas");
            }
            estante.agregarLibro(libro);
        }
        
        System.out.println(estante.getDimL());
        System.out.println(estante.devolverTitulo("Mujecitas").getPrimerAutor());
    }
}
