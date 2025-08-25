package tema3;
import PaqueteLectura.GeneradorAleatorio;

public class Habitacion {
    private boolean estado;
    private double costo;
    private Cliente cli;

    // Construcion
    private double costoAleatorio() {
        return GeneradorAleatorio.generarDouble(8000) + 2000;
    }

    public Habitacion() {
        this.estado = true;
        this.costo = costoAleatorio();
        this.cli = null;
    }

    public Habitacion (double precio, Cliente persona){
        this.cli = persona;
        this.costo = precio;
        this.estado = true; // true es desocupada
    }

    // Setters and getters
    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public void getEstado (boolean estado){
        this.estado = estado;
    }

    public boolean getEstado (){
        return estado;
    }

    public Cliente getCli (){
        return cli;
    }

    public void setCli(Cliente cli){ // ocupa la habitacion con el cliente, y la marca ocupada
        this.cli = cli ;
        estado = false;
    }

    public void aumentarCosto(double valor){
       this.costo = costo + valor;
    }
        
    @Override
    public String toString(){
        if (!this.estado) { //Si true es desocupada, solo podes hacer el toString de persona cuando estado es false (ocupada)
            return this.costo + ", "+ this.estado + ", "+ this.getCli().toString();
        } else {
            return this.costo + ", " + this.estado;
        }
    }
}
