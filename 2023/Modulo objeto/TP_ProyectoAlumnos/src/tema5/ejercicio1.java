package tema5;
import PaqueteLectura.GeneradorAleatorio;

public class ejercicio1 {
    public static void main (String[] args) {
        GeneradorAleatorio.iniciar();
        
        Proyecto pro;
        Investigador inves1, inves2, inves3;
        Subsidio sub1, sub2;
        
        pro = new Proyecto(GeneradorAleatorio.generarString(5), GeneradorAleatorio.generarInt(10)+1, GeneradorAleatorio.generarString(5));
        
        inves1 = new Investigador("Martin", GeneradorAleatorio.generarInt(5)+1, GeneradorAleatorio.generarString(5));
        inves2 = new Investigador("Juan Pablo", GeneradorAleatorio.generarInt(5)+1, GeneradorAleatorio.generarString(5));        
        inves3 = new Investigador("Daniela", GeneradorAleatorio.generarInt(5)+1, GeneradorAleatorio.generarString(5));
        
        pro.agregarInvestigador(inves1);
        pro.agregarInvestigador(inves2);
        pro.agregarInvestigador(inves3);
        
        int i;
        for (i=0; i<3;i++){
            sub1 = new Subsidio (GeneradorAleatorio.generarDouble(100)+200,GeneradorAleatorio.generarString(5));
            sub2 = new Subsidio (GeneradorAleatorio.generarDouble(100)+200,GeneradorAleatorio.generarString(5));
            pro.getVecI()[i].agregarSubsidio(sub1);
            pro.getVecI()[i].agregarSubsidio(sub2);
        }
        
        System.out.println(pro.getVecI()[0].getCantSub());
        
        pro.otorgarTodos("Juan Pablo");
        System.out.println(pro.toString());
    }
    
}
