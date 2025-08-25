package tema4;

public class VisorFigurasModificado {
    private int guardadas;
    private int capacidadMaxima = 5;
    private Figura [] vector;

    public VisorFigurasModificado(){
        this.guardadas = 0;
        this.vector = new Figura[capacidadMaxima];
        for (int i=0; i<5;i++) {
            this.vector = null;
        }
    }

    public void guardar(Figura f){
        if (quedaEspacio()){
            vector[guardadas] = f;
            guardadas++;
        }
    }

    public boolean quedaEspacio() {
        return (guardadas <= 4);
    }

    public void mostrar(){
        for (int i = 0; i < guardadas; i++) {
            System.out.println (vector[i]);
        }
    }

    public int getGuardadas(){
        return guardadas;
    }
}
