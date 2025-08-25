package parcial_informatica;

public class parcialInformatica {
    /*
    Se desea representar una empresa de informática y sus programadores. La empresa tiene: nombre, un programador
    líder y a lo sumo N programadores. De los programadores se conoce: nombre, DNI, sueldo básico, cantidad de líneas 
    de código por hora y lenguaje de preferencia. Adicionalmente, del programador líder se conoce: antigüedad en años y
    cantidad de proyectos dirigidos.
    1- Genere las clases necesarias. Provea constructores para iniciar: el programador líder y programadores a partir de 
    toda su información; la empresa a partir de un nombre, un programador líder, con capacidad para un máximo de N
    programadores (inicialmente sin programadores).
    2- Implemente los métodos necesarios, en las clases que corresponda, para:
       a) Dado un programador, agregarlo a la empresa.
       b) Calcular el monto total en sueldos a abonar por la empresa, sabiendo que es la suma de los sueldos finales de
          todos los programadores de la empresa (incluido el líder). Para cualquier programador, el sueldo final es el sueldo
          básico adicionando 50.000$ si supera las 200 líneas de código por hora. Además de eso, para el programador líder, se
          adiciona $10.000 por año de antigüedad y $20.000 por proyecto dirigido.
       c) Dado un monto M, aumentar el sueldo básico de todos los programadores en M (incluido el líder).
       d) Retornar la representación String de la empresa, siguiendo el ejemplo:
            "Empresa: nombre.
            Programador líder: {nombre, DNI, lenguaje de preferencia, sueldo final}
            Programador 1: {nombre, DNI, lenguaje de preferencia, sueldo final}
            Programador 2: {nombre, DNI, lenguaje de preferencia, sueldo final}
            ...
            Monto total en sueldos a abonar por la empresa: ... "
    3- Realice un programa que instancie una empresa informática con un lder. Agregue algunos programadores a la
       empresa. Aumente los sueldos básicos de todos los programadores de la empresa en un monto. Muestre la
       representación String de la empresa.
    */
    public static void main(String[] args) {
        ProgramadorLider proLider = new ProgramadorLider(3,5,"Juan Pablo",39888222,34000,400,"Python");
        Empresa emp = new Empresa ("Orale",proLider,3);
        
        Programador pro1,pro2,pro3;
        pro1 = new Programador("Maria",38612833,10400,120,"Java");
        pro2 = new Programador("Xione",42727111,12000,220,"C++");
        pro3 = new Programador("Leonel",37616727,13000,135,"Javascript");
        
        emp.agregarProgramador(pro1);
        emp.agregarProgramador(pro2);
        emp.agregarProgramador(pro3);
        emp.aumentoMonto(5000);
        
        System.out.println(emp);
    }
    
}
