package tema4;
// Punto - 3.A
public class Trabajador extends Persona{
    private String trabajo;

    public Trabajador (String unNombre, int unDNI, int unaEdad, String trabajo){
        super(unNombre, unDNI, unaEdad);
        this.trabajo = trabajo;
    }

    public String getTrabajo() {
        return trabajo;
    }

    public void setTrabajo(String trabajo) {
        this.trabajo = trabajo;
    }

    public String toString(){
        return super.toString() +" Soy "+ trabajo+".";
    }
}
