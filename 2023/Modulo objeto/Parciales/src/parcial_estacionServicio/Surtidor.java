package parcial_estacionServicio;

public class Surtidor {
    private String combustible;
    private double precio;
    private int dimL;
    private int dimF;
    private Venta [] infoVenta;

    public Surtidor(String combustible, double precio, int cantVenta) {
        this.combustible = combustible;
        this.precio = precio;
        this.dimL = 0;
        this.dimF = cantVenta;
        this.infoVenta = new Venta[cantVenta];
        for(int i=0; i<cantVenta; i++){
            this.infoVenta[i] = null;
        }
    }

    public int getDimF() {
        return dimF;
    }

    public void setDimF(int dimF) {
        this.dimF = dimF;
    }

    public String getCombustible() {
        return combustible;
    }

    public void setCombustible(String combustible) {
        this.combustible = combustible;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getDimL() {
        return dimL;
    }

    public void setDimL(int dimL) {
        this.dimL = dimL;
    }
    
    public boolean hayLugarEnVenta(){
        return dimL < dimF;
    }
    
    // 2.b
    public void agregarClienteVenta (Venta unCliente){
        if (hayLugarEnVenta()){
            this.infoVenta[dimL++] = unCliente;
        }
    }
    
    // 2.c
    public double getMayorMonto(){
        double ventaMax = -1;
        // por cada venta
        //Si la venta es mayor -> actualizar max
        for(int i=0; i<this.dimL; i++){
            if (this.infoVenta[i].getMedioPago().equals("Efectivo") && this.infoVenta[i].getMonto() > ventaMax){
                ventaMax = this.infoVenta[i].getMonto();
            }
        }
        return ventaMax;
    }
    
    public String toStringVenta (){
        String aux = "";
        for (int i=0; i<dimL; i++){
            aux += this.infoVenta[i].toString()+";";
        }
        return aux;
    }
    
    @Override
    public String toString(){
        return "Combustible dispensado: "+ combustible + ", precio por litro: "+ Math.round(precio) + "; Venta ["+ toStringVenta()+"]";
    }
}
