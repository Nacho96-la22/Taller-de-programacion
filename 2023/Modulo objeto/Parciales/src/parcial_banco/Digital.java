package parcial_banco;

public class Digital extends Banco{
    private String direWeb;

    public Digital(String direWeb, String nombre, int cantEmpleados, int N) {
        super(nombre, cantEmpleados, N);
        this.direWeb = direWeb;
    }

    public String getDireWeb() {
        return direWeb;
    }

    public void setDireWeb(String direWeb) {
        this.direWeb = direWeb;
    }

    @Override
    public boolean puedeRecibirTarjeta(int cbu){
        boolean ok = false;
        int pos = this.busqueda(cbu);
        if(this.getCue()[pos].getMoneda().equals("Pesos") && this.getCue()[pos].getMonto() > 100000){
            ok = true;
        }
        return ok;
    }
}
