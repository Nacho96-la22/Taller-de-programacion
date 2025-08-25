package parcial_sandwichTPcorregido;
import PaqueteLectura.GeneradorAleatorio;

public class parcialSandwich {
    /*
    Representar un Sandwich. El Sandwich tiene un nombre, un Pan y a lo sumo N Ingredientes. El Pan
    tiene un nombre, un costo y una calidad (Premium o normal). Los Ingredientes tienen un nombre, un
    costo y un grupo (A o B).
    
    a) Genere las clases necesarias, Provea constructores para iniciar: un Pan e Ingrediente a partir de
       la información necesaria; al Sandwich a partir de un nombre, un Pan y capacidad para un máximo de 
       N Ingredientes (inicialmente sin Ingredientes).
    b) Implemente los métodos necesarios, en las clases que corresponda, para:
       1. Agregar un Ingrediente al Sandwich.
       2. Retomar el costo final de un Componente (Pan o Ingrediente), teniendo en cuenta que el costo del
          Pan si es Premium tiene un incremento del 20% y en los Ingredientes si son del grupo B se
          incrementen un 10%.
       3. Retomar una representación String de los Componentes de la siguiente forma:
          Un Pan: "Nombre - Costo - Calidad"
          Un Ingrediente: "Nombre- Costo- Grupo"
       4. Retomar un String que represente al Sándwich, que contenga: Nombre, representación del Pan,
          Cantidad de ingredientes, representación de los Ingredientes y costo final del Sándwich (suma del
          costo final del Pan más el costo final de todos sus Ingredientes).
    c) Realice un programa que instancie un Sándwich con un Pan y cargue Ingredientes. Luego, imprima la
       representación del Sándwich.
    */
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        String [] calidad = {"Premium","Comun"};
        Pan pan = new Pan(calidad[GeneradorAleatorio.generarInt(2)],"Sacremento",1000);
        
        Sandwich san = new Sandwich("Sandwich primavera",pan,3);
        
        Ingrediente ingre;
        String [] grupo = {"A","B"};
        String [] sabor = {"Jamon","Queso","Lechuga","Tomante"};
        for (int i = 0; i < 3; i++) {
            ingre = new Ingrediente(grupo[GeneradorAleatorio.generarInt(2)],sabor[GeneradorAleatorio.generarInt(2)],100);
            san.agregarIngrediente(ingre);
        }
        
        System.out.println(san);
    }
    
}
