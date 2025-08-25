package tema4;
import PaqueteLectura.GeneradorAleatorio;
public class ejercicio6 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Estacion lp = new Estacion("La Plata",-34.921,57.955);
        Anual añoLP = new Anual(lp,2021,3);
        
        Estacion mdq = new Estacion("Mar del Plata",-38.002,-57.556);
        Mensual mesMDQ = new Mensual(mdq,2020,4);
        
        for (int j=0; j < 3; j++){
            for (int i=0; i<12; i++){
                añoLP.setTemperatura(i+1, GeneradorAleatorio.generarInt(2024-2021)+2021, GeneradorAleatorio.generarDouble(39-7)+7);
            }
        }
        
        for (int j=0; j<4; j++){
            int año = 2020;
            for (int i=0; i<12;i++){
                mesMDQ.setTemperatura(i+1, año, GeneradorAleatorio.generarDouble(39-7)+7);
            }
            año++;
        }
    
        System.out.println(añoLP);
        System.out.println(añoLP.MayorTemp());
        System.out.println();
        System.out.println(mesMDQ);
        System.out.println(mesMDQ.MayorTemp());
    }
    
}
