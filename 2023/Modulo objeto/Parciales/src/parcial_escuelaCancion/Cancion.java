package parcial_escuelaCancion;

public class Cancion {
    private String nombre;
    private String compositor;
    private int identificador;
    private Estudiante ganador;
    private double puntaje;

    public Cancion(String nombre, String compositor, int identificador) {
        this.nombre = nombre;
        this.compositor = compositor;
        this.identificador = identificador;
        this.ganador = null;
        this.puntaje = 0;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCompositor() {
        return compositor;
    }

    public void setCompositor(String compositor) {
        this.compositor = compositor;
    }

    public int getIdentificador() {
        return identificador;
    }

    public void setIdentificador(int identificador) {
        this.identificador = identificador;
    }

    public Estudiante getGanador() {
        return ganador;
    }

    public void setGanador(Estudiante ganador) {
        this.ganador = ganador;
    }

    public double getPuntaje() {
        return puntaje;
    }

    public void setPuntaje(double puntaje) {
        this.puntaje = puntaje;
    }
    
    @Override
    public String toString(){
        return "Nombre: "+ this.nombre + ", compositor: "+this.compositor+" y puntaje: "+this.puntaje;
    }
}
