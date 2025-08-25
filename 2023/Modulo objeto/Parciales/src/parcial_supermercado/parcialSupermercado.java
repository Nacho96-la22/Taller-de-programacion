package parcial_supermercado;
import PaqueteLectura.*;

public class parcialSupermercado {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        Supermercado sm = new Supermercado("calle 25 e/ 61 y 62");
        
        Caja c1,c2,c3;
        c1 = new Caja("Juan Pablo",2);
        c2 = new Caja("Marienla",5);
        c3 = new Caja("Marcelo",3);
        
        sm.agregarCaja(c1);
        sm.agregarCaja(c2);
        sm.agregarCaja(c3);
        
        String [] pago = {"Efectivo","Credito","Debito"};
        for(int i=0; i<10; i++){
            sm.agregarCliente(GeneradorAleatorio.generarInt(3)+1, GeneradorAleatorio.generarInt(99999 - 30000)+30000, 
                    GeneradorAleatorio.generarInt(10)+1, GeneradorAleatorio.generarDouble(50000 - 1500)+1500, pago[GeneradorAleatorio.generarInt(3)]);
        }
        
        System.out.println(sm);
        System.out.println("Este nro de caja fue la menor cantidad de tickets con "
                + "la forma de pago credito: "+sm.cajaMenorCredito());
    }
    
}
