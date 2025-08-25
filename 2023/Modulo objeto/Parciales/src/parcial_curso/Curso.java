package parcial_curso;

public abstract class Curso {
    private int año;
    private int dimL;
    private int dimF; // un maximo de alumnos N
    private Alumno [] alu;

    public Curso(int año, int N) {
        this.año = año;
        this.dimL = 0;
        this.dimF = N;
        this.alu = new Alumno[this.dimF];
    }

    public int getDimL() {
        return dimL;
    }

    public void setDimL(int dimL) {
        this.dimL = dimL;
    }

    public Alumno[] getAlu() {
        return alu;
    }

    public void setAlu(Alumno[] alu) {
        this.alu = alu;
    }
    
    public boolean puedoAgregar(){
        return this.dimL < this.dimF;
    }
    
    public boolean agregarAlumno(Alumno A){
        if (puedoAgregar()){
            this.alu[this.dimL++]= A;
            return true;
        }else
            return false;
    }
    
    public int busquedaDNI(int unDNI){
        int i=0;
        int pos=0;
        boolean ok= false;
        while (i<this.dimL && !ok) {
            if(unDNI == this.alu[i].getDNI()){
                pos = i;
                ok = true;
            }
            i++;
        }
        return pos;
    }
    
    public void incrementarAsistencia(int unDNI){
        int pos = this.busquedaDNI(unDNI);
        if(this.alu[pos].getDNI() == unDNI){
            this.alu[pos].setAsistencia(this.alu[pos].getAsistencia()+1);
        }
    }
    
    public void aprobarAutoevalucion(int unDNI){
        int pos = this.busquedaDNI(unDNI);
        if(this.alu[pos].getDNI() == unDNI){
            this.alu[pos].setCantAutoAprobada(this.alu[pos].getCantAutoAprobada()+1);
        }
    }
    
    public abstract boolean puedeRendir(Alumno A); 
    public abstract int cantidadDeAlumnosQuePuedenRendir();
        
    @Override
    public String toString(){
        String aux = "> Listas de alumnos:\n";
        for(int i=0; i<this.dimL; i++){
            aux+= this.alu[i].toString()+"\n";
        }
        return aux;
    }
}
