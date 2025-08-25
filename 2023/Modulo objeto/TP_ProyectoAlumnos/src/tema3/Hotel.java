package tema3;

//import PaqueteLectura.GeneradorAleatorio;
public class Hotel {
    private int dimF;
    private Habitacion [] Habitacion;

    // Construcion

    public Hotel (int dimF){
        this.dimF = dimF;
        Habitacion = new Habitacion[dimF];
        for (int i = 0; dimF > i; i++) {
            this.Habitacion[i] = new Habitacion();
        }
    }

    public Hotel() {
    }

    // Setters y getters
    // La cantidad de cliente en habitacion

    public boolean verificarHabitacion(int num){
        return this.Habitacion[num-1].isEstado();
    }

    public void cargarCliente (Cliente cli, int num) {
        this.Habitacion[num-1].setCli(cli);
    }

    public void setAumento(double valor) {
        for (int i = 0; i < dimF; i++) {
           this.Habitacion[i].aumentarCosto(valor); 
        }
    }

    public String toString () {
        String aux = "";
        for (int i = 0; i < dimF; i++) { // lo mismo que arriba, mejor delegar/pedir al otro objeto que haga la operacion
          aux += "Habitacion "+ (i+1) + ": "+  this.Habitacion[i].toString() +"\n";
        }
        return aux;
    }
}
