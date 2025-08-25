
package parcial_escuelaCancion;

public class Estudiante {
    private String nombre;
    private String apellido;
    private int DNI;

    public Estudiante(String nombre, String apellido, int DNI) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.DNI = DNI;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public int getDNI() {
        return DNI;
    }

    public void setDNI(int DNI) {
        this.DNI = DNI;
    }
    
    @Override
    public String toString(){
        return "Nombre y apellido: "+ this.nombre +" "+ this.apellido + " y DNI: "+ DNI;
    }
}
