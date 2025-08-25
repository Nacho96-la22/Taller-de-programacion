package tema4;

public abstract class SistemaMeterologica {
    private Estacion est;
    private int inicialAño;
    private int cantAño;
    private double [][] temperatura;
    
    public SistemaMeterologica(Estacion est, int inicialAño, int cantAño) {
        this.est = est;
        this.inicialAño = inicialAño;
        this.cantAño = cantAño;
        this.temperatura = new double [12][cantAño];
        for (int f=0;f<12;f++){
            for(int c=0;c<cantAño;c++){
                this.temperatura[f][c] = 100;
            }
        }
    }

    public Estacion getEst() {
        return est;
    }

    public void setEst(Estacion est) {
        this.est = est;
    }

    public int getInicialAño() {
        return inicialAño;
    }

    public void setInicialAño(int inicialAño) {
        this.inicialAño = inicialAño;
    }

    public int getCantAño() {
        return cantAño;
    }

    public void setCantAño(int cantAño) {
        this.cantAño = cantAño;
    }
    

    // Inciso B
    public void setTemperatura(int mes, int año, double temp) {
        this.temperatura[mes-1][año - inicialAño] = temp;
    }
    
    // Inciso C
    public double getTemperatura(int mes, int año) {
        return this.temperatura[mes-1][año-inicialAño];
    }
    
    // Inciso D
    public String MayorTemp(){
        double maxTemp = -1;
        int maxMes = 0;
        int maxAño = 0;
        for(int f=0; f<12; f++){
            for(int c=0; c<cantAño; c++){
                if (maxTemp < this.temperatura[f][c]){
                    maxTemp = this.temperatura[f][c];
                    maxMes = f;
                    maxAño = c;
                }
            }
        }
        return "Ha registrado la mayor temperatura, el mes es "+ (maxMes+1) + " y el año es "+ (maxAño + this.inicialAño);
    }
    
    public abstract String retornarPromedio();
    
    @Override
    public String toString(){
        return est +"\n"+ retornarPromedio(); 
    }
}
