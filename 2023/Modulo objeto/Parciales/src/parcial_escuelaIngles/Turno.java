package parcial_escuelaIngles;

public class Turno {
    private String docente;
    private double sueldoDocente;
    private int costoCuota;
    private int dimL;
    private int dimF; 
    private Alumno [] alu;

    public Turno(String docente, double sueldoDocente, int costoCuota, int N) {
        this.docente = docente;
        this.sueldoDocente = sueldoDocente;
        this.costoCuota = costoCuota;
        this.dimL = 0;
        this.dimF = N; // un maximo de N alumnos
        this.alu = new Alumno[this.dimF];
    }

    public String getNombre() {
        return docente;
    }

    public void setNombre(String nombre) {
        this.docente = nombre;
    }

    public double getSueldoDocente() {
        return sueldoDocente;
    }

    public void setSueldoDocente(double sueldoDocente) {
        this.sueldoDocente = sueldoDocente;
    }

    public int getCostoCuota() {
        return costoCuota;
    }

    public void setCostoCuota(int costoCuota) {
        this.costoCuota = costoCuota;
    }
    
    public boolean hayLugarEnEspacio(){
        return this.dimL < this.dimF; 
    }
    
    // 2.a
    public void agregarAlumno(Alumno A){
        if(hayLugarEnEspacio()){
            this.alu[this.dimL++] = A;
        }else
            System.out.println("No hay espacio.");
    }
    
    // 2.b
    public double recaudarTurno(){
        return (this.dimL * this.getCostoCuota()) - this.getSueldoDocente();
    }
    
    // 2.c
    @Override
    public String toString(){
        String aux = "Nombre del docente: "+ docente +";\n";
        for (int i=0; i< this.dimL; i++){
            aux += "Alumno "+(i+1)+": "+this.alu[i].toString()+"\n";
        }
        return aux;
    }
}
