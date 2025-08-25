package parcial_libreria;

public class Libreria {
    private String nombre;
    private int nroActual;
    private int dimF = 4;
    private Caja [] caja;

    public Libreria(String nombre, int T) {
        this.nombre = nombre;
        this.nroActual = 0;
        this.caja = new Caja[this.dimF];
        inicializarCajas(T);
    }
    
    private void inicializarCajas(int T){
        for(int i=0; i<this.dimF; i++){
            this.caja[i] = new Caja(T);
        }
    }
    
    public void agregarCliente (int N, int unDNI, int unCant,double unMonto,String unMedioPago){
        if(1 <= N && N <= dimF){
            this.nroActual +=1;
            this.caja[N-1].agregarCliente(unDNI, unCant, unMonto, unMedioPago,this.nroActual);
        } else
            System.out.println("El numero N de caja no es valido.");
    }
    
    public void bajaCaja(int X){
        for(int i=0; i<this.dimF; i++){
            if(this.caja[i].totalLibro() < X){
                this.caja[i].setDisposible(false);
            }
        }
    }
    
    public Ticket clienteMayorMonto(){
        Ticket clienteMax = null;
        double montoMax = -1;
        for(int i=0; i<this.dimF; i++){
            if(this.caja[i].mayor() != null){
                if(this.caja[i].mayor().getMonto() > montoMax){
                    clienteMax = this.caja[i].mayor();
                    montoMax = this.caja[i].mayor().getMonto();
                }
            }
        }
        return clienteMax;
    }
    
    @Override
    public String toString(){
        String aux= "Libreria: "+ nombre+"\n";
        for(int i=0; i<this.dimF; i++){
            aux += "Caja "+(i+1)+"; "+this.caja[i].toString();
        }
        return aux;
    }
}
