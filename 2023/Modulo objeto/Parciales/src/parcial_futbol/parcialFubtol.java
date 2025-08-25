package parcial_futbol;

import PaqueteLectura.Lector;
public class parcialFubtol {
    /*
    Se quiere registrar la informacion de los goleadores para cada fecha del torneo de futbol 2024.
    El torneo tiene un nombre y una tabla que guarda para cada una de las N fechas(1..N) los goleadores
    de la fecha. Cada fecha tendrá como maximo M goleadores (0..M-1). Por esto, el torneo lleva otra
    estructura donde para cada fecha tiene la cantidad de goleadores registrados. De cada goleador 
    se conoce: nombre, nombre de su equipo y cantidad de goles que efectuo en esa fecha.

    1- Genere las clases necesarias. Provea constructores para crear: los goleadores a partir de la
       informacion necesaria; el torneo con un nombre, una cantidad N de fechas y una cantidad M de 
       goleadores por fecha (inicialmente cada fecha tiene 0 goleadores registrados).
    
    2- Implemente los metodos necesarios, en las clases que corresponda, para:
       a) Agrear un goleador a la fecha X del torneo, actualizando la cantidad de goleadores registrados 
          de esa fecha. Asuma que X esta en rango 1..N y que dicha fecha tiene lugar para un goleador mas.
       b) Obtener el goleador que efectuo menos goles en la fecha X. Asuma que X esta en rango 1..N.
       c) Obtener la cantidad de goleadores registrados en el torneo.
       d) Obtener un String que represente el torneo siguiendo el ejemplo:
            "Torneo 2024: nombre
            "Fecha # 1 | Cantidad de goleadores de la fecha | Goleadores (nombre, equipo, cantidad de goles.)"
            "Fecha # 2 | Cantidad de goleadores de la fecha | Goleadores (nombre, equipo, cantidad de goles.)"
            ...
            "Fecha # N | Cantidad de goleadores de la fecha | Goleadores (nombre, equipo, cantidad de goles.)"
    
    3- Realice un programa que instancie un torneo. Agregue goleadores en distintas fechas. Compruebe el
       correcto funcionamiento de los metodos implementados.
    */
    public static void main(String[] args) {
        //                      (Nombre del torneo, fecha, cantidad de jugadores)                      
        Torneo tor = new Torneo ("Copa mundial del clubes", 5, 10);        
        
        Goleador jug1 = new Goleador ("Messi", "Inter de Miami", 15);
        Goleador jug2 = new Goleador ("Cristano", "Al-Nassr", 10);
        Goleador jug3 = new Goleador ("Salah", "Liverpool", 11);
        Goleador jug4 = new Goleador ("Haaland", "Manchester City", 20);
        Goleador jug5 = new Goleador ("Mbappe", "PSG", 4);
        Goleador jug6 = new Goleador ("Sergio Ramos", "Sevilla", 3);
        Goleador jug7 = new Goleador ("Neymar", "Al-hilal", 5);
        Goleador jug8 = new Goleador ("De Blasis", "Gimnasia LP", 8);
        Goleador jug9 = new Goleador ("Cavani", "Boca jrs", 10);
        Goleador jug10 = new Goleador ("Kane", "Bayern Munich", 25);
        
        tor.agregarJugadores(1, jug1);
        tor.agregarJugadores(3, jug2);
        tor.agregarJugadores(2, jug6);
        tor.agregarJugadores(1, jug4);
        tor.agregarJugadores(4, jug3);
        tor.agregarJugadores(5, jug5);
        tor.agregarJugadores(2, jug7);
        tor.agregarJugadores(4, jug8);
        tor.agregarJugadores(3, jug9);
        tor.agregarJugadores(5, jug10);
        
        System.out.println(tor);
        System.out.println("-------------------------");
        System.out.println("> Ingrese el nro de fecha por menos goles:");
        int x = Lector.leerInt();
        System.out.println(tor.menosGolesPorFecha(x));
        System.out.println ("La cantidad de goleadores registrados: "+ tor.totalGoles());
    }
    
}
