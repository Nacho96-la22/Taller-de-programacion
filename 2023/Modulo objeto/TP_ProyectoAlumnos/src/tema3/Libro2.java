package tema3;

public class Libro2 {
   private String titulo;
   private String autor; 
     
    
    public Libro2(String unTitulo,  String unPrimerAutor){
         titulo = unTitulo;
         autor = unPrimerAutor;
    }
    
    public Libro2(){
   
    }
        
    public String getTitulo(){
        return titulo;
    }
  

    public String getPrimerAutor(){
        return autor;
    } 
   
    public void setTitulo(String unTitulo){
        titulo = unTitulo;
    }
      
    public void setPrimerAutor(String unPrimerAutor){
         autor=unPrimerAutor;
    } 
  
   @Override
    public String toString(){
        String aux;
        aux= titulo + " por " + autor;
       return ( aux);
    }
        
}
