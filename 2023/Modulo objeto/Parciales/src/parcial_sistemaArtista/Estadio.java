package parcial_sistemaArtista;

public class Estadio {
    private String nombre;
    private String direccion;
    private int capacidad;
    private Concierto [][] con;
    private int [] MesLogica;

    public Estadio(String nombre, String direccion, int capacidad) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.capacidad = capacidad;
        inicializarVector();
        inicializarMatrices();
    }
    
    private void inicializarVector(){
        this.MesLogica = new int[12];
        for (int i=0; i<12;i++){
            this.MesLogica[i] = 0;
        }
    }
    
    private void inicializarMatrices(){
        this.con = new Concierto[12][31];
        for (int f=0; f<12; f++){
            for(int c=0; c<31; c++){
                this.con[f][c] = null;
            }
        }
    }

    public void registrarConcierto (int M, Concierto C){
        if (1 <= M && M <= 12){
            if (this.MesLogica[M-1] < 31){
                this.con[M-1][this.MesLogica[M-1]++] = C;
            } else {
                System.out.println("No hay disponibilidad este mes.");
            }
        } else {
            System.out.println("Ese mes no es valido.");
        }
    }
    
    public String retornarConciertoMes (int M){
        if (1 <= M && M <= 12){
            String aux = "> Lista los conciertos de mes "+ M +": \n"; // No es necesario la condicion de if si es null 
            for(int i=0; i<this.MesLogica[M-1]; i++){                 // xq ya esta ordenada.
                    aux += "- "+ this.con[M-1][i] +"\n";
            } 
            return aux;
        } else
            return "Ese mes no es valido.";
    }
    
    public double CalcularGanancias (int M){
        double total = 0;
        for (int i=0; i<this.MesLogica[M-1]; i++){
            total += this.con[M-1][i].getRecaudacion();
        }
        return Math.round(total/2);
    }
    
    @Override
    public String toString(){
        String aux = "> Estadio: "+ nombre +", direccion: "+ direccion +"; y capacidad: "+ capacidad +"\n";
        for(int f=0; f<12; f++){
            aux += "- Mes "+ (f+1) +":\n";
            for(int c=0; c<this.MesLogica[f]; c++){
                aux += "   Dia "+(c+1)+": "+ con[f][c].toString()+"\n";
            }
        }
        return aux;
    }
}