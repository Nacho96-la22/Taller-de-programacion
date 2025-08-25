package parcial_sandwichTPcorregido;

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
        if (this.getGrupo().equals("B")){
            return Math.round(this.getCosto()*1.10); 
        } else
            return this.getCosto();
    }
    
    public String toString(){
        return"Ingrediente: "+super.toString()+" - grupo: "+grupo;
    }
}
