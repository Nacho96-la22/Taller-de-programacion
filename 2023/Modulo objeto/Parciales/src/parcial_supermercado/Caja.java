package parcial_supermercado;

public class Caja {
    private String nombreCajero;
    private int dimF;
    private int dimL;
    private Ticket [] ticket;

    public Caja(String nombreCajero, int T) {
        this.nombreCajero = nombreCajero;
        this.dimL= 0;
        this.dimF= T;
        this.ticket = new Ticket[this.dimF];
    }
    
    public boolean hayLugarEnCaja(){
        return this.dimL<this.dimF;
    }
    
    public void agregarCliente(int nroTicket,int unCUIT,int unCantP,double unMonto,String unMedioPago){
        if(hayLugarEnCaja()){
            this.ticket[this.dimL++] = new Ticket(nroTicket, unCUIT, unCantP, unMonto, unMedioPago);
        }else
            System.out.println("No hay espacio en la caja");
    }
    
    public int contaCredito(){
        int cant=0;
        for(int i=0; i<this.dimL; i++){
            if(this.ticket[i].getMedioPago().equals("Credito")){
                cant++;
            }
        }      
        return cant;
    }
    
    @Override
    public String toString(){
        String aux = "Nombre del cajero: "+ nombreCajero+"\n";
        for(int i=0; i<this.dimL; i++){
            aux += this.ticket[i].toString()+"\n";
        }
        return aux;
    }
}
