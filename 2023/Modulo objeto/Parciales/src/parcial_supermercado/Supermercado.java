package parcial_supermercado;

public class Supermercado {
    private String direccion;
    private int nroVentaActual;
    private int dimL;
    private int dimF;
    private Caja [] caja;

    public Supermercado(String direccion) {
        this.direccion = direccion;
        this.nroVentaActual = 0;
        this.dimL = 0;
        this.dimF = 5;
        this.caja = new Caja[this.dimF];
    }
    
    public boolean hayLugarEnCaja(){
        return this.dimL<this.dimF;
    }
    
    public void agregarCaja(Caja c){
        if(hayLugarEnCaja()){
            this.caja[this.dimL++]= c;
        }else
            System.out.println("No hay el espacio en las cajas.");
    }
    
    public void agregarCliente(int N, int unCUIT,int unCantP,double unMonto,String unMedioPago){
        if(1 <= N && N <= dimF){
            if(this.caja[N-1] != null){
                this.nroVentaActual += 1;
                this.caja[N-1].agregarCliente(this.nroVentaActual,unCUIT, unCantP, unMonto, unMedioPago);
            }
        }else
            System.out.println("Este numero de caja no es valido.");
    }
    
    public int cajaMenorCredito (){
        int minCaja=0;
        int minCredito=999;
        for(int i=0; i<this.dimL;i++){
            int cantActual = this.caja[i].contaCredito();
            if(cantActual < minCredito){
                minCredito = cantActual;
                minCaja = i+1;
            }
        }
        return minCaja;
    }
    
    @Override
    public String toString(){
        String aux = "Supermercado: "+direccion+"; Cantidad de caja: "+dimL+"\n";
        for(int i=0; i<this.dimL; i++){
            aux += "Caja ["+(i+1)+"] "+this.caja[i].toString()+"\n";
        }
        return aux;
    }
}
