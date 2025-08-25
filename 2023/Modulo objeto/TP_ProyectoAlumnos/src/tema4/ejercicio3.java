package tema4;

public class ejercicio3 {
    public static void main(String[] args) {
        // Punto - 3.B
        Trabajador trabajo1 = new Trabajador("Mauro", 11203737, 70, "jardinero");
        Persona persona1 = new Persona("Ignacio", 39872025, 27);
        Persona persona2 = new Persona("Mauro", 11203737, 70);
        Trabajador trabajo2 = new Trabajador("Ignacio", 39872025, 27, "programador");


        System.out.println ();
        System.out.println(trabajo1);
        System.out.println(persona1);
        System.out.println();
        System.out.println(persona2);
        System.out.println(trabajo2);
    }
}
