package parcial_facultad;

public class MateriaAprobada {
    private String nombre;
    private double nota;
    private int dia;
    private int mes;
    private int año;

    public MateriaAprobada(String nombre, double nota, int dia, int mes, int año) {
        this.nombre = nombre;
        this.nota = nota;
        this.dia = dia;
        this.mes = mes;
        this.año = año;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getNota() {
        return nota;
    }

    public void setNota(double nota) {
        this.nota = nota;
    }
    
    public String toString(){
        return "nombre: "+ nombre +", nota: "+ Math.round(nota) +" y fecha de "+ dia+"/"+mes+"/"+año+";";
    }
}
