package parcial_banco;

public class Cuenta {
    private int CBU;
    private String alias;
    private int DNItitular;
    private String moneda;
    private double monto = 0;

    public Cuenta(int CBU, String alias, int DNItitular, String moneda, double monto) {
        this.CBU = CBU;
        this.alias = alias;
        this.DNItitular = DNItitular;
        this.moneda = moneda;
        this.monto = monto;
    }

    public int getCBU() {
        return CBU;
    }

    public void setCBU(int CBU) {
        this.CBU = CBU;
    }

    public String getAlias() {
        return alias;
    }

    public void setAlias(String alias) {
        this.alias = alias;
    }

    public int getDNItitular() {
        return DNItitular;
    }

    public void setDNItitular(int DNItitular) {
        this.DNItitular = DNItitular;
    }

    public String getMoneda() {
        return moneda;
    }

    public void setMoneda(String moneda) {
        this.moneda = moneda;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }
    
    public void depositar(double mon){
        this.monto += mon;
    }
    
    @Override
    public String toString(){
        return "DNI del titular: "+ DNItitular +"\n"+
                "CBU: "+ CBU +" y alias: "+ alias+"\n"+
                "Tipo de moneda: "+ moneda+"\n"+
                "Monto: "+ Math.round(monto);
    }
}
