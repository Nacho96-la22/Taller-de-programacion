package tema5;

public class Investigador {
    private String nomCompleto;
    private int categoria;
    private String especial;
    private Subsidio [] subsidio;
    private int cantSub = 0;
    
    public Investigador (String nomCompleto, int categoria, String especial){
        this.nomCompleto = nomCompleto;
        this.categoria = categoria;
        this.especial = especial;
        this.subsidio = new Subsidio[5];
        this.inicializarSubsidio(subsidio);
    }
    
    public boolean puedoAgregar() {
        return cantSub < 5;
    }
    
    private void inicializarSubsidio(Subsidio [] vec){
        int i;
        for(i=0;i<5;i++){
            vec[i]= new Subsidio(0,"null");
        }
    }
    
    public void agregarSubsidio(Subsidio unSubsidio){
        if (puedoAgregar()){
            this.subsidio[cantSub] = unSubsidio;
            this.subsidio[cantSub++].setEstado();
        } 
    }

    public String getNomCompleto() {
        return nomCompleto;
    }

    public void setNomCompleto(String nomCompleto) {
        this.nomCompleto = nomCompleto;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public String getEspecial() {
        return especial;
    }

    public void setEspecial(String especial) {
        this.especial = especial;
    }

    public Subsidio[] getSubsidio() {
        return subsidio;
    }
    
    public int getCantSub() {
        return cantSub;
    }
    
    public double totalSubsidio(){
        int i;
        double aux = 0;
        for (i=0;i< this.cantSub;i++){
            aux = aux + subsidio[i].getMonto();
        }
        return aux;
    }
    
    
    @Override
    public String toString(){
        String aux = "Nombre: "+ this.getNomCompleto() + ", categoria: "+ this.getCategoria() +", especialidad: "+ this.getEspecial()+"\n"+
                    "total de dinero de sus subsidios otorgados: "+ this.totalSubsidio();
        return aux;
    }
}
