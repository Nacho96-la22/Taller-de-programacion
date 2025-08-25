package tema5;

public class Auto {
    private String nomDuenio;
    private String patente;

    public Auto(String nomDuenio, String patente) {
        this.nomDuenio = nomDuenio;
        this.patente = patente;
    }

    public String getNomDuenio() {
        return nomDuenio;
    }

    public void setNomDuenio(String nomDuenio) {
        this.nomDuenio = nomDuenio;
    }

    public String getPatente() {
        return patente;
    }

    public void setPatente(String patente) {
        this.patente = patente;
    }
    
    public String toString(){
        return "El nombre del dueño: "+ nomDuenio+" y patente: "+ patente;
    }
}
