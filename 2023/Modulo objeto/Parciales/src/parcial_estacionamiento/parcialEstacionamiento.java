package parcial_estacionamiento;
import PaqueteLectura.*;

public class parcialEstacionamiento {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        Estacionamiento est = new Estacionamiento("calle 49 e/ 3 y 4",1500,3,4);
        
        Vehiculo vehiculo;
        String [] marca = {"Ford","Audi","Toyota","Nissian"};
        String [] modelo = {"Focus","A3","Hilux","Fiesta"};
        
        for(int i=0; i<7; i++){
            vehiculo= new Vehiculo(GeneradorAleatorio.generarString(5), GeneradorAleatorio.generarInt(4)+1, 
                    marca[GeneradorAleatorio.generarInt(4)], modelo[GeneradorAleatorio.generarInt(4)]);
            est.agregarVehiculo(GeneradorAleatorio.generarInt(3)+1, GeneradorAleatorio.generarInt(3)+1, vehiculo);
        }
        
        System.out.println(est);
        System.out.println("Este sector fue mayor recaudando: "+est.SectorMayor());
        System.out.println("-----------------------------------");
        est.liberarMarca(marca[GeneradorAleatorio.generarInt(4)], GeneradorAleatorio.generarInt(3)+1);
        System.out.println(est);
    }
    
}
