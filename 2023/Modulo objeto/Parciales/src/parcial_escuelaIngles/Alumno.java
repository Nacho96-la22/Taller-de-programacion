package parcial_escuelaIngles;

public class Alumno {
    private int DNI;
    private String nombre;
    private String lugarResidencia;

    public Alumno(int DNI, String nombre, String lugarResidencia) {
        this.DNI = DNI;
        this.nombre = nombre;
        this.lugarResidencia = lugarResidencia;
    }

    public int getDNI() {
        return DNI;
    }

    public void setDNI(int DNI) {
        this.DNI = DNI;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getLugarResidencia() {
        return lugarResidencia;
    }

    public void setLugarResidencia(String lugarResidencia) {
        this.lugarResidencia = lugarResidencia;
    }
    
    @Override
    public String toString(){
        return "DNI: "+DNI+"; Nombre: "+nombre+"; Lugar de residencia: "+lugarResidencia;
    }
}
