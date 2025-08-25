package parcial_libreria;
import PaqueteLectura.*;

public class parcialLibreria {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        Libreria lib = new Libreria("Yenny", 3);
        
        String [] medio = {"Efectivo","Debito","Credito"};
        for(int i=0; i<6; i++){    
            int dni = GeneradorAleatorio.generarInt(99999999-30000000)+30000000;
            int cant = GeneradorAleatorio.generarInt(5)+1;
            double monto = GeneradorAleatorio.generarDouble(10000-1000)+1000;
            lib.agregarCliente(GeneradorAleatorio.generarInt(4)+1, dni, cant, monto, medio[GeneradorAleatorio.generarInt(3)]);
        }
        
        System.out.println(lib);
        System.out.println("El ticket fue mayor monto abonado de toda libreria:\n"+lib.clienteMayorMonto());
        System.out.println("-------------------------------");
        lib.bajaCaja(2);
        System.out.println(lib);
    }
    
}
