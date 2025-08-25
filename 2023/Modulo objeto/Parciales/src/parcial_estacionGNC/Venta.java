package parcial_estacionGNC;

public class Venta {
    private int DNI;
    private int cantM3;
    private double monto;
    private String medioPago;

    public Venta(int DNI, int cantM3, double monto, String medioPago) {
        this.DNI = DNI;
        this.cantM3 = cantM3;
        this.monto = monto;
        this.medioPago = medioPago;
    }

    public int getDNI() {
        return DNI;
    }

    public void setDNI(int DNI) {
        this.DNI = DNI;
    }

    public int getCantM3() {
        return cantM3;
    }

    public void setCantM3(int cantM3) {
        this.cantM3 = cantM3;
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
        return"- DNI del cliente: "+ DNI +", cantidad de m3 cargados: "+ cantM3 + ", monto abonado: "+ Math.round(monto) +" y el medio de pago: "+ medioPago;
    }
}
