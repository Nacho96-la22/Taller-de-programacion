package parcial_curso;
import PaqueteLectura.*;

public class parcialCurso {
    /*
    Representar un curso con alumnos. Un curso tiene año de cursada, y guarda la información de sus alumnos (como
    maximo N alumnos). De cada alumno se conoce: DNI, nombre, asistencias y cantidad de autoevaluaciones aprobadas.
    Un curso puede ser a ditancia o presencial. Los cursos a distancia llevan el link a la sala virtual y los cursos
    presenciales llevan el numero de aula.

    1- Genere las clases necesarias. Provea constructores para iniciar los cursos con un año de cursada, un máximo de
       alumnos N los cursos se crean sin alumnos inscriptos. Un alumno se crea con O asistencia y O autoevaluaciones
       aprobadas.
    2- Implemente los métodos necesarios, en las clases que corresponda, para:
       a) agregarAlumno: Agregar un alumno a un curso. El método debe retornar true si pudo agregar al alumno y false en
          caso contrario.
       b) incrementarAsistencio: Dado un DNI, incrementar la asistencia del alumno con dicho DNI.
       c) aprobarAutoevaluación: Dado un DNI, incrementar la cantidad de autoevaluaciones aprobadas del alumno con dicho
          DNI.
       d) puedeRendir: Recibe un alumno y retorna si puede rendir o no.
               · Si el curso es a distancia, pueden rendir el examen los alumnos que cumplen con tener 3
                 autoevaluaciones y al menos una asistencia.
               · Si el curso es presencial, pueden rendir el examen los alumnos que tienen al menos 3 asistencias.
       e) cantidadDeAlumnosQuePuedenRendir: Retorna la cantidad de alumnos en condiciones de rendir.
    3- Realice un programa que instancie un curso presencial y un curso a distancia. Agregue alumnos a cada curso.
       Incremente la asistencia y autoevaluaciones de los alumnos. Imprima la cantidad de alumnos en condiciones de rendir
       en cada curso.
    */
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Presencial pres = new Presencial(1,2022,3);
        
        Alumno alu1,alu2,alu3;
        alu1 = new Alumno(38777111,"Dario");
        alu2 = new Alumno(35921092,"Ana");
        alu3 = new Alumno(40731773,"Martin");
        int [] vectorDNI = {38777111,35921092,40731773};
        
        pres.agregarAlumno(alu1);
        pres.agregarAlumno(alu2);
        pres.agregarAlumno(alu3);
        
        for (int i=0; i<10; i++){
            pres.incrementarAsistencia(vectorDNI[GeneradorAleatorio.generarInt(3)]);
            pres.aprobarAutoevalucion(vectorDNI[GeneradorAleatorio.generarInt(3)]);
        }
        
        System.out.println(pres);
        System.out.println();
        
        Virtual vir = new Virtual("zoom.com/uqdwb",2023,3);
        
        Alumno aluv1,aluv2,aluv3;
        aluv1 = new Alumno(32009747,"Juana");
        aluv2 = new Alumno(41712532,"Lorenzo");
        aluv3 = new Alumno(39900822,"Zoe");
        int [] vectorVDNI = {32009747,41712532,39900822};
        
        vir.agregarAlumno(aluv3);
        vir.agregarAlumno(aluv2);
        vir.agregarAlumno(aluv1);
        
        for (int i=0; i<10; i++){
            vir.incrementarAsistencia(vectorVDNI[GeneradorAleatorio.generarInt(3)]);
            vir.aprobarAutoevalucion(vectorVDNI[GeneradorAleatorio.generarInt(3)]);
        }
        
        System.out.println(vir);

    }
    
}
