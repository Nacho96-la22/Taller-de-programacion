package parcial_empresa;
/*
Representar una Empresa. La empresa tiene nombre, una direccion, un Director ejecutivo y los
Encargados de sus sucursales numeradas de la 1..N. Del Director se conoce el nombre, DNI, año
de ingreso a la empresa, sueldo basico y monto destinado a viaticos. Del Encargado de cada 
sucursal se conoce el nombre, DNI, año de ingreso a la empresa, sueldo basico y cantidad de
empleados a cargo.

A) Genere las clases necesiarias. Provea constructores para iniciarlas a partir de la informacion
   necesaria. En el caso de la Empresa debe considerar que se crea con nombre, direccion, un Director
   y N sucursales inicialmente sin encargados.

B) Implemente los metodos necesarios, en las clases que corresponda, para:
   1. Asignar un Encargado a la sucursal X. Asuma que X esta en rango de 1..N.
   2. Retornar el sueldo a cobrar por los empleados (Encargados y Director). En ambos casos la empresa 
      incorpora al sueldo basico una comision del 10% si supera los 20 años de antiguedad.
      Ademas:
          - El Encargado tiene un adicional del 1000 pesos por cada empleado a cargo.
          - El director recibe el monto destinado a viaticos.
    3. Retornar una representacion String de Director y Encargado, con formato: "Nombre, DNI, sueldo a 
       cobrar"
    4. Retornar un String que represente la empresa, que contenga: nombre, direccion, representacion del
       Director y la representacion de los Encargados junto a su numero de sucursal. Indique si existe
       alguna sucursal sin Encargado.

C) Realice un programa que instancie una Empresa. Cargue Encargados en distintas sucursales. Luego, imprima
   la representacion de la Empresa.
*/
public class parcialEmpresa {

    public static void main(String[] args) {
        Director dir = new Director("Juan Pablo", 35841773, 2001, 10000, 2500);
        
        //                    (String nombre, String direccion, Director unDirector, int dimF)
        Empresa emp = new Empresa("Audi", "calle 20 y 60", dir, 5);
        
        Encargado encar;
        
        encar = new Encargado("Diego", 25881713, 2000, 2480, 4);
        emp.agregarEncargado(encar, 1);
        
        encar = new Encargado("Maria", 30717891, 2010, 2250, 1);
        emp.agregarEncargado(encar, 3);
        
        encar = new Encargado("Guillermo", 36671789, 2004, 2000, 2);
        emp.agregarEncargado(encar, 5);
        
        System.out.println(emp.toString());
    }
    
}
