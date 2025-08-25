/* 2- Utilizando la clase Persona. Realice un programa que almacene en un vector a lo sumo
      15 personas. La información (nombre, DNI, edad) se debe generar aleatoriamente hasta
      obtener edad 0. Luego de almacenar la información:
      - Informe la cantidad de personas mayores de 65 años.
      - Muestre la representación de la persona con menor DNI. 
*/

package tema2;
import PaqueteLectura.GeneradorAleatorio;

public class ejercicio2 {
    public static void main (String[] args){
        GeneradorAleatorio.iniciar();
        int dimF = 15;

        Persona [] vector = new Persona[dimF];
        
        int i=0, año, doc;
        String nom;
        año = GeneradorAleatorio.generarInt(100);
        while (año != 0 && dimF > i) {
            nom = GeneradorAleatorio.generarString(10);
            doc = GeneradorAleatorio.generarInt(10000000)+30000000;
            Persona per = new Persona(nom, doc, año);
            vector[i]= per;
            i= i + 1;
            año = GeneradorAleatorio.generarInt(100);
        };
        int minDNI = 9999999;
        int cantViejo=0, posMin=0;
        for (i=0; dimF > i; i++){
            if (vector[i].getEdad() > 65){
                cantViejo++;
            }
            if (vector[i].getDNI() < minDNI){
                minDNI = vector[i].getDNI();
                posMin = i; 
            }
        }
        System.out.println ("Informa hay "+ cantViejo + " cantidad de personas mayores de 65 edad.");
        System.out.println(vector[posMin].toString() +" representa que tiene con menor DNI.");
    }
}













