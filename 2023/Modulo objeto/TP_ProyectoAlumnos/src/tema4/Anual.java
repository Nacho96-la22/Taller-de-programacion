package tema4;

public class Anual extends SistemaMeterologica{

    public Anual(Estacion est, int inicialAño, int mes) {
        super(est, inicialAño, mes);
    }
    
    @Override
    public String retornarPromedio(){
        String aux = "";
        double total;
        for(int f=0; f < this.getCantAño(); f++){
            total = 0;
            for(int c=0; c<12; c++){
               total +=  getTemperatura(c+1, f+this.getInicialAño()); 
            }
            aux += "- Año "+(f+this.getInicialAño())+": "+ Math.round(((total/12)*100)/100)+" °C;\n";
        }
        return aux;
    }
    
    @Override
    public String toString(){
        return super.toString();
    }
}
