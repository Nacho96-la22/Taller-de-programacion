package parcial_futbol;

public class Fecha {
    private Goleador [] jugador;
    private int cantGoleador = 0;
    
    public Fecha(int M){
        this.jugador = new Goleador[M];
    }
    
    public int getCantGoleador() {
        return cantGoleador;
    }

    public void setCantGoleador(int cantGoleador) {
        this.cantGoleador = cantGoleador;
    }
    
    public void agregarGoleador (Goleador jug){
        this.jugador[cantGoleador] = jug;
        this.cantGoleador++;
    }
    
    public Goleador menosGoles(){
        Goleador minimo = null;
        double minGoles = 99;
        for (int i=0; i < this.cantGoleador; i++){
            if (this.jugador[i] != null){
                if (this.jugador[i].getCantGoles() < minGoles){
                    minGoles = this.jugador[i].getCantGoles();
                    minimo = this.jugador[i];
                }
            }
        }
        return minimo;
    }
    
    public int cantGoles(){
        int totalgoles=0;
        for (int i=0; i < this.cantGoleador; i++){
            totalgoles += this.jugador[i].getCantGoles();
        }
        return totalgoles;
    }
    
    @Override
    public String toString(){
        String aux = "";
        for (int i = 0; i < this.cantGoleador; i++){
            aux += this.jugador[i]+"\n";
        }
        return aux;
    }
}