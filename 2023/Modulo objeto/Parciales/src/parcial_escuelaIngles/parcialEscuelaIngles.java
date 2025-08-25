package parcial_escuelaIngles;
import PaqueteLectura.*;

public class parcialEscuelaIngles {
    /*
    Representar un curso dictado por una escuela de inglés. El curso tiene: una descripción, un turno online y un turno
    presencial. De cada turno se conoce: nombre y sueldo del docente, el costo de la cuota, y los alumnos inscriptos
    (como máximo N). De los alumnos se registra: DNI, nombre y lugar de residencia.
    1- Genere las clases necesarias. Provea constructores para iniciar los objetos a partir de la información necesaria.
       En particular, los turnos deben iniciarse con capacidad para guardar un máximo de N alumnos (y sin alumnos
       inicialmente). El curso debe iniciarse recibiendo una descripción y los dos turnos (sin alumnos).
    2- Implemente los métodos necesarios, en las clases que corresponda, para:
       a) Dado un alumno, agregarlo al curso. El alumno deberá agregarse al turno presencial si reside en "La Plata", 
          caso contrario deberá agregarse al turno online. Asuma que hay espacio.
       b) Obtener la ganancia mensual neta del curso, teniendo en cuenta que suma la recaudación de ambos turnos
          La recaudación de un turno es el costo de la cuota de los alumnos inscriptos y a eso se resta el sueldo del 
          docente.
       c) Obtener un String que represente el curso, siguiendo el ejemplo:
            "Descripción, Ganancia Mensual Neta del curso,
            Turno Online:{ Nombre del Docente; Alumno 1: {DNI, Nombre, Lugar} Alumno 2: {DNI, Nombre, Lugar ... }
            Turno Presencial: { Nombre del Docente; Alumno 1: {DNI, Nombre, Lugar} Alumno 2: {DNI, Nombre, Lugar ... }
       d) Determinar si el curso es rentable. Un curso es rentable si la ganancia mensual neta del curso supera 
          los $800000.
    3- Realice un programa que instancie un curso. Agregue algunos alumnos al curso. Imprima la representación String
       del curso y si es rentable o no.
    */
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        Turno TP = new Turno("Pablo",30000,8000,60);
        
        Turno TO = new Turno("Mariana",19000,6500,65);
        
        Curso curso = new Curso("Escuela 528",TO,TP);
        
        Alumno alu;
        String [] vectorNombre = {"Juana","Martin","Ana","Jorge","Agostina","Nicolas"};
        String [] vectorLugar = {"La Plata","Florencio Varela","Tigre","Azul"};
        for(int i=0;i<200; i++){
            alu = new Alumno(GeneradorAleatorio.generarInt(99999999-30000000)+30000000,vectorNombre[GeneradorAleatorio.generarInt(6)],vectorLugar[GeneradorAleatorio.generarInt(4)]);
            curso.agregarAlumnos(alu);
        }
        
        System.out.println(curso.toString());
        System.out.println("La ganancia mensual neta del curso supera los $800000: "+ curso.rentable());
    }
    
}
