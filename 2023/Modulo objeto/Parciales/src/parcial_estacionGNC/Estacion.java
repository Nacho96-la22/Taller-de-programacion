package parcial_estacionGNC;

public class Estacion {
    private String direccion;
    private double precio;
    private int dimF = 6;
    private Surtidor [] sur = new Surtidor[dimF];

    public Estacion(String direccion, double precio,int V) {
        this.direccion = direccion;
        this.precio = precio;
        this.inicializarVentas(V);
    }
    
    private void inicializarVentas(int V){
        for(int i=0; i<this.dimF; i++){
            this.sur[i] = new Surtidor(V);
        }
    }
    
    public void agregarSurtidor(int N, int unDNI, int cantM3,String unMedioPago){
        if(1 <= N && N <= dimF){
            this.sur[N-1].agregarVenta(unDNI, cantM3,(this.precio*cantM3),unMedioPago);
        }else
            System.out.println("Este numero no es valido.");
    }
    
    public void bajaServicio(double X){
        for(int i=0; i<this.dimF; i++){
            if(this.sur[i].totalLitros() < X){
                this.sur[i].setServicio(false);
            }
        }
    }
    
    public Venta ventaMayor(){
        Venta ventaMax = null;
        double montoMax = 0;
        for(int i=0; i<this.dimF; i++){
            if(this.sur[i].mayor() != null){
                if (montoMax < this.sur[i].mayor().getMonto()){
                    ventaMax = this.sur[i].mayor();
                    montoMax = this.sur[i].mayor().getMonto();
                }
            }
        }
        return ventaMax;
    }
    
    @Override
    public String toString(){
        String aux = "Estacion de servicio: "+ direccion +"; precio por m3: "+ precio+"\n";
        for(int i=0; i<this.dimF; i++){
            aux += "Surtidor "+(i+1)+";\n"+this.sur[i].toString();
        }
        return aux;
    }
}
