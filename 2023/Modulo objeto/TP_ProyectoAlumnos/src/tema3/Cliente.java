package tema3;

public class Cliente {
    private String nombre;
    private int DNI;
    private int edad;

    public Cliente() {
    }
    
    public Cliente(String unNombre, int unDNI, int unEdad) {
        this.nombre = unNombre;
        DNI = unDNI;
        this.edad = unEdad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDNI() {
        return DNI;
    }

    public void setDNI(int dNI) {
        DNI = dNI;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String toString(){
        return ("El nombre: "+ nombre +", DNI: "+ DNI +" y edad: "+ edad);
    }
}
