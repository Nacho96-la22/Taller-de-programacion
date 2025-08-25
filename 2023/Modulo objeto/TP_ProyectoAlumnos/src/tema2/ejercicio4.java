/*4- Sobre un nuevo programa, modifique el ejercicio anterior para considerar que:
  A) Durante el proceso de inscripción se pida a cada persona sus datos (nombre, DNI, edad)
     y el día en que se quiere presentar al casting. La persona debe ser inscripta en ese día, 
     en el siguiente turno disponible. En caso de no existir un turno en ese día, informe la 
     situación.
     La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los 40 cupos
     de casting.
  
  Una vez finalizada la inscripción:
  B) Informar para cada día: la cantidad de inscriptos al casting ese día y el nombre de la
     persona a entrevistar en cada turno asignado. 
*/

package tema2;
import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;

public class ejercicio4 {
    public static void main (String [] args){
        GeneradorAleatorio.iniciar();
        int turno = 8;
        int dia = 5;
        int f, c;

        Persona [][] entrevistas = new Persona[dia][turno];

        //Informar A
        int cupos = 40;
        String nom; 
        int año, doc;
        int turnoActual;
        int SeleDia;
        boolean cargado;

        System.out.println ("-------------> INSCRIPCION DE ENTREVISTAS <--------------");
        System.out.println ("Ingrese el nombre:");
        //nom = GeneradorAleatorio.generarString(3);
        nom = Lector.leerString();                                        
        while (0 < cupos && !nom.equals("ZZZ")){                                // Corte del control que finaliza "ZZZ" o llena los 40 cupos                                                       
            if (!nom.equals("ZZZ")){                                            // Finaliza "ZZZ" para no hace falta de escribir los datos                  
                doc = GeneradorAleatorio.generarInt(10000000)+30000000;                              
                año = GeneradorAleatorio.generarInt(99);                 
                SeleDia = GeneradorAleatorio.generarInt(5);                                      
                                                                                         
                cargado = false;                                                         
                turnoActual = 0;                                                         
                while (!cargado && turnoActual<turno){                                   // Pregunta que si hay cupos y turnos?                   
                    if (entrevistas[SeleDia][turnoActual] == null){                      // Pregunta que si el dia y turno esta disponible?
                        entrevistas[SeleDia][turnoActual] = new Persona (nom, doc, año); // Guarda el datos del turno y dia en martices
                        cupos--;
                        cargado = true;
                    }
                    turnoActual++;                                                       // Siguiente el turno ese dia
                }
                System.out.println ();  
                if (cargado){                                                            // Informa para asignar cuando esté disponible 
                    System.out.println ("> Turno asignado, dia: "+ (SeleDia+1) +" turno: "+turnoActual);
                } else {
                    System.out.println ("> No hay turnos disponible ese dia.");
                }
                
                System.out.println ("---------------------------------------------------------");
                System.out.println ("Ingrese el nombre:");
                nom = Lector.leerString();
                //nom = GeneradorAleatorio.generarString(3);
                                                                     
            }                                                           
        }
        System.out.println ("---------------------------------------------------------");
        System.out.println ("---------------------> INFORMACION <---------------------");

        // Informar B
        int cant;
        for (f=0; f<dia; f++){
            System.out.println ("> "+ (f+1) + " dias: ");
            cant = 0;
            for (c=0; c<turno; c++){
                if (entrevistas[f][c] != null){
                    System.out.println ("- "+(c+1)+ " T: "+entrevistas[f][c].getNombre()+" ");
                    cant++;
                }
            }
            if (cant != 0){
                System.out.println ("Total de inscripcion: "+ cant);
            } else{
                System.out.println("No hay informacion de inscripcion.");
            }
            System.out.println();
        }
        
    }
}