package parcial_informatica;

public class Programador {
    private String nombre;
    private int DNI;
    private double sueldo;
    private int cantLineaCod;
    private String lenguajePref;
    
    public Programador(String nombre, int DNI, double sueldoBasico, int cantLineaCod, String lenguajePref) {
        this.nombre = nombre;
        this.DNI = DNI;
        this.sueldo = sueldoBasico;
        this.cantLineaCod = cantLineaCod;
        this.lenguajePref = lenguajePref;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDNI() {
        return DNI;
    }

    public void setDNI(int DNI) {
        this.DNI = DNI;
    }

    public int getCantLineaCod() {
        return cantLineaCod;
    }

    public void setCantLineaCod(int cantLineaCod) {
        this.cantLineaCod = cantLineaCod;
    }

    public String getLenguajePref() {
        return lenguajePref;
    }

    public void setLenguajePref(String lenguajePref) {
        this.lenguajePref = lenguajePref;
    }
    
    public boolean cumnpleSup200(){
        return this.cantLineaCod > 200;
    }
    
    public double calcularSueldo(){
        double sueldo = this.sueldo;
        if(cumnpleSup200()){
            sueldo += 50000;
        }
        return sueldo;
    }
    
    public void aumentoMonto(double M){
        this.sueldo += M;
    }
    
    @Override
    public String toString(){
        return"nombre: "+ nombre +", DNI: "+DNI+", lenguaje de preferencia: "+lenguajePref+", sueldo final: "+this.calcularSueldo();
    }
}
