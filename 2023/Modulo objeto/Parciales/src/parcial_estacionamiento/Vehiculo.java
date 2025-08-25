package parcial_estacionamiento;

public class Vehiculo {
    private String patente;
    private int cantHora;
    private String marca;
    private String modelo;

    public Vehiculo(String patente, int cantHora, String marca, String modelo) {
        this.patente = patente;
        this.cantHora = cantHora;
        this.marca = marca;
        this.modelo = modelo;
    }

    public String getPatente() {
        return patente;
    }

    public void setPatente(String patente) {
        this.patente = patente;
    }

    public int getCantHora() {
        return cantHora;
    }

    public void setCantHora(int cantHora) {
        this.cantHora = cantHora;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }
    
    @Override
    public String toString(){
        return"Patente: "+ patente +", marca: "+marca+", modelo: "+modelo;
    }
}
