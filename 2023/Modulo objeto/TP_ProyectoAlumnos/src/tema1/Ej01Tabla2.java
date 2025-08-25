package tema1;
import PaqueteLectura.GeneradorAleatorio;

public class Ej01Tabla2 {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int DF=11;  
        int [] tabla2 = new int[DF]; // indices de 0 a 10
        int i;
        for (i=0;i<DF;i++) {
            int num = GeneradorAleatorio.generarInt(10);
            tabla2[i]=num*i;
            System.out.println("2 x " + i + " = "+ tabla2[i]);
        }
        System.out.println("2 x " + "5 " + "= "+ tabla2[5]);
    }
}
