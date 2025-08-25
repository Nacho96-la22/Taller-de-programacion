/*
Demo que crea objetos Libro invocando a los constructores definidos. 
 */
package tema3;

public class Demo01ConstructoresLibro {

    public static void main(String[] args) {
        Autor autor1 = new Autor ("Di Maria","Rompe la pared","Argentina");
        Libro libro1 = new Libro("Java: A Beginner's Guide","Mcgraw-Hill", 2014,autor1, "978-0071809252", 21.72);
        Autor autor2 = new Autor("Mbappe","Sufre por ser segundo","Francia");
        Libro libro2 = new Libro("Learning Java by Building Android Games", "CreateSpace Independent Publishing", autor2, "978-1512108347");
        System.out.println(libro1.toString());
        System.out.println(libro2.toString());
        System.out.println("Precio del libro2: " + libro2.getPrecio());
        System.out.println("Año edición del libro2: " + libro2.getAñoEdicion());
        
    }
    
}
