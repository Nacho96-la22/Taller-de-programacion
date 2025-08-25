package tema4;


public abstract class Figura {
    private String colorRelleno;
    private String colorLinea;
   
    public Figura (){
    }

    public Figura(String unCR, String unCL){
        setColorRelleno(unCR);
        setColorLinea(unCL);
    }
    
    
    public String getColorRelleno(){
        return colorRelleno;       
    }
    
    public void setColorRelleno(String unColor){
        colorRelleno = unColor;       
    }

    public String getColorLinea(){
        return colorLinea;       
    }
    
    public void setColorLinea(String unColor){
        colorLinea = unColor;       
    }
    
    public abstract double calcularArea();
    public abstract double calcularPerimetro();
    
    public void despintar(){
        this.colorLinea= "Negro";
        this.colorRelleno= "Blanco";
    }
    
    public String toString() {
        String aux = "Area: "+ this.calcularArea()+
                    ", color relleno: "+ getColorRelleno()+
                    ", color linea: "+ getColorLinea();
        return aux;
    }
}
