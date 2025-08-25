package parcial_escuelaIngles;

public class Curso {
    private String descripcion;
    private Turno turnoOnline;
    private Turno turnoPresencial;

    public Curso(String descripcion, Turno TO, Turno TP) {
        this.descripcion = descripcion;
        this.turnoOnline = TO;
        this.turnoPresencial = TP;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    // 2.a
    public void agregarAlumnos(Alumno A){
        if(A.getLugarResidencia().equals("La Plata")){
            this.turnoPresencial.agregarAlumno(A);
        }else
            this.turnoOnline.agregarAlumno(A);
    }
    
    // 2.b
    public double recaudacion(){
        return (this.turnoOnline.recaudarTurno() + this.turnoPresencial.recaudarTurno());
    }
    
    // 2.d
    public boolean rentable(){
        return recaudacion() > 800000;
    }
    
    // 2.c
    @Override
    public String toString(){
        String aux = "Descripcion: "+ descripcion +", Ganancia Mensual: "+ recaudacion()+"\n"
                + "Turno Online: "+this.turnoOnline.toString()+"\n"
                + "Turno Presencial: "+this.turnoPresencial.toString();
        return aux;
    }
}
