package parcial_escuelaCancion;

public class Concurso {
    private Cancion [][] can;
    private int categoria;
    private int cancion;

    public Concurso(int categoria, int cancion) {
        this.categoria = categoria;
        this.cancion = cancion;
        this.can = new Cancion[categoria][cancion];
        for (int f=0; f < categoria; f++){
            for(int c=0; c < cancion; c++){
                this.can = null;
            }
        }
    }
    
    public void agregarCancion(int cat, Cancion can){
        int i=0;
        if (i < this.cancion){
            this.can[cat][this.cancion] = can;
            i++;
        }
    }
    
    public void interpretarCancion (int id, Estudiante est, double puntaje){
        Cancion actual=null;
        for (int f=0; f<this.categoria; f++){
            for(int c=0; c<this.cancion; c++)
                if (id == this.can[f][c].getIdentificador()){
                    actual = this.can[f][c];
            }
        }
        if(actual.getPuntaje() < puntaje){
            actual.setPuntaje(puntaje);
            actual.setGanador(est);
        }
    }
    
    // Estoy confundido 
    public Cancion puntajeMasAlto(int id){
        Cancion CancionActual = null;
        for(int f=0;f<this.categoria;f++){
            for(int c=0;c<this.cancion;c++){
                if (id == this.can[f][c].getIdentificador()){
                    CancionActual = this.can[f][c];
                }
            }
        }
        if (CancionActual != null){
            return CancionActual;
        } else 
            return null;        
        /*if (CancionActual != null){
            System.out.print("Este estudiante que haya obtenido el puntaje mas alto: "+CancionActual.getGanador());
        } else
            System.out.println("Ningun estudiante interpreto la canción.");*/
    }
}
