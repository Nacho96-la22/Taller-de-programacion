package tema4;

public class Entrenador extends Empleado{
    private int cantCampeonato;

    public Entrenador (int cant, String unNombre, double unSueldo, int unAntiguedad){
        super(unNombre, unSueldo, unAntiguedad); 
        this.cantCampeonato = cant;
    }

    public void setCantCampeonato(int cantCampeonato) {
        this.cantCampeonato = cantCampeonato;
    }

    public int getCantCampeonato() {
        return cantCampeonato;
    }

    // Punto - 2.B
    public double calcularEfectividad(){
        double prom = this.cantCampeonato/super.getAntiguedad();
        return prom;
    }

    public double sueldoBono(){
        if (getCantCampeonato() > 5) {
            if (getCantCampeonato() > 10)
                return 50000;
            return 30000;
        } else {
            return 5000;
        }
    }

    //Punto 2.D
    public String toString() {
        return super.toString() +"\n"+"Entrenador ha ganado la cantidad de campeonatos ganados: " + cantCampeonato;
    }
}
