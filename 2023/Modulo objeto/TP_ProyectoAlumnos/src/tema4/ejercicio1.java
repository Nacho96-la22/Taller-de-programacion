package tema4;

public class ejercicio1 {
    public static void main(String[] args) {
        Triangulo triangulo = new Triangulo(2, 3, 2, "Amarillo", "Verde");
        Circulo circulo = new Circulo(5, "roja", "celeste");

        System.out.println(triangulo.toString());
        System.out.println(circulo.toString());

        triangulo.despintar();
        circulo.despintar();
        System.out.println();
        
        System.out.println(triangulo.toString());
        System.out.println(circulo.toString());

    }
    
}
