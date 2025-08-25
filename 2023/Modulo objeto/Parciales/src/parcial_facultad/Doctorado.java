package parcial_facultad;

public class Doctorado extends Alumno{
    private String titulo;
    private String uniOrigen;

    public Doctorado(String titulo, String uniOrigen, int DNI, String nombre, int N) {
        super(DNI, nombre,N);
        this.titulo = titulo;
        this.uniOrigen = uniOrigen;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getUniOrigen() {
        return uniOrigen;
    }

    public void setUniOrigen(String uniOrigen) {
        this.uniOrigen = uniOrigen;
    }
    
    public String toString(){
        return "Alumno de doctorado, "+ super.toString() +"Titulo: "+ titulo +", universidad origen: "+uniOrigen;
    }
}
