package parcial_futbol;

public class Goleador {
    private String nombre;
    private String equipo;
    private int cantGoles;

    public Goleador (String nombre, String equipo, int cantGoles) {
        this.nombre = nombre;
        this.equipo = equipo;
        this.cantGoles = cantGoles;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEquipo() {
        return equipo;
    }

    public void setEquipo(String equipo) {
        this.equipo = equipo;
    }

    public int getCantGoles() {
        return cantGoles;
    }

    public void setCantGoles(int cantGoles) {
        this.cantGoles = cantGoles;
    }
    
    @Override
    public String toString(){
        return "- nombre: "+ nombre + ", equipo: "+ equipo + ", la cantidad de goles: "+ cantGoles;
    }
}
