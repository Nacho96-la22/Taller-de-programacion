package parcial_sandwichTP;

public class Pan extends Componente{
    private String calidad;

    public Pan(String calidad, String nombre, double costo) {
        super(nombre, costo);
        this.calidad = calidad;
    }

    public String getCalidad() {
        return calidad;
    }

    public void setCalidad(String calidad) {
        this.calidad = calidad;
    }
    
    public double retornarCostoFinal(){
        return this.getCosto()*1.20; // falta una condicion de cumple
    }
    
    public String toString(){
        return"- Pan: "+super.toString()+" - calidad: "+calidad;
    }
}
