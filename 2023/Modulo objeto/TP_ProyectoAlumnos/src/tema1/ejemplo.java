
package tema1;
import PaqueteLectura.GeneradorAleatorio;
public class ejemplo {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int num = GeneradorAleatorio.generarInt(12)+1;
        System.out.println(num);
    }
}

