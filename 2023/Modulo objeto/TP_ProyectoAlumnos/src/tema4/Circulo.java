package tema4;

public class Circulo extends Figura {
    private double radio;

    public Circulo (double unRadio, String unCR, String unCL){
        super(unCR, unCL);
        this.radio = unRadio;
    }
    
    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }

    public double calcularArea(){
        return Math.round((Math.PI*Math.pow(radio,2))*100.00) / 100.00;
    }
    
    public double calcularPerimetro(){
        return Math.round((2*Math.PI*radio)* 100.00) / 100.00;
    }

    public String toString (){
        return "Circulo "+ super.toString()+", y radio: "+ radio;
    }
}
