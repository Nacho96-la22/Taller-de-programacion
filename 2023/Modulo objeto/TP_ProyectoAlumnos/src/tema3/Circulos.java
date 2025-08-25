package tema3;

public class Circulos {
    private double radio;
    private String relleno;
    private String linea;
    
    public Circulos (double unRadio, String unRelleno, String unLinea){
        this.radio = radio;
        this.relleno = relleno;
        this.linea = linea;
    }

    public Circulos(){
        
    }
    
    public void setRadio(double radio) {
        this.radio = radio;
    }

    public void setRelleno(String relleno) {
        this.relleno = relleno;
    }

    public void setLinea(String linea) {
        this.linea = linea;
    }
    
        public double getRadio() {
        return radio;
    }

    public String getRelleno() {
        return relleno;
    }

    public String getLinea() {
        return linea;
    }
    
    public double getPerimetro(){
        return (2 * Math.PI*radio);
    }
    
    public double getArea(){
        return Math.PI*Math.pow(radio, 2);
    }
    
    
    public String toString (){
        return "El circulo de radio " + this.getRadio() + " tiene el perimetro  de "+ this.getPerimetro() + " y un area de "+ this.getArea();
    }
}
