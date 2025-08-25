package tema4;

public class ejercicio5 {
    public static void main(String[] args) {
        VisorFigurasModificado visorModificado = new VisorFigurasModificado();

        Cuadrado c1 = new Cuadrado(5, "rojo", "azul");
        visorModificado.guardar(c1);
        Cuadrado c2 = new Cuadrado(3, "celeste", "morada");
        visorModificado.guardar(c2);
        Rectangulo r1 = new Rectangulo(2, 6, "verde", "blanco");
        visorModificado.guardar(r1);
        
        System.out.println();
        visorModificado.mostrar();
    }
}
