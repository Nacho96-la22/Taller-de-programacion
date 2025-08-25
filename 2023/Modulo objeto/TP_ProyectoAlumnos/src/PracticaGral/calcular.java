package PracticaGral;

public class calcular {
    private int nro1;
    int nro2;

    /* CONSTRUCION */
    public calcular() {
    }

    public calcular(int nro1, int nro2) {
        this.nro1 = nro1;
        this.nro2 = nro2;
    }

    /* GETTERS Y SETTERS */
    public int getNro1() {
        return nro1;
    }

    public int getNro2() {
        return nro2;
    }

    public void setNro1(int nro1) {
        this.nro1 = nro1;
    }

    public void setNro2(int nro2) {
        this.nro2 = nro2;
    }
    
    /* GETTERS Y SETTERS TAMBIEN PERO SE CALCULA */
    public int getSumar(){
        return (nro1 + nro2);
    }

    public int getRestar(){
        return (nro1 - nro2);
    }

    public int getMulti(){
        return (nro1 * nro2);
    }

    public int getDivison(){
        return (nro1 / nro2);
    }

    public String toString(){
        return ("El resultado de suma es "+ this.getSumar());
    }
}