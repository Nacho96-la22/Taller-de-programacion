package tema3;

public class Estante {
    private int dimL = 0;
    private int dimF = 20;
    private Libro [] vector;

    public Estante(){
        this.vector = new Libro[dimF];
    }
    

    public int getDimL() {
        return dimL;
    }
    
    public boolean estaLleno(){
        return dimL == dimF;
    }
    
    public void agregarLibro(Libro unLibro){
        if (!this.estaLleno()){
            this.vector[dimL++] = unLibro;
        } else {
            System.out.println("Esta lleno");
        }
    }
    
    public Libro devolverTitulo (String titulo){
        int cantLibro = 0;
        while ((cantLibro < this.dimL) && (!titulo.equals(this.vector[cantLibro].getTitulo()))){
            cantLibro++;
        }
        if (cantLibro < dimL) {
            return vector[cantLibro];
        } else
            return null;
    }
}