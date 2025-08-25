package parcial_libreria;

public class Caja {
    private boolean disposible = true;
    private int dimL;
    private int dimF;
    private Ticket [] ticket;

    public Caja(int T) {
        this.dimL = 0;
        this.dimF = T;
        this.ticket = new Ticket[this.dimF];
    }

    public void setDisposible(boolean disposible) {
        this.disposible = disposible;
    }
    
    public boolean hayLugar(){
        return this.dimL < this.dimF;
    }
    
    public void agregarCliente(int unDNI, int unCant,double unMonto,String unMedioPago,int nroTicket){
        Ticket tic = new Ticket(nroTicket, unDNI, unCant, unMonto, unMedioPago);
        if(hayLugar()){
            this.ticket[this.dimL++] = tic;
        }
    }
    
    public int totalLibro(){
        int total=0;
        for(int i=0; i<this.dimL; i++){
            total += this.ticket[i].getCantLibroComprado();
        }
        return total;
    }
    
    public Ticket mayor(){
        Ticket clienteMax = null;
        double montoMax = -1;
        for(int i=0;i<this.dimL;i++){
            if(this.ticket[i].getMonto() > montoMax){
                clienteMax = this.ticket[i];
                montoMax = this.ticket[i].getMonto();
            }
        }
        return clienteMax;
    }
    
    @Override
    public String toString(){
        String aux="Disposible: "+ disposible+";\n";
        for(int i=0; i<this.dimL; i++){
            aux += this.ticket[i].toString()+"\n";
        }
        return aux;
    }
}
