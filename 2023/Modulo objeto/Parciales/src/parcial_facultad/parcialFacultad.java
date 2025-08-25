package parcial_facultad;
import PaqueteLectura.GeneradorAleatorio;

public class parcialFacultad {
    /*
    Representar alumnos de una facultad. De cualquier alumno se conoce: DNI, nombre y sus materias aprobadas (como
    máximo N). De las materias aprobadas se registra: nombre, nota y fecha. Además de los alumnos de grado se tiene la
    carrera, mientras que de los alumnos de doctorado el título universitario y universidad de origen.

    1- Genere las clases necesarias. Provea constructores para iniciar las materias aprobadas y los alumnos a partir de la
       información necesaria (estos para un máximo de N materias aprobadas y sin materias aprobadas inicialmente).
    2- Implemente los métodos necesarios, en las clases que corresponda, para:
       a) Dada una materia aprobada, agregarla a las materias aprobadas del alumno.
       b) Determinar si el alumno está graduado, teniendo en cuenta que para ello deben tener un total de N materias
          aprobadas y deben tener aprobada la materia "Tesis".

       c) Obtener un String que represente al alumno siguiendo el ejemplo:
          Ej. alumnos de grado "DNI; Nombre; Materias aprobadas: nombre, nota y fecha de c/u; Está graduado: ...; Carrera"
          Ej. alumnos de doctorado "DNI; Nombre; Materias aprobadas: nombre, nota y fecha de c/u; Está graduado: ...; Título;
              Universidad de Origen"

    3- Realice un programa que instancie un alumno de cada tipo. Cargue información de materias aprobadas a cada
       uno. Informe en consola el resultado del inciso c).
    */
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Grado aluGrado = new Grado ("Analista Programador Universitario",39777111,"Matias",5);
        MateriaAprobada m1,m2;
        
        Doctorado aluDoctorado = new Doctorado("Licenciatura en Informatica","UNLP",40888333,"Julieta",5);
        
        for(int i=0; i<4; i++){
            m1 = new MateriaAprobada(GeneradorAleatorio.generarString(5),GeneradorAleatorio.generarDouble(10-4)+4,GeneradorAleatorio.generarInt(31)+1,GeneradorAleatorio.generarInt(12)+1,GeneradorAleatorio.generarInt(2024-2015)+2015);
            aluGrado.agregarMaterias(m1);        
            m2 = new MateriaAprobada(GeneradorAleatorio.generarString(5),GeneradorAleatorio.generarDouble(10-4)+4,GeneradorAleatorio.generarInt(31)+1,GeneradorAleatorio.generarInt(12)+1,GeneradorAleatorio.generarInt(2024-2015)+2015);
            aluDoctorado.agregarMaterias(m2);
        }
        m1 = new MateriaAprobada("Tesis",GeneradorAleatorio.generarDouble(10-4)+4,GeneradorAleatorio.generarInt(31)+1,GeneradorAleatorio.generarInt(12)+1,GeneradorAleatorio.generarInt(2024-2015)+2015);
        aluGrado.agregarMaterias(m1);            
        m2 = new MateriaAprobada(GeneradorAleatorio.generarString(5),GeneradorAleatorio.generarDouble(10-4)+4,GeneradorAleatorio.generarInt(31)+1,GeneradorAleatorio.generarInt(12)+1,GeneradorAleatorio.generarInt(2024-2015)+2015);
        aluDoctorado.agregarMaterias(m2);
        
        System.out.println(aluGrado);
        System.out.println();
        System.out.println(aluDoctorado);
    }
    
}
