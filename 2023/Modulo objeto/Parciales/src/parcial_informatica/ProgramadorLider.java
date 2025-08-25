package parcial_informatica;

public class ProgramadorLider extends Programador{
    private int antiguedadAño;
    private int cantProyecto;

    public ProgramadorLider(int antiguedadAño, int cantProyecto, String nombre, int DNI, double sueldo, int cantLineaCod, String lenguajePref) {
        super(nombre, DNI, sueldo, cantLineaCod, lenguajePref);
        this.antiguedadAño = antiguedadAño;
        this.cantProyecto = cantProyecto;
    }

    public int getAntiguedadAño() {
        return antiguedadAño;
    }

    public void setAntiguedadAño(int antiguedadAño) {
        this.antiguedadAño = antiguedadAño;
    }

    public int getCantProyecto() {
        return cantProyecto;
    }

    public void setCantProyecto(int cantProyecto) {
        this.cantProyecto = cantProyecto;
    }
    
    public double calcularAumento(){
        return super.calcularSueldo() + ((10000 * getAntiguedadAño()) + (20000 * getCantProyecto()));
    }
    
    @Override
    public void aumentoMonto(double M){
        super.aumentoMonto(M);
    }
    
    @Override
    public String toString(){
        return super.toString();
    }
}
