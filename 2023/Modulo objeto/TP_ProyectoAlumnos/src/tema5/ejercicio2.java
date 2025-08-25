package tema5;

import PaqueteLectura.Lector;
//import PaqueteLectura.GeneradorAleatorio;
public class ejercicio2 {

    public static void main(String[] args) {
        System.out.print("> Ingrese el nombre: ");
        String nom = Lector.leerString();
        System.out.print("> Ingrese el direccion: ");
        String dire = Lector.leerString();
        System.out.print("> Ingrese la hora apertura: ");
        double numA = Lector.leerDouble();
        System.out.print("> Ingrese la hora cierre: ");
        double numC = Lector.leerDouble();
        
        Estacionamiento est = new Estacionamiento(nom, dire, numA, numC, 3, 3);
        //-------------------------------------------------------
        System.out.println();
        //GeneradorAleatorio.iniciar();
        System.out.println("------------------------------------------");
        Auto auto1 = new Auto("Messi","KJQ-9J1");
        est.setAuto(auto1, 1, 3);
        Auto auto2 = new Auto("Mariana","90J-J12");
        est.setAuto(auto2, 1, 1);
        Auto auto3 = new Auto("Jaime","HTT-8H1");
        est.setAuto(auto3, 1, 2);
        Auto auto4 = new Auto("Cristano","L0F-9C0");
        est.setAuto(auto4, 2, 2);
        Auto auto5 = new Auto("Juan","Y71-JCN");
        est.setAuto(auto5, 2, 1);
        Auto auto6 = new Auto("Karen","89L-HH1");
        est.setAuto(auto6, 2, 3);
        
        System.out.println(est.toString());
        System.out.println("------------------------------------------");
        //-------------------------------------------------------
        System.out.println("La cantidad de autos ubicados en dicha: "+ est.contadorPlaza(1));
        System.out.println("------------------------------------------");
        //-------------------------------------------------------
        System.out.print("> Ingrese el pantente: ");
        String str = Lector.leerString();
        System.out.println(est.buscarPatenteEnEstacionamiento(str));
    }
    
}
