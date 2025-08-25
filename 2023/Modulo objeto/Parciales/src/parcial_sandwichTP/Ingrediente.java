package parcial_sandwichTP;

public class Ingrediente extends Componente{
    private String grupo;

    public Ingrediente(String grupo, String nombre, double costo) {
        super(nombre, costo);
        this.grupo = grupo;
    }

    public String getGrupo() {
        return grupo;
    }

    public void setGrupo(String grupo) {
        this.grupo = grupo;
    }
    
    public double retornarCostoFinal(){
        return this.getCosto()*1.10; // falta la condicion de cumple
    }
    
    public String toString(){
        return"Ingrediente: "+super.toString()+" - grupo: "+grupo;
    }
}
