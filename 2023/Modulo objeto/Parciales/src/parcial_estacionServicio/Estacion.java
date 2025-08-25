package parcial_estacionServicio;

public class Estacion {
    private String direccion;
    private int dimL;
    private int dimF = 6;
    private Surtidor [] infoSurtidor;

    public Estacion(String direccion) {
        this.direccion = direccion;
        this.dimL = 0;
        this.infoSurtidor = new Surtidor[dimF];
        for(int i=0; i<dimF; i++){
            this.infoSurtidor[i] = null;
        }
    }

    public int getDimL() {
        return dimL;
    }

    public void setDimL(int dimL) {
        this.dimL = dimL;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    
    public boolean hayLugarEnSurtidor(){
        return dimL < dimF;
    }
    
    // 2.a
    public void agregarSurtidor(Surtidor unSurtidor){
        if(hayLugarEnSurtidor()){
            this.infoSurtidor[dimL++] = unSurtidor;
        } else
            System.out.println("No hay lugar en el surtidor.");
    }
    
    // 2.b
    public void agregarClientePago(int N, Venta unCliente){
        if(1 <= N && N <= 6){
            this.infoSurtidor[N-1].agregarClienteVenta(unCliente);
        } else
            System.out.println("El numero de surtidor no es valido.");
    }
    
    // 2.c
    public int mayorMontoRecaudarSurtidor(){
        int nSurtidorMax = 0;
        double maxMonto = 0;
        for(int i=0; i<this.dimL; i++){
            double montoActual = this.infoSurtidor[i].getMayorMonto();
            if (maxMonto < montoActual){
                maxMonto = montoActual;
                nSurtidorMax = (i+1);
            }
        }
        return nSurtidorMax;
    }
    
    // 2.d
    @Override
    public String toString(){
        String aux;
        aux = "Estacion de Servicio: "+ direccion +"\n";
        for(int i=0; i<this.dimL; i++){
            aux += "Surtidor "+ (i+1) + ": "+ this.infoSurtidor[i].toString()+"\n";
        }
        return aux;
    }
}
