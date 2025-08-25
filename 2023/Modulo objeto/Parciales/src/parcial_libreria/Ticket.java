package parcial_libreria;

public class Ticket {
    private int nroTicket;
    private int DNI;
    private int cantLibroComprado;
    private double monto;
    private String medioPago;

    public Ticket(int nroTicket, int DNI, int cantLibroComprado, double monto, String medioPago) {
        this.nroTicket = nroTicket;
        this.DNI = DNI;
        this.cantLibroComprado = cantLibroComprado;
        this.monto = monto;
        this.medioPago = medioPago;
    }

    public int getNroTicket() {
        return nroTicket;
    }

    public void setNroTicket(int nroTicket) {
        this.nroTicket = nroTicket;
    }

    public int getDNI() {
        return DNI;
    }

    public void setDNI(int DNI) {
        this.DNI = DNI;
    }

    public int getCantLibroComprado() {
        return cantLibroComprado;
    }

    public void setCantLibroComprado(int cantLibroComprado) {
        this.cantLibroComprado = cantLibroComprado;
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
        return"- Numero de ticket: "+nroTicket+", DNI del cliente: " + DNI+", cantidad de libros comprado: "+cantLibroComprado+", monto abonado: "+Math.round(monto)+" y medio de pago: "+ medioPago;
    }
}
