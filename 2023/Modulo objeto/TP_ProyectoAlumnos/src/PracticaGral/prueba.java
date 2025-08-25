package PracticaGral;

import PaqueteLectura.Lector;
public class prueba {
    
    public static void main (String[] args) {

        calcular res = new calcular();

        System.out.println("> Ingrese un numero:");
        res.setNro1(Lector.leerInt());
        System.out.println("> Ingrese un numero:");
        res.setNro2(Lector.leerInt());

        System.out.println();

        System.out.println("El numero 1 es "+ res.getNro1());
        System.out.println("El numero 2 es " + res.getNro2());
        
        System.out.println();

        //System.out.println("El resultado de suma es "+ res.getSumar());
        System.out.println(res.toString());
        System.out.println("El resultado de resta es " + res.getRestar());
        System.out.println("El resultado de multiplica es " + res.getMulti());
        System.out.println("El resultado de division es " + res.getDivison());
        
    }
}
