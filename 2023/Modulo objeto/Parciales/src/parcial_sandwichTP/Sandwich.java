package parcial_sandwichTP;

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
        if(this.pan.getCalidad().equals("Premium")){ // esto no deberia estar en la de sandwich sino a la de Pan
            total += this.pan.retornarCostoFinal();
        }else
            total += this.pan.getCosto();
        for(int i=0; i<this.dimL; i++){
            if(this.ingre[i].getGrupo().equals("B")){ // como anterior pero la de ingrediente
                total += this.ingre[i].retornarCostoFinal();
            }else
                total += this.ingre[i].getCosto();
        }
        return total;
    }
    
    public String toString(){
        String aux ="Nombre sandwich: "+nombre+"\n"+this.pan.toString()+"\n";
        for(int i=0; i<this.dimL; i++){
            aux += "["+(i+1)+"]"+this.ingre[i].toString()+"\n";
        }
        // aca falto el retorno de final costo 
        return aux;
    }
}
