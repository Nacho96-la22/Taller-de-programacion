package parcial_banco;

public abstract class Banco {
    private String nombre;
    private int cantEmpleados;
    private int dimF;
    private int dimL = 0;
    private Cuenta [] cue;    

    public Banco(String nombre, int cantEmpleados, int N) {
        this.nombre = nombre;
        this.cantEmpleados = cantEmpleados;
        this.dimF = N;
        this.cue = new Cuenta[dimF];
        for(int i=0; i<dimF; i++){
            this.cue[i] = null;
        }
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCantEmpleados() {
        return cantEmpleados;
    }

    public void setCantEmpleados(int cantEmpleados) {
        this.cantEmpleados = cantEmpleados;
    }

    public Cuenta[] getCue() {
        return cue;
    }

    public void setCue(Cuenta[] cue) {
        this.cue = cue;
    }    
    
    public boolean hayEspacio(){
        return dimL < dimF;
    }
    
    public int busqueda (int cbu){
        int i=0;
        while (i < dimF && cbu != this.cue[i].getCBU()){
            i++;
        }
        return i;
    }
    
    // 2.a
    public boolean agregarCuenta (Cuenta c){
        boolean ok = false;
        if (hayEspacio()) {
            this.cue[dimL++] = c;
            ok = true;
        }
        return ok;
    }
    
    // 2.b
    public Cuenta obtenerCBU (int cbu){
        Cuenta aux = null;
        int i = busqueda(cbu);
        if (i != dimL){
            aux = this.cue[i];
        }
        return aux;
    }
    
    // 2.c
    public void depositarDinero (int cbu, double monto){
        int i = busqueda(cbu);
        if (i != dimL){
            this.cue[i].depositar(monto);
        }
    }
    
    // 2.d
    public abstract boolean puedeRecibirTarjeta(int cbu);
}
