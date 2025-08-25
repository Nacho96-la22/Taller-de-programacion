package parcial_estacionamiento;

public class Estacionamiento {
    private String direccion;
    private double costoPorHora;
    private int dimS; // S = Sector
    private int dimV;
    private Vehiculo [][] lugar;

    public Estacionamiento(String direccion, double costoPorHora,int S,int V) {
        this.direccion = direccion;
        this.costoPorHora = costoPorHora;
        this.dimS = S;
        this.dimV = V;
        this.lugar = new Vehiculo[this.dimS][this.dimV];
        //inicializarMatrices();
    }
    
    /*private void inicializarMatrices(){
        for(int f=0; f<this.dimS; f++){
            for(int c=0; c<this.dimV; c++){
                this.lugar[f][c]=null;
            }
        }
    }*/
    
    public boolean estaOcupado(int X, int Y){
        return this.lugar[X-1][Y-1] != null;
    }
    
    public void agregarVehiculo(int X, int Y, Vehiculo V){
        if((1 <= X && X <= dimS) && (1 <= Y && Y <= dimV)){
            if (!estaOcupado(X, Y)){
                this.lugar[X-1][Y-1] = V;
            }
        }
    }
    
    public String liberarMarca(String M,int X){
        String aux = "";
        for(int i=0; i<this.dimV; i++){
            if(this.lugar[X-1][i] != null){
                if(this.lugar[X-1][i].getMarca().equals(M)){
                   aux += this.lugar[X-1][i].toString()+", hora estacionado: "+ (this.lugar[X-1][i].getCantHora() * this.costoPorHora);
                    this.lugar[X-1][i] = null;
                }
            }
            
        }
        return aux;
    } 
    
    public int SectorMayor(){
        int sectorMax = 0;
        double costoMax = -1;
        for(int f=0; f<this.dimS; f++){
            double costoActual = 0;
            for(int c=0; c<this.dimV; c++){
                if(this.lugar[f][c] != null){
                    costoActual += (this.lugar[f][c].getCantHora() * this.costoPorHora);
                }
            }
            if(costoMax < costoActual){
                sectorMax = (f+1);
                costoMax = costoActual;
            }
        }
        return sectorMax;
    }
    
    @Override
    public String toString(){
        String aux="Estacionamiento: "+direccion+"; Costo por hora: "+costoPorHora+"\n";
        for(int f=0; f<this.dimS; f++){
            aux += "> Sector "+(f+1)+":\n";
            for(int c=0; c<this.dimV; c++){
                if(this.lugar[f][c] != null){
                    aux += "- Lugar ["+(c+1)+"]: "+this.lugar[f][c].toString()+", hora estacionado: "+ (this.lugar[f][c].getCantHora() * this.costoPorHora)+"\n";
                }
                
            }
        }
        return aux;
    }
}
