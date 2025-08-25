package tema5;

public class Estacionamiento {
    private String nombre;
    private String direccion;
    private double horaApe;
    private double horaCie;
    
    private int piso;
    private int plaza;
    
    private Auto [][] estacionamiento;
    
    // Constructores
    public Estacionamiento(){
    }
    
    public Estacionamiento(String nombre, String direccion) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.horaApe = 8.00;
        this.horaCie = 21.00;
        this.piso = 5;
        this.plaza = 10;
        
        this.estacionamiento = new Auto[5][10];
        
        // iniciar explicitamente la matriz con nulls 
    }

    public Estacionamiento(String nombre, String direccion, double horaApe, double horaCie, int piso, int plaza){
        this.nombre = nombre;
        this.direccion = direccion;
        this.horaApe = horaApe;
        this.horaCie = horaCie;
        this.piso = piso;
        this.plaza = plaza;
        // Matrices de estacionamiento
        //              V
        this.estacionamiento = new Auto[piso][plaza];        
                // iniciar explicitamente la matriz con nulls 
    }
    
    // Metodos        
    // Setters y getters
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public double getHoraApe() {
        return horaApe;
    }

    public void setHoraApe(double horaApe) {
        this.horaApe = horaApe;
    }

    public double getHoraCie() {
        return horaCie;
    }

    public void setHoraCie(double horaCie) {
        this.horaCie = horaCie;
    }

    public int getPiso() {
        return piso;
    }

    public void setPiso(int piso) {
        this.piso = piso;
    }

    public int getPlaza() {
        return plaza;
    }

    public void setPlaza(int plaza) {
        this.plaza = plaza;
    }
    
    public void setAuto (Auto auto, int pi, int pl){
        if (pi > 0 && pl > 0){
            this.estacionamiento[pi][pl] = auto;
        }
    }
                                                              
    /*public boolean HayLugarEnEstacionamiento(int x, int y, Auto auto){
        boolean ok = true;
        if ((estacionamiento[x][y] == null) ){
            estacionamiento [x][y] = auto;
        } else {
            ok = false;
        }
        return ok;
    }*/
    
    public String buscarPatenteEnEstacionamiento(String pat){
        boolean ok = false;
        int ubiF = 0; int ubiC = 0;
        for (int f = 0; f < piso; f++){
            for (int c =0; c < plaza; c++){
                if (!plazaLibre(f,c)){
                    if (estacionamiento[f][c].getPatente().equals(pat)){
                        ok = true;
                        ubiF = f;
                        ubiC = c;
                    }
                }
            }
        }
        if (!ok){
            return "Auto Inexistente"; 
        } else {
            return "El auto de la pantente: "+ pat + ", esta en el piso "+ (ubiF+1) +" y la plaza "+ (ubiC+1);
        }        
    }
 
    public boolean plazaLibre (int f, int c){
        return (null == this.estacionamiento[f][c]);
    }
    
    public int contadorPlaza(int num){
        int cant = 0;
        for (int i=0; i<piso; i++){
            if (estacionamiento[i][num] != null){
                cant ++;
            }
        }
        return cant;
    }
    
    @Override
    public String toString(){
        int f; int c;
        String aux = "";
        for (f=0; f < piso; f++){
            for(c=0; c < plaza; c++){
                if (estacionamiento[f][c] != null){
                    aux += "Piso "+ (f+1) +" Plaza "+ (c+1) +": "+ estacionamiento[f][c].toString()+"\n";
                } else{
                    aux += "Piso "+ (f+1) +" Plaza "+ (c+1) + ": Libre \n";
                }
            }
        }
        return aux;
    }
}
