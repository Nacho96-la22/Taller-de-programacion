package parcial_comercio;

public class porMayor extends Compras{
    private String nombre;
    private int CUIL;

    public porMayor(String nombre, int CUIL, int nro, Fecha f) {
        super(nro, f);
        this.nombre = nombre;
        this.CUIL = CUIL;
    }
    
    @Override
    // Inciso 2.a
    public void agregarProductoCompra(Producto prod){
        if (prod.getCantUnidad() > 6){
            super.agregarProductoCompra(prod);
        }
    }
    
    @Override
    // Inciso 2.b
    public double precioFinal(){
        double iva;
        double total;
        total = super.precioFinal();
        iva = total * 0.21;
        total -= iva;
        return total;
    }
}
