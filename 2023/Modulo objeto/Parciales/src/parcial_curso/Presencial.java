package parcial_curso;

public class Presencial extends Curso{
    private int aula;

    public Presencial(int aula, int año, int N) {
        super(año, N);
        this.aula = aula;
    }

    public int getAula() {
        return aula;
    }

    public void setAula(int aula) {
        this.aula = aula;
    }
    
    @Override
    public boolean puedeRendir(Alumno A){
        boolean ok = false;
        int pos = this.busquedaDNI(A.getDNI());
        if(3 <= this.getAlu()[pos].getAsistencia()){
            ok= true;
        }
        return ok;
    }
    
    @Override
    public  int cantidadDeAlumnosQuePuedenRendir(){
        int cant=0;
        for(int i=0; i<this.getDimL(); i++){
            if(this.puedeRendir(this.getAlu()[i])){
                cant++;
            }
        }
        return cant;
    }
    
    @Override
    public String toString(){
        return"Curso presencial:\n"+super.toString()+"La cantidad de alumnos en condiciones de rendir: "+ cantidadDeAlumnosQuePuedenRendir();
    }
}
