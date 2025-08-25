package parcial_empresa;

public class Encargado extends Persona{
    private int cantEmpleado;

    public Encargado(String nombre, int DNI, int anioIngreso, double sueldoBasico, int cantEmpleado) {
        super (nombre, DNI, anioIngreso, sueldoBasico);
        this.cantEmpleado = cantEmpleado;
    }
    
    @Override
    public double sueldoAcobrar(){ // B.2
        return super.sueldoAcobrar() + (this.cantEmpleado*1000);
    }
    
    public String toString2(){ // B.3
        return "Encargado: \n"+ super.toString()+ " y sueldo a cobrar: "+ this.sueldoAcobrar()+"\n";
    }
}
