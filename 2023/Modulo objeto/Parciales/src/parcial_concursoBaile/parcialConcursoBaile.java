package parcial_concursoBaile;
import PaqueteLectura.*;

public class parcialConcursoBaile {

    public static void main(String[] args) {
        Concurso con = new Concurso(2);
        
        Participante Hombre1 = new Participante(39881773,"Javier",29);
        Participante Mujer1 = new Participante(41901617,"Maria",26);
        Pareja pareja1 = new Pareja (Hombre1,Mujer1,"Cumbia");
        
        Participante Hombre2 = new Participante(35641772,"Jose",31);
        Participante Mujer2 = new Participante(32761441,"Ariana",36);
        Pareja pareja2 = new Pareja (Hombre2,Mujer2,"Tango");
        
        con.agregarPareja(pareja1);
        con.agregarPareja(pareja2);
        
        System.out.println(con.mayorDiferencia());
    }
    
}
