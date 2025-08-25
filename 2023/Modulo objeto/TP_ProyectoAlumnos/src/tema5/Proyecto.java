package tema5;

public class Proyecto {
    private String nom;
    private int codigo;
    private String nomDirector;
    private int dimL = 0;
    private int dimF = 50;
    private Investigador[] vecI;
    
    // Constructor 
    public Proyecto (String nom, int codigo, String nomDirector){
        this.nom = nom;
        this.codigo = codigo;
        this.nomDirector = nomDirector;
        this.vecI = new Investigador[dimF]; // Inicializar el vector 
    }

    public int getDimL() {
        return dimL;
    }
    
    public boolean estaLleno (){
        return dimL == dimF;
    }
    
    public void agregarInvestigador (Investigador unInvestigador){
        if (!this.estaLleno()){
            this.vecI[dimL++] = unInvestigador;
        } else {
            System.out.print("Esta lleno");
        }
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNomDirector() {
        return nomDirector;
    }

    public void setNomDirector(String nomDirector) {
        this.nomDirector = nomDirector;
    }

    public Investigador[] getVecI() {
        return vecI;
    }

    public double dineroTotalOtorgado(){
        double aux = 0;
        int i;
        for (i=0;i<this.getDimL();i++){
            aux +=  vecI[i].totalSubsidio();
        }
        return aux;
    }
    
    public void otorgarTodos (String nombre_completo){
        int i;
        Investigador aux = null;
        for (i=0;i<this.dimL;i++){
            if (nombre_completo.equals(vecI[i].getNomCompleto())){
                aux = vecI[i];
            }
        }
        if (aux == null){
            System.out.println("No existe este nombre de investigador");
        } else {
            aux.toString();
        }
    }
    
    @Override
    public String toString(){
        String aux = "Nombre del proyecto: "+ this.getNom() +", codigo: "+ this.getCodigo() +", nombre del director: "+ this.getNomDirector()+"\n"+
                    "total de dinero otorgado del proyecto: "+ this.dineroTotalOtorgado();
        
        return aux;
    }
}
