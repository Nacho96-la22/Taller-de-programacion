package tema3;

public class Triangulo {
    private double lado1;
    private double lado2;
    private double lado3;
    private String relleno;
    private String linea;

    // Constructor
    public Triangulo(double lado1, double lado2, double lado3, String relleno, String linea) {
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;
        this.relleno = relleno;
        this.linea = linea;
    }

    public Triangulo() {

    }
    
    public void setLado1(double lado1) { // SET = traer/mostrar
        this.lado1 = lado1;
    }

    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }

    public void setLado3(double lado3) {
        this.lado3 = lado3;
    }

    public void setRelleno(String relleno) {
        this.relleno = relleno;
    }

    public void setLinea(String linea) {
        this.linea = linea;
    }

    public double getLado1() { // GET = colocar/poner
        return lado1;
    }

    public double getLado2() {
        return lado2;
    }

    public double getLado3() {
        return lado3;
    }

    public String getRelleno() {
        return relleno;
    }

    public String getLinea() {
        return linea;
    }

    public double getPerimetro() {
        return (lado1 + lado2 + lado3);
    }

    public double getArea() {
        double s = this.getPerimetro() / 2;
        return Math.sqrt(s * (s - this.lado1) * (s - lado2) * (s - lado3));
    }
}
