package parcial_empresa;

public class Empresa {
    private String nombre;
    private String direccion;
    private Director unDirector;
    private int dimF;
    private Encargado sucursales[];    
    
    // Constructor (A)                                                         V es numerado de sucursal
    public Empresa(String nombre, String direccion, Director unDirector, int N) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.unDirector = unDirector;
        this.dimF = N;
        this.sucursales = new Encargado [this.dimF]; 
    }

    public void agregarEncargado (Encargado encar, int x) { // B.1
        this.sucursales[x-1] = encar;    
    }
 
    public String puntoB4(){
        String aux = "";
        for (int i=0; i < this.dimF; i++){
            if (this.sucursales[i] != null){
                aux += "Sucursal "+ (i+1) + ": "+ this.sucursales[i].toString()+"\n";
            } else {
                aux += "Sucursal "+ (i+1) +" no tiene encargado. \n";
            }
        }
        return aux;
    }
    
    @Override
    public String toString(){
        String aux;
        aux = "Nombre de empresa: "+ nombre +", direccion: "+ direccion + "\n";
        aux += this.unDirector.toString()+"\n";
        aux += puntoB4();
        return aux;
    }
}
