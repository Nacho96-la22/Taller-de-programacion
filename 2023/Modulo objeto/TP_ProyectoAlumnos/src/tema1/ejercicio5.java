/* 5- El dueño de un restaurante entrevista a cinco clientes y les pide que califiquen 
      (con puntaje de 1 a 10) los siguientes aspectos: (0) Atención al cliente (1) Calidad 
      de la comida (2) Precio (3) Ambiente.
      Escriba un programa que lea desde teclado las calificaciones de los cinco clientes 
      para cada uno de los aspectos y almacene la información en una estructura. Luego 
      imprima la calificación promedio obtenida por cada aspecto. */


package tema1;
import PaqueteLectura.Lector;
public class ejercicio5 {
    public static void main(String[] args){
        double [][] clasificacion = new double[5][4];
        int f, c;
        System.out.println("-------------> ENTREVISTA DE LOS CLIENTES <-------------");
        for (f=0; f<5; f++){
            System.out.println((f+1) + " cliente:");
            System.out.print("Atencion al cliente: ");
            clasificacion[f][0]= Lector.leerDouble();
            System.out.print("Calidad de la comida: ");
            clasificacion[f][1]= Lector.leerDouble();
            System.out.print("Precio: ");
            clasificacion[f][2]= Lector.leerDouble();
            System.out.print("Ambiente: ");
            clasificacion[f][3]= Lector.leerDouble();
            System.out.println();    
        }
        System.out.println("--------------------------------------------------------");
        System.out.println("---------------------> PROMEDIOS <----------------------");
        double promedio;
        promedio = 0;
        for (f=0; f<5; f++){
                for(c=0; c<4; c++){
                    promedio= clasificacion[f][0]+clasificacion[f][1]+clasificacion[f][2]+clasificacion[f][3]/4;
                }
                System.out.println ("El promedio de "+ f +" cliente es "+ (double)promedio);
            }    
    }
}