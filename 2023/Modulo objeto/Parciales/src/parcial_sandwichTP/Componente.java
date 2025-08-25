package parcial_sandwichTP;

public abstract class Componente {
    private String nombre;
    private double costo;

    public Componente(String nombre, double costo) {
        this.nombre = nombre;
        this.costo = costo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getCosto() {
        return costo;
    }
    // me habia olvidado el setcosto en parcial
    
    public abstract double retornarCostoFinal();
    
    public String toString(){
        return "Nombre: "+nombre+" - costo: "+costo; // no deberia usar el costo sino retornarCostoFinal
    }
}
