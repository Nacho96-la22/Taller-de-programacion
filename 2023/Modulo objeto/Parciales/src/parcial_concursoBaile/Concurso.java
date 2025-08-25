package parcial_concursoBaile;

public class Concurso {
    private Pareja [] pareja;
    private int N; // Dimension fisica
    private int dimL = 0;

    public Concurso(int N) {
        this.N = N;
        this.pareja = new Pareja[this.N];
        for (int i=0; i<this.N; i++){
            this.pareja[i] = null;
        }
    }

    public int getDimL() {
        return dimL;
    }

    public void setDimL(int dimL) {
        this.dimL = dimL;
    }
    
    public boolean hayLugar(){
        return dimL < N;
    }
    
    public void agregarPareja(Pareja pareja){
        if (hayLugar()){
            this.pareja[dimL++] = pareja;
        }
    }
    
    public Pareja mayorDiferencia(){
        Pareja maxDiferenciaEdad = null;
        int maxDif = -1;
        for(int i=0; i<N; i++){
            if (maxDif < this.pareja[i].diferenciaEdad()){
                maxDiferenciaEdad = this.pareja[i];
                maxDif = this.pareja[i].diferenciaEdad();
            }
        }
        return maxDiferenciaEdad;
    }
    
    @Override
    public String toString(){
        return this.mayorDiferencia().toString();
    }
}
