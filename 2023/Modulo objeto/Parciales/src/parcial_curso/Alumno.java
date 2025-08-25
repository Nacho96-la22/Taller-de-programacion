package parcial_curso;

public class Alumno {
    private int DNI;
    private String nombre;
    private int asistencia;
    private int cantAutoAprobada;

    public Alumno(int DNI, String nombre) {
        this.DNI = DNI;
        this.nombre = nombre;
        this.asistencia = 0;
        this.cantAutoAprobada = 0;
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

    public int getAsistencia() {
        return asistencia;
    }

    public void setAsistencia(int asistencia) {
        this.asistencia = asistencia;
    }

    public int getCantAutoAprobada() {
        return cantAutoAprobada;
    }

    public void setCantAutoAprobada(int cantAutoAprobada) {
        this.cantAutoAprobada = cantAutoAprobada;
    }
    
    @Override
    public String toString(){
        return"- DNI: "+ DNI + ", nombre: "+ nombre +", asistencias: "+asistencia+", cantidad de autoevaluciones aprobadas: "+cantAutoAprobada;
    }
}
