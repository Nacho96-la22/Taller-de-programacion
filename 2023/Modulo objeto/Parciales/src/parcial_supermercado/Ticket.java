package parcial_supermercado;

public class Ticket {
    private int nroTicket;
    private int CUIT;
    private int cantProductos;
    private double monto;
    private String medioPago;

    public Ticket(int nroTicket, int CUIT, int cantProductos, double monto, String medioPago) {
        this.nroTicket = nroTicket;
        this.CUIT = CUIT;
        this.cantProductos = cantProductos;
        this.monto = monto;
        this.medioPago = medioPago;
    }

    public int getNroTicket() {
        return nroTicket;
    }

    public void setNroTicket(int nroTicket) {
        this.nroTicket = nroTicket;
    }

    public int getCUIT() {
        return CUIT;
    }

    public void setCUIT(int CUIT) {
        this.CUIT = CUIT;
    }

    public int getCantProductos() {
        return cantProductos;
    }

    public void setCantProductos(int cantProductos) {
        this.cantProductos = cantProductos;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public String getMedioPago() {
        return medioPago;
    }

    public void setMedioPago(String medioPago) {
        this.medioPago = medioPago;
    }
    
    @Override
    public String toString(){
        return"- Nro de ticket: "+ nroTicket+", CUIT del cliente: "+CUIT+", cantidad de productos: "+ cantProductos+", monto abonado: "+ Math.round(monto)+" y medio pago: "+ medioPago;
    }
}
