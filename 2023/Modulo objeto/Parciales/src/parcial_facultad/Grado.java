package parcial_facultad;

public class Grado extends Alumno{
    private String carrera;

    public Grado(String carrera, int DNI, String nombre, int N) {
        super(DNI, nombre,N);
        this.carrera = carrera;
    }

    public String getCarrera() {
        return carrera;
    }

    public void setCarrera(String carrera) {
        this.carrera = carrera;
    }
    
    public String toString(){
        return "Alumno de grado, "+ super.toString() +"Carrera: "+ carrera;
    }
}
