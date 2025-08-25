package parcial_estacionServicio;
import PaqueteLectura.GeneradorAleatorio;

public class parcial_estacionServicio {
    /* 
    Una estacion de servicio quiere administrar la informacion correspondiente a la carga de combustible. La estacion posee
    una direccion y la informacion de los surtidores (a lo sumo 6). De cada surtidor se conoce el combustible que dispensa,
    el precio por litro y la informacion de las ventas (como maximo V). De cada venta se registra: DNI del cliente, cantidad
    de litros cargados, monto abonado y el medio de pago utilizado (debito, credito o efectivo).
    
    1- Genere las clases necesarias. Provea constructores para crear: la estacion con la direccion y con capacidad para 6 
       surtidores (inicialmente sin surtidores); cada surtidor con el combustible que dispensa (String), precio por litros y
       con capacidad para V ventas (inicialmente sin ventas); y cada venta a partir de la informacion necesaria.
    
    2- Implemente los metodos necesarios, en las clases que corresponda, para:
       a) Dado un surtidor, agregarlo a los surtidores de la estación.
       b) Dado un número N de surtidor, el DNI de un cliente, una cantidad de litros y una forma de pago, generar la
          venta correspondiente y agregarla en dicho surtidor de la estación. Asumir que el número N de surtidor es
          válido.
       c) Obtener el número del surtidor que recaudó el mayor monto total en efectivo (entre todas sus ventas).
       d) Obtener un String que represente la estación siguiendo el ejemplo:

        "Estación de Servicio: Dirección; Cantidad de surtidores.

         Surtidor 1; Combustible dispensado, precio por litro; Ventas: [DNI del cliente, cantidad de litros cargados, monto abonado; ... ]
         Surtidor 2; Combustible dispensado, precio por litro; Ventas: [DNI del cliente, cantidad de litros cargados, monto abonado; ... ]
        ..."
    3- Realice un programa que instancie una estación. Agregue surtidores. Realice ventas. Compruebe el correcto
       funcionamiento de los métodos implementados.
    */
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Estacion est = new Estacion("calle 60 y 31");
        
        Surtidor sur1, sur2, sur3;
        sur1 = new Surtidor(GeneradorAleatorio.generarString(5),GeneradorAleatorio.generarDouble(100 - 50)+50,GeneradorAleatorio.generarInt(5)+1);
        sur2 = new Surtidor(GeneradorAleatorio.generarString(5),GeneradorAleatorio.generarDouble(100 - 50)+50,GeneradorAleatorio.generarInt(5)+1);
        sur3 = new Surtidor(GeneradorAleatorio.generarString(5),GeneradorAleatorio.generarDouble(100 - 50)+50,GeneradorAleatorio.generarInt(5)+1);

        est.agregarSurtidor(sur1);
        est.agregarSurtidor(sur2);
        est.agregarSurtidor(sur3);
        
        Venta ven1, ven2,ven3;
        ven1 = new Venta(GeneradorAleatorio.generarInt(10)+1,GeneradorAleatorio.generarInt(5)+1,GeneradorAleatorio.generarDouble(100 - 50)+50,"Debito");
        ven2 = new Venta(GeneradorAleatorio.generarInt(10)+1,GeneradorAleatorio.generarInt(5)+1,GeneradorAleatorio.generarDouble(100 - 50)+50,"Efectivo");
        ven3 = new Venta(GeneradorAleatorio.generarInt(10)+1,GeneradorAleatorio.generarInt(5)+1,GeneradorAleatorio.generarDouble(100 - 50)+50,"Efectivo");
        
        est.agregarClientePago(1, ven1);
        est.agregarClientePago(2, ven3);
        est.agregarClientePago(3, ven2);
        
        System.out.println(est.mayorMontoRecaudarSurtidor());
        System.out.println();
        System.out.println(est.toString());
    }
    
}
