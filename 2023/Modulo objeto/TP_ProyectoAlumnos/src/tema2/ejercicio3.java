/* 4- Se realizará un casting para un programa de TV. El casting durará a lo sumo 5 días y en
      cada día se entrevistarán a 8 personas en distinto turno.

      a) Simular el proceso de inscripción de personas al casting. A cada persona se le pide
         nombre, DNI y edad y se la debe asignar en un día y turno de la siguiente manera: las
         personas primero completan el primer día en turnos sucesivos, luego el segundo día y así
         siguiendo. La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los
         40 cupos de casting.

    Una vez finalizada la inscripción:
      b) Informar para cada día y turno el nombre de la persona a entrevistar.
    NOTA: utilizar la clase Persona y pensar en la estructura de datos a utilizar 
 */

package tema2;
import PaqueteLectura.GeneradorAleatorio;
//import PaqueteLectura.Lector;
public class ejercicio3 {
    public static void main (String [] args){
        int turno = 8;
        int dia = 5;
        int f, c;

        Persona [][] entrevistas = new Persona[dia][turno];
        
        GeneradorAleatorio.iniciar();
        //Informar A
        String nom; 
        int año, doc, diaActual, turnoActual;

        nom = GeneradorAleatorio.generarString(15);
        diaActual = 0;                                                                          // Ingresa por el dia 
        while (diaActual < dia && !nom.equals("ZZZ")){                 // Corte del control que finaliza "ZZZ" o llena los 40 cupos
            turnoActual = 0;                                                                 // Ingresa por el turno 
            while (!nom.equals("ZZZ") && turnoActual < turno){     // Corte del control que finaliza "ZZZ" o llena los 8 turnos 
                año = GeneradorAleatorio.generarInt(80);
                doc = GeneradorAleatorio.generarInt(10000000) + 30000000;
                entrevistas[diaActual][turnoActual] = new Persona (nom, doc, año); // Guarda el datos del turno y dia en martices
                nom = GeneradorAleatorio.generarString(15);
                turnoActual++;                                                     // Siguiente el turno
            }
            diaActual++;                                                           // Siguiente el dia 
        }

        // Informar B
        for (f=0; f<dia; f++){
            System.out.println ("> "+ (f+1) + " dias: ");
            for (c=0; c<turno; c++){
                System.out.println ("- "+ (c+1) + " T: "+entrevistas[f][c]+" ");
            }
            System.out.println ();
        }
    }
}
