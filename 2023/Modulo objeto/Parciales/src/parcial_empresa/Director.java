package parcial_empresa;

public class Director extends Persona{
    private double monto;

    public Director(String nombre, int DNI, int anioIngreso, double sueldoBasico, double monto) {
        super (nombre, DNI, anioIngreso, sueldoBasico);
        this.monto = monto;
    }
    
    @Override
    public double sueldoAcobrar(){ // B.2
        return super.sueldoAcobrar() + this.monto;
    }
    
    public String toString2(){ // B.3
        return "Director: "+ super.toString() + " y sueldo a cobrar: "+ monto + "\n";
    }
}
