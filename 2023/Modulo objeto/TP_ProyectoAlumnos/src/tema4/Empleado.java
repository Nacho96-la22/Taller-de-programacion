package tema4;

public abstract class Empleado {
    private String nombre;
    private double sueldo;
    private int antiguedad;

    public Empleado(){
    } 

    public Empleado(String unNombre, double unSueldo, int unAntiguedad) {
        setNombre(unNombre);
        setSueldo(unSueldo);
        setAntiguedad(unAntiguedad);
    }


    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getSueldo() {
        return sueldo;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }
    
    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }

    public abstract double calcularEfectividad(); // Punto - 2.B
    public abstract double sueldoBono(); // Punto - 2.C

    public double calcularSueldoAcobrar(){ // Punto - 2.C
        return this.sueldo+((getSueldo()*0.1*getAntiguedad()) + sueldoBono());
    }

    public String toString(){
        return "> Nombre: "+ nombre +", su sueldo basico es "+ sueldo +" y el año de antiguedad: "+ antiguedad + "\n"
                + "El final sueldo: $"+ this.calcularSueldoAcobrar();
    }
}
