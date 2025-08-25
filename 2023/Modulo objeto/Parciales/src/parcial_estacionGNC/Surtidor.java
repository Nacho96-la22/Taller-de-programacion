package parcial_estacionGNC;

public class Surtidor {
    private boolean servicio = true;
    private int dimL;
    private int dimF;
    private Venta[] ven;

    public Surtidor(int V) {
        this.dimL =0;
        this.dimF = V;
        this.ven = new Venta[this.dimF];
    }

    public void setServicio(boolean servicio) {
        this.servicio = servicio;
    }

    public int getDimL() {
        return dimL;
    }

    public void setDimL(int dimL) {
        this.dimL = dimL;
    }
    
    public boolean hayLugarVenta(){
        return this.dimL<this.dimF;
    }
    
    public void agregarVenta(int unDNI, int cantM3,double monto,String unMedioPago){
        Venta V = new Venta(unDNI,cantM3,monto,unMedioPago);
        if(hayLugarVenta()){
            this.ven[this.dimL++]= V;
        }
    }
    
    public double totalLitros(){
        double total =0;
        for(int i=0; i<this.dimL; i++){
            total += this.ven[i].getMonto();
        }
        return Math.round(total);
    }
    
    public Venta mayor(){
        Venta ventaMax = null;
        double montoMax = -1;
        for(int i=0; i<this.dimL; i++){
           if(this.ven[i].getMonto() > montoMax){
               ventaMax = this.ven[i];
               montoMax = this.ven[i].getMonto();
           } 
        }
        return ventaMax; 
    }
    
    @Override
    public String toString(){
        String aux ="> "+servicio+"\n";
        for (int i=0; i<this.dimL; i++){
            aux += this.ven[i].toString()+"\n";
        }
        return aux;
    }
}
