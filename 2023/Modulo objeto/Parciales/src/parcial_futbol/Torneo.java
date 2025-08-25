package parcial_futbol;

public class Torneo {
    private String nombre;
    private Fecha [] tabla;
    private int fecha;
    
    //Constructor
    //                            N = fecha y M = canitdad de jugadores
    public Torneo(String nombre, int N, int M) {
        this.nombre = nombre;
        this.fecha = N;
        this.tabla = new Fecha[N];
        for (int i=0; i < N; i++){           /*<= Esto es para crear una lista limitado */  
            this.tabla[i] = new Fecha (M);   // Inicializar el vector
        }
    }

    public void agregarJugadores(int x, Goleador jug){
        this.tabla[x-1].agregarGoleador(jug);
    }
        
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getFecha() {
        return fecha;
    }

    public void setFecha(int fecha) {
        this.fecha = fecha;
    }
    
    public Goleador menosGolesPorFecha(int x){
        return this.tabla[x-1].menosGoles();
    }
    
    public int totalGoles(){
        int total =0;
        for (int i=0; i < this.fecha; i++){
            total += this.tabla[i].cantGoles();
        }
        return total;
    }
    
    @Override
    public String toString (){
        String aux = "Torneo 2024:" + "\n";
        for(int i=0; i < this.fecha; i++){
            aux += "> Fecha #"+ (i+1) + " | cantidad de jugadores: "+ this.tabla[i].getCantGoleador() +" | " + "\n"+
                    this.tabla[i]+"\n";
        }
        return aux;
    }
}
