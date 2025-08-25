package parcial_banco;

public class Tradicional extends Banco {
    private String direccion;
    private String localidad;
    private int cantCuentas;

    public Tradicional(String direccion, String localidad, String nombre, int cantEmpleados, int N) {
        super(nombre, cantEmpleados, N);
        this.direccion = direccion;
        this.localidad = localidad;
        this.cantCuentas = 0;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getLocalidad() {
        return localidad;
    }

    public void setLocalidad(String localidad) {
        this.localidad = localidad;
    }
    
    public int getCantCuentas() {
        return cantCuentas;
    }

    public void setCantCuentas(int cantCuentas) {
        this.cantCuentas = cantCuentas;
    }
    
    // 2.a
    @Override
    public boolean agregarCuenta (Cuenta c){
        boolean ok = true;
        if (c.getMoneda().equals("Dolares")) {
            if (this.cantCuentas < 100){
                super.agregarCuenta(c);
                this.cantCuentas += 1;
            } else {
                ok = false;
            }
        } else{
            ok = super.agregarCuenta(c);
        }
        return ok;
    }
    
    //2.d
    @Override
    public boolean puedeRecibirTarjeta(int cbu){
        boolean ok = false;
        int pos = this.busqueda(cbu);
        if (pos != this.getCantCuentas()){
            if(this.getCue()[pos].getMoneda().equals("Pesos") && this.getCue()[pos].getMonto() > 70000){
                ok = true;
            } else if (this.getCue()[pos].getMoneda().equals("Dolares") && this.getCue()[pos].getMonto() > 500){
                ok = true;
            }
        }
        return ok;
    }
}
