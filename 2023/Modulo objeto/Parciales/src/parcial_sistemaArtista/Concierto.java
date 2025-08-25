package parcial_sistemaArtista;
    
public class Concierto {
    private String nomArtista;
    private double precio;
    private int cantEntradas;

    public Concierto(String nomArtista, double precio, int cantEntradas) {
        this.nomArtista = nomArtista;
        this.precio = precio;
        this.cantEntradas = cantEntradas;
    }

    public String getNomArtista() {
        return nomArtista;
    }

    public void setNomArtista(String nomArtista) {
        this.nomArtista = nomArtista;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getCantEntradas() {
        return cantEntradas;
    }

    public void setCantEntradas(int cantEntradas) {
        this.cantEntradas = cantEntradas;
    }
    public double getRecaudacion() {
       return this.getPrecio()*this.getCantEntradas();
    }

    @Override
    public String toString (){
        return "Nombre del artista: "+ nomArtista + ", precio de la entrada: "+ precio +
                " y cantidad de entradas vendidas: "+ cantEntradas;
    }

}
