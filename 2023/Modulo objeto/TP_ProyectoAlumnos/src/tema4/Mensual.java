package tema4;

public class Mensual extends SistemaMeterologica{
    private String [] meses = new String[]{"Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto",
        "Septiembre","Octubre","Noviembre","Diciembre"};

    public Mensual(Estacion est, int inicialAño, int mes) {
        super(est, inicialAño, mes);
    }
    
    @Override
    public String retornarPromedio(){
        String aux = "";
        double total;
        for(int f=0; f<12; f++){
            total = 0;
            for(int c=0; c< this.getCantAño(); c++){
                total += getTemperatura(f+1, c+this.getInicialAño());
            }
            aux += meses[f]+": "+ Math.round((total*100)/100.0)+" °C;\n";
        }
        return aux;
    }
    
    @Override
    public String toString(){
        return super.toString();
    }
}
