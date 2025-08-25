package parcial_informatica;

public class Empresa {
    private String nombre;
    private ProgramadorLider progLider;
    private int dimL;
    private int dimF; 
    private Programador [] prog;

    public Empresa(String nombre, ProgramadorLider progLider,int N) {
        this.nombre = nombre;
        this.progLider = progLider;
        this.dimL = 0;
        this.dimF = N; // un maximo de N programadores
        this.prog = new Programador[this.dimF]; 
    }
    
    public boolean hayLugarProgramador(){
        return this.dimL < this.dimF;
    }
    
    public void agregarProgramador(Programador unProgramador){
        if (hayLugarProgramador()){
            this.prog[dimL++] = unProgramador;
        }
    }
    
    public void aumentoMonto (double M){
        this.progLider.aumentoMonto(M);
        for(int i=0; i<this.dimL; i++){
            this.prog[i].aumentoMonto(M);
        }
    }
    
    @Override
    public String toString(){
        String aux;
        aux = "Empresa: "+ nombre +"\n"+"Programador Lider: "+ this.progLider.toString()+"\nProgramadores: "+"\n";
        for(int i=0; i<this.dimL; i++){
            aux += this.prog[i].toString()+"\n";
        }
        return aux;
    }
}