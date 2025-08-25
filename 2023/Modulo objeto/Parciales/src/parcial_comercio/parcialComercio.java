package parcial_comercio;

public class parcialComercio {

    public static void main(String[] args) {
        // carga la compra
        Fecha f = new Fecha (4,5,2024);
        Compras c = new Compras (40, f);
        // carga los productos
        Producto p;
        for (int i=0; i< 6; i++){
            p = new Producto(100, "Alfajor", 1000, 5);
            c.agregarProductoCompra(p);
        }
        System.out.println("El precio final: "+ c.precioFinal());
        System.out.println("Es abonable? : "+ c.abonable());
        // carga por mayor 
        f = new Fecha (5,10,2024);
        porMayor pm = new porMayor("Matias", 2077881314, 5,f);
        for (int i = 0; i < 6; i++){
            p = new Producto(179, "Hamburgesa", 2000, 7);
            pm.agregarProductoCompra(p);
        }
        System.out.println ("El precio final: "+pm.precioFinal());
        System.out.println ("Es abonable?: "+pm.abonable());
    }
    
}
