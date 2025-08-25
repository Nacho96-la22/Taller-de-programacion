package parcial_sandwichTPcorregido;

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
        if(this.calidad.equals("Premium")){
            return Math.round(this.getCosto()*1.20);
        }else 
            return this.getCosto();
    }
    
    public String toString(){
        return"- Pan: "+super.toString()+" - calidad: "+calidad;
    }
}
