package parcial_comercio;

public class Producto {
    private int cod;
    private String descripcion;
    private double precio;
    private int cantUnidad;

    public Producto(int cod, String descripcion, double precio, int cantUnidad) {
        this.cod = cod;
        this.descripcion = descripcion;
        this.precio = precio;
        this.cantUnidad = cantUnidad;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    
    public int getCantUnidad() {
        return cantUnidad;
    }

    public void setCantUnidad(int cantUnidad) {
        this.cantUnidad = cantUnidad;
    }
    
    public String toString(){
        return "Codigo: "+ cod + ", descripicion: "+ descripcion + 
                ", el precio final de cada producto: "+ this.precio * this.cantUnidad;
    }
}
