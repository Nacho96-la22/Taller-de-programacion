package parcial_estacionGNC;
import PaqueteLectura.*;

public class parcialEstacionGNC {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        Estacion est = new Estacion("Calle 62 y 131",500,3);
        
        String medio[] = {"Efectivo","Debito","Credito"};
        for(int i=0; i<10; i++){
            int dni = GeneradorAleatorio.generarInt(99999999-30000000)+30000000;
            int cantM3 = GeneradorAleatorio.generarInt(10)+1;
            String pago = medio[GeneradorAleatorio.generarInt(3)];
            est.agregarSurtidor(GeneradorAleatorio.generarInt(6)+1, dni,cantM3,pago);
        }        
        
        System.out.println(est);
        System.out.println("La venta fue mayor monto abonado:\n"+est.ventaMayor());
        System.out.println("----------------------");
        est.bajaServicio(1200);
        System.out.println(est);
    }
    
}
