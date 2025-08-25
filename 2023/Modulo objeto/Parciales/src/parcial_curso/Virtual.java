package parcial_curso;

public class Virtual extends Curso{
    private String link;

    public Virtual(String link, int año, int N) {
        super(año, N);
        this.link = link;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }
    
    @Override
    public boolean puedeRendir(Alumno A){
        boolean ok = false;
        int pos = this.busquedaDNI(A.getDNI());
        if(1 <= this.getAlu()[pos].getAsistencia() && 3 <= this.getAlu()[pos].getCantAutoAprobada()){
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
        return "Curso virtual:\n"+super.toString()+"La cantidad de alumnos en condiciones de rendir: "+ cantidadDeAlumnosQuePuedenRendir();
    }
}
