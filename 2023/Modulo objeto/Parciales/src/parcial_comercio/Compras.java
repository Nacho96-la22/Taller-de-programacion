
package parcial_comercio;

public class Compras {
    private int nro;
    private Fecha f;
    private int dimL;
    private Producto[] prod;

    public Compras(int nro, Fecha f) {
        this.nro = nro;
        this.f = f;
        this.dimL = 0;
        this.prod = new Producto[10];
    }
    // Inciso 2.a
    public void agregarProductoCompra(Producto prod){
        if (this.dimL < 10){
            this.prod[dimL] = prod;
            dimL++;
        } else {
            System.out.println ("Ha limitado los productos.");
        }
    }
    // Inciso 2.b
    public double precioFinal(){
        double total = 0;
        for (int i=0; i < this.dimL;i++){
            total += this.prod[i].getCantUnidad() * this.prod[i].getPrecio();
        }
        return total;
    }
    
    // Inciso 2.c
    private String mostrarProductos(){
        String aux = "";
        for (int i=0; i < this.dimL; i++){
            aux += prod[i].toString()+"\n";
        }
        return aux;
    }
    // Inciso 2.d
    public boolean abonable(){
        return precioFinal() > 100000;
    }
    
    public String toString(){
        return "El número: "+ nro +", fecha: "+ f +"\n"+
                "Productos: \n" + this.mostrarProductos();
    }
}
