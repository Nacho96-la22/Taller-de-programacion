package parcial_sandwichTPcorregido;

public class Sandwich {
    private String nombre;
    private Pan pan;
    private int dimL;
    private int dimF;
    private Ingrediente [] ingre;

    public Sandwich(String nombre, Pan pan,int N) {
        this.nombre = nombre;
        this.pan = pan;
        this.dimL = 0;
        this.dimF = N;
        this.ingre = new Ingrediente[this.dimF];
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public boolean hayLugar(){
        return this.dimL<this.dimF;
    }
    
    public void agregarIngrediente(Ingrediente I){
        if(hayLugar()){
            this.ingre[this.dimL++]= I;
        }
    }
    
    public double retornarCostoFinal(){
        double total =0;
        total += this.pan.retornarCostoFinal();
        for(int i=0; i<this.dimL; i++){
            total += this.ingre[i].retornarCostoFinal();
        }
        return total;
    }
    
    public String toString(){
        String aux ="Nombre sandwich: "+nombre+"\n"+this.pan.toString()+"\n";
        for(int i=0; i<this.dimL; i++){
            aux += "["+(i+1)+"]"+this.ingre[i].toString()+"\n";
        }
        aux += "El costo final: "+ this.retornarCostoFinal();
        return aux;
    }
}
