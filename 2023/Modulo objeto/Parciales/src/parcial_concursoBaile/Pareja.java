package parcial_concursoBaile;

public class Pareja {
    private Participante pareja1;
    private Participante pareja2;
    private String estilo;

    public Pareja(Participante par1, Participante par2, String estilo) {
        this.estilo = estilo;
        this.pareja1 = par1;
        this.pareja2 = par2;
    }

    public Participante getPareja1() {
        return pareja1;
    }

    public void setPareja1(Participante pareja1) {
        this.pareja1 = pareja1;
    }

    public Participante getPareja2() {
        return pareja2;
    }

    public void setPareja2(Participante pareja2) {
        this.pareja2 = pareja2;
    }


    public String getEstilo() {
        return estilo;
    }

    public void setEstilo(String estilo) {
        this.estilo = estilo;
    }
    
    public int diferenciaEdad(){
        if (this.pareja1.getEdad() > this.pareja2.getEdad()){
            return this.pareja1.getEdad() - this.pareja2.getEdad();
        } else
            return this.pareja2.getEdad() - this.pareja1.getEdad();
    }
    
    public String toString(){
        return "> Pareja:\n"+
                pareja1+"\n"
                +pareja2;
    }
}
