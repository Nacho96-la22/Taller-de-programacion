package tema4;

public class ejercicio4 {
    public static void main(String[] args) {
        VisorFiguras visor = new VisorFiguras();
        Cuadrado c1 = new Cuadrado(8, "Violeta", "Rosa");
        Rectangulo r = new Rectangulo(5,2, "Azul", "Celeste");
        Cuadrado c2 = new Cuadrado(5, "Rojo", "Naranja");
        
        System.out.println();
        visor.mostrar(c1);
        visor.mostrar(r);
        visor.mostrar(c2);
        System.out.println();

        System.out.println(visor.getMostradas());

        /*  RTA: Quiere decir que mostrar las figuras que cuanto son? Por ahi dice en el final,
                 hay 3 figuras.*/
    }
}
