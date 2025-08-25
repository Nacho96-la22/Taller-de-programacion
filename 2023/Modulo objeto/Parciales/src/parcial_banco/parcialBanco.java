package parcial_banco;
/*import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;*/
import PaqueteLectura.*;

public class parcialBanco {

    public static void main(String[] args) {
        Tradicional banTrad = new Tradicional("12 e/ 58 y 59","La Plata","Martin Rodriguez",10,5);
        Digital banDig = new Digital("www.bancoprovincia.com.ar","Juan Pablo Lewandoski",6,5);
        String [] moneda = {"Pesos","Dolares"};
        
        
        for (int i=0; i<5; i++){
            Cuenta cuentaTrad = new Cuenta(GeneradorAleatorio.generarInt(20000)+10000,GeneradorAleatorio.generarString(5),GeneradorAleatorio.generarInt(50000000-30000000)+30000000,moneda[GeneradorAleatorio.generarInt(2)],GeneradorAleatorio.generarDouble(100000-20000)+20000);
            banTrad.agregarCuenta(cuentaTrad);
        }
        for (int i=0; i<5; i++){
            Cuenta cuentaDig = new Cuenta(GeneradorAleatorio.generarInt(20000)+10000,GeneradorAleatorio.generarString(5),GeneradorAleatorio.generarInt(5000000-3000000)+3000000,moneda[GeneradorAleatorio.generarInt(2)],GeneradorAleatorio.generarDouble(100000-20000)+20000);
            banDig.agregarCuenta(cuentaDig);
        }
        
        System.out.println("______/ Banco tradicional /______");
        for (int i=0; i<5; i++){
            System.out.println(banTrad.getCue()[i]);
            System.out.println();
        }
        
        System.out.println("______/ Banco digital /______");
        for (int i=0; i<5; i++){
            System.out.println(banDig.getCue()[i]);
            System.out.println();
        }
        System.out.println("> Inciso 2.C:");
        System.out.println("- Ingrese el CBU: "); int cbu1 = Lector.leerInt();
        System.out.println("- Ingrese el monto: "); double monto = Lector.leerDouble();
        banTrad.depositarDinero(cbu1, monto);
        System.out.println();
        System.out.println(banTrad.getCue()[1]);
        System.out.println();
        System.out.println("> Inciso 2.D:");
        System.out.println("- Ingrese el CBU para tradicional: "); int cbu2 = Lector.leerInt();
        System.out.println(banTrad.puedeRecibirTarjeta(cbu2));
        System.out.println("- Ingrese el CBU para digital: "); int cbu3 = Lector.leerInt();
        System.out.println(banDig.puedeRecibirTarjeta(cbu3));
    }
    
}
