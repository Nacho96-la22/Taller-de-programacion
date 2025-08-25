
package parcial_facultad;

public abstract class Alumno {
    private int DNI;
    private String nombre;
    private int dimL;
    private int dimF; // un maximo de N materias aprobadas
    private MateriaAprobada [] matApro;
    

    public Alumno(int DNI, String nombre,int N) {
        this.DNI = DNI;
        this.nombre = nombre;
        this.dimL = 0;
        this.dimF = N;
        this.matApro = new MateriaAprobada[this.dimF];
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
    
    public int getDimL() {
        return dimL;
    }

    public void setDimL(int dimL) {
        this.dimL = dimL;
    }

    public boolean hayLugarMaterias(){
        return this.dimL < this.dimF;
    }
        
    public void agregarMaterias (MateriaAprobada unMateria){
        if(hayLugarMaterias()){
            this.matApro[this.dimL++] = unMateria;
        }
    }
    
    public boolean estaGraduando(){
        boolean ok=false;
        if (this.dimL == this.dimF){
            int i=0;
            while(i<this.dimF && !ok){
                if(this.matApro[i].getNombre().equals("Tesis")){
                    ok=true;
                }
                i++;
            }
        }
        return ok;
    }
    
    public String toStringLoop(){
        String loop ="Materias Aprobadas:\n";
        for (int i=0; i<this.dimL; i++){
            loop += this.matApro[i].toString()+"\n";
        }
        return loop;
    }
    
    public String toString(){
        return "DNI: "+ DNI +"; Nombre: "+ nombre+";\n"+toStringLoop()+"Esta gradaudo: "+ this.estaGraduando()+"\n";
    }
}
