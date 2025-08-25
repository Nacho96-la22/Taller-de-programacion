package tema3;

import PaqueteLectura.Lector;
public class ejercicio4 {
    
    public static void main(String[] args) {
        System.out.println("Ingrese numero de habitacion");
        int N = Lector.leerInt();
        Hotel hot = new Hotel(N);

        Cliente cli = new Cliente();
        System.out.println("> Ingrese un nombre:");
        cli.setNombre(Lector.leerString());
        System.out.println("> Ingrese un DNI:");
        cli.setDNI(Lector.leerInt());
        System.out.println("> Ingrese un edad:");
        cli.setEdad(Lector.leerInt());
        System.out.println("> Ingrese el nro de habitacion:");
        int x = Lector.leerInt();
        if (hot.verificarHabitacion(x)) {
               hot.cargarCliente(cli, x);
        } else {
            System.out.println("La habitacion esta ocupada");
        }

        System.out.println(hot);
        Habitacion hab = new Habitacion();
        System.out.println("Ingrese el monto de aumento: ");
        hab.aumentarCosto(Lector.leerDouble());
        
        //hot.setAumento(Lector.leerDouble());

        System.out.println(hot);
    }
}
