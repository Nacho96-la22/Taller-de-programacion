package parcial_empresa;

public abstract class Persona {
    private String nombre;
    private int DNI;
    private int anioIngreso;
    private double sueldoBasico;

    public Persona(String nombre, int DNI, int anioIngreso, double sueldoBasico) {
        this.nombre = nombre;
        this.DNI = DNI;
        this.anioIngreso = anioIngreso;
        this.sueldoBasico = sueldoBasico;
    }
    
    public double sueldoAcobrar(){ // B.2
        double aumento; double total = 0;        
        if ((2024 - this.anioIngreso) > 20){
            total = this.sueldoBasico;
            aumento = this.sueldoBasico * 0.10;
            total += aumento;
        } else {
            System.out.println("Ellos fueron superior los 20 años de antiguedad.");
        }
        return total;
    }
    
    @Override
    public String toString(){ // B.3
        return "Nombre: "+ nombre + ", DNI: "+ DNI;
    }
}
