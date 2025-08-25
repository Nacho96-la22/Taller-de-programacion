package parcial_estacionServicio;

public class Venta {
    private int DNI;
    private int cantLitro;
    private double monto;
    private String medioPago;

    public Venta(int DNI, int cantLitro, double monto, String medioPago) {
        this.DNI = DNI;
        this.cantLitro = cantLitro;
        this.monto = monto;
        this.medioPago = medioPago;
    }

    public int getDNI() {
        return DNI;
    }

    public void setDNI(int DNI) {
        this.DNI = DNI;
    }

    public int getCantLitro() {
        return cantLitro;
    }

    public void setCantLitro(int cantLitro) {
        this.cantLitro = cantLitro;
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
        return "DNI del cliente: "+ DNI +", cantidad de litros cargados: "+ cantLitro +", monto abonado: "+ Math.round(monto) +" y el medio de pago utilizado: "+medioPago;
    }
}
