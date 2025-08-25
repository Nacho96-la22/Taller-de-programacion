package tema4;

public class Jugador extends Empleado{
    private int partidos;
    private int goles;

    public Jugador(){
    }

    public Jugador (int unPartido, int unGol, String unNombre, double unSueldo, int unAntiguedad){
        super(unNombre, unSueldo, unAntiguedad);
        this.partidos = unPartido;
        this.goles = unGol;   
    }

    public void setPartidos(int partidos) {
        this.partidos = partidos;
    }

    public void setGoles(int goles) {
        this.goles = goles;
    }

    public int getPartidos() {
        return partidos;
    }

    public int getGoles() {
        return goles;
    }

    // Punto - 2.B
    public double calcularEfectividad(){
        double prom = this.getGoles() / this.getPartidos();
        return prom;
    }

    // Punto - 2.C
    public double sueldoBono(){
        if (calcularEfectividad() > 0.5){
            return super.getSueldo();
        } else {
            return 0.0;
        }
    }

    // Punto 2.D
    public String toString() {
        return super.toString() +"\n" +"Jugador ha jugando los partidos: " + partidos + " y convirtió los goles: " + goles;
    }
}
