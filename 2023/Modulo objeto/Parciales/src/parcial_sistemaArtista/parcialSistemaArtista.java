package parcial_sistemaArtista;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class parcialSistemaArtista {
    /*Se desea representar un sistema que registre conciertos para un estadio. Del estadio se conoce nombre,
      direccion, capacidad y una estrcutra que representa la agenda de conciertos que almacenará los conciertos
      de cada mes y dia particular (1..12, 1..31). De cada concierto se guarda el nombre del artista, precio de
      la entrada, cantidad de entradas vendidas.
      1- Genere las clases necesarias. Provea constructores para iniciar: los conciertos y el estadio a partir
         de la informacion necesaria; Inicialmente el estadio no tiene conciertos agendados.
      2- Implemente los metodos necesarios, en las clases que corresponda, para:
         a) Registrar un concierto C en la agenda. El metodo recibe un mes M y debe registrar el concierto en el
            siguiente dia disposible del mes M.
         b) Listar los conciertos del mes M devolviendo un String con la representacion de los mismos en el 
            siguiente formato:
                "Nombre del artista, precio de la entrada, cantidad de entradas vendidas"
         c) Calcular la ganancia del estadio en el mes M. La ganancia de un mes es la mitad de recaudacion de 
            las entradas vendidas en cada concierto de dicho mes.
         d) Obtener un String que represente el estadio siguiendo el ejemplo:
                "Estadio: nombre, direccion; capacidad.
                Mes 1:
                  Dia 1: Nombre del artista, precio de la entrada, cantidad de entradas vendidas.
                  Dia 2: Nombre del artista, precio de la entrada, cantidad de entradas vendidas.
                  ...
                Mes M;
                  ...
      3- Realice un programa que instancie un estadio. Registre conciertos y compruebe el correcto
         funcionamiento de los metodos implementados.*/
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Concierto con1,con2,con3,con4;
        con1 = new Concierto ("Maria Beccera",11000,18400);
        con2 = new Concierto ("Tini",9500,15000);
        con3 = new Concierto ("Daddy Yankee",12000,18000);
        con4 = new Concierto ("Duki",8400,19200);

        Estadio est = new Estadio ("Unico de La Plata","calle 32 y 25",53000);

        for (int i=0; i<5; i++){            
            est.registrarConcierto(GeneradorAleatorio.generarInt(12)+1, con1);
            est.registrarConcierto(GeneradorAleatorio.generarInt(12)+1, con2);
            est.registrarConcierto(GeneradorAleatorio.generarInt(12)+1, con3);
            est.registrarConcierto(GeneradorAleatorio.generarInt(12)+1, con4);
        }
        
        System.out.println(est.retornarConciertoMes(2));
        System.out.println(est.CalcularGanancias(2));
        System.out.println();
        System.out.println(est);
    }
    
}
