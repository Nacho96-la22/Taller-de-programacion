/* 1- Se dispone de la clase Persona (en la carpeta tema2). Un objeto persona puede crearse
   sin valores iniciales o enviando en el mensaje de creación el nombre, DNI y edad (en ese
   orden). Un objeto persona responde a los siguientes mensajes:

    getNombre() retorna el nombre (String) de la persona
    getDNI() retorna el dni (int) de la persona
    getEdad() retorna la edad (int) de la persona
    setNombre(X) modifica el nombre de la persona al “String” pasado por parámetro (X)
    setDNI(X) modifica el DNI de la persona al “int” pasado por parámetro (X)
    setEdad(X) modifica la edad de la persona al “int” pasado por parámetro (X)
    toString() retorna un String que representa al objeto. Ej: “Mi nombre es Mauro, mi DNI es 11203737 y tengo 70 años”
   
    Realice un programa que cree un objeto persona con datos leídos desde teclado. Luego
   muestre en consola la representación de ese objeto en formato String.
 */

package tema2;
import PaqueteLectura.Lector;

public class ejercicio1 {
    public static void main (String[] args){
        // Primera forma: directo guardar y sin lea un teclado
        Persona per = new Persona("Messi", 123123, 36); 
        Persona per2 = new Persona();
        Persona per3 = new Persona();
        
        // Segunda forma: lo mismo que anterior pero separado de las variables.
        per2.setNombre("Neymar"); 
        per2.setDNI(1231);
        per2.setEdad(32);

        // Informa los metodos de mensaje:
        System.out.println ("Primera forma:");
        System.out.println (per.toString());
        System.out.println ("Segunda forma:");
        System.out.println (per2.toString());
        
        // Tercera forma: se lea un teclado
        System.out.println ("Tercera forma:");  
        System.out.println("Ingrese un nombre:");
        per3.setNombre(Lector.leerString());
        System.out.println("Ingrese un documento:");
        per3.setDNI(Lector.leerInt());
        System.out.println("Ingrese edad:");
        per3.setEdad(Lector.leerInt());
        System.out.println(per3.toString());
    }
}
