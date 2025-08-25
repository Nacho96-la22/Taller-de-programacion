package tema3;

public class Autor {
    /* Las variables internas de una clase representan el estado interno
        por principio deberian ser todas privadas,
        luego si quiero modificarlas desde afuera lo hago exclusivamente
        a traves de los metodos publicos getters y setters
        por una cuestion de principio de encapsulamiento de la programacion
        orientada a objetos
        Encapsular seria "aislar" las variables 
        lo que esta adentro no puede salir
        tampoco pueden entrar 
    
        Para que el programador de las clases pueda tener el control completo de
        la clase
    */
    private String nombre;
    private String bigrafia;
    private String origen;

    public Autor(String nombre, String bigrafia, String origen) {
        this.nombre = nombre;
        this.bigrafia = bigrafia;
        this.origen = origen;
    }

    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getBigrafia() {
        return bigrafia;
    }
    public String getOrigen() {
        return origen;
    }

    public void setOrigen(String origen) {
        this.origen = origen;
    }
    
    public String toString(){
        String s = ("Nombre:"+ this.nombre +", biografia: "+ this.bigrafia +" y el origen: "+ this.origen);
        return s;
    }
}
