{3. Implementar un programa que contenga:
 a) Un módulo que lea información de alumnos de Taller de Programación y los almacene en
    una estructura de datos. De cada alumno se lee legajo, DNI, año de ingreso y los códigos y
    notas de los finales rendidos. La estructura generada debe ser eficiente para la búsqueda por
    número de legajo. La lectura de los alumnos finaliza con legajo 0 y para cada alumno el ingreso
    de las materias finaliza con el código de materia -1.
 b) Un módulo que reciba la estructura generada en a. y retorne los DNI y año de ingreso de
    aquellos alumnos cuyo legajo sea inferior a un valor ingresado como parámetro.
 c) Un módulo que reciba la estructura generada en a. y retorne el legajo más grande.
 d) Un módulo que reciba la estructura generada en a. y retorne el DNI más grande.
 e) Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con
    legajo impar.
 f) Un módulo que reciba la estructura generada en a. y retorne el legajo y el promedio del
    alumno con mayor promedio.
 g) Un módulo que reciba la estructura generada en a. y un valor entero. Este módulo debe
    retornar los legajos y promedios de los alumnos cuyo promedio supera el valor ingresado.}

program ejercicio3;
type
   rangoDNI = 30000000..50000000;
   rangoAnio= 2012..2024;

   materias = record
      cod:integer;
      notas:integer;
   end;

   lista = ^nodo1;
   nodo1 = record
      datos:materias;
      sig:lista;
   end;

   alumno = record
      legajo:integer;
      DNI:rangoDNI;// ---> Aviso que esta fallado porque no guarda bien en DNI mas grande y solo me funciona con integer (DNI:integer;)
      anioIngreso:rangoAnio;
      finales:lista;
   end;

   arbol = ^nodo2;
   nodo2 = record
      datos:alumno;
      hi:arbol;
      hd:arbol;
   end;
//-------------------------------------> INCISO F <------------------------------------------------
procedure incisoF (a1:arbol; var maxLegajo:integer; var maxPromedio:real);
   
   function calcularPromedio (l:lista):real;
   var
      notatotal:real;
      cantMateria:integer;
   begin
      notatotal:= 0;
      cantMateria:= 0;
      while (l <> nil) do begin
         notatotal:= notatotal + l^.datos.notas;
         cantMateria:= cantMateria + 1;
         l:= l^.sig;
      end;
      calcularPromedio:= (notatotal/cantMateria);
   end;

var
   prom:real;
begin
   if (a1 <> nil) then begin
      prom:= calcularPromedio(a1^.datos.finales);
      if (prom > maxPromedio) then begin
         maxPromedio:= prom;
         maxLegajo:= a1^.datos.legajo;
      end;
      incisoF (a1^.hi, maxLegajo, maxPromedio);
      incisoF (a1^.hd, maxLegajo, maxPromedio);
   end;
end;
//-------------------------------------> INCISO E <------------------------------------------------
procedure incisoE (a1:arbol);
   function cantLegajosImpar (a1:arbol):integer;
   begin
      cantLegajosImpar:= 0;
      if (a1 <> nil) then begin
         if((a1^.datos.legajo mod 2)=1) then
            cantLegajosImpar:= cantLegajosImpar(a1^.hi) + 1
         else
            cantLegajosImpar:= cantLegajosImpar(a1^.hd) + 1
      end;
   end;
begin
   writeln ('> Informa la cantidad de legajos con impar hay ', cantLegajosImpar(a1));
end;
//-------------------------------------> INCISO D <------------------------------------------------
procedure incisoD (a1:arbol);
   
   function buscarMasGrandeDNI (a1:arbol):integer;
   var
      max:integer;
   begin
      if (a1 <> nil)then begin
         max:= buscarMasGrandeDNI(a1^.hd);
         if (max < a1^.datos.DNI) then
            max:= a1^.datos.DNI;
         buscarMasGrandeDNI:= max;
      end
      else
         buscarMasGrandeDNI:= -1;
   end;

begin
   writeln ('> El DNI es mas grande: ', buscarMasGrandeDNI(a1));
end;
//-------------------------------------> INCISO C <------------------------------------------------
procedure incisoC (a1:arbol);

   function buscarMasGrandeLegajo (a1:arbol):integer;
   var
      max:integer;
   begin
      if (a1 <> nil) then begin 
         max:= buscarMasGrandeLegajo (a1^.hd);
         if (max < a1^.datos.legajo) then
            max:= a1^.datos.legajo;
         buscarMasGrandeLegajo:= max;
      end
      else
         buscarMasGrandeLegajo:= -1    
   end;

begin
   writeln ('> El numero de legajo es mas grande: ', buscarMasGrandeLegajo(a1));
end;
//-------------------------------------> INCISO B <------------------------------------------------
procedure incisoB (a1:arbol; inf:integer);
begin
   if (a1 <> nil) then begin
      incisoB(a1^.hi, inf);
      if (a1^.datos.legajo <= inf) then
         writeln('- El DNI: ', a1^.datos.DNI,' y el anio de ingreso: ', a1^.datos.anioIngreso);
      incisoB(a1^.hd, inf);
   end;
end;
//-------------------------------------> INCISO A <------------------------------------------------
procedure imprimirFinales (l:lista);
begin
   if (l <> nil) then begin
      writeln('- El codigo: ',l^.datos.cod, ' y la nota: ', l^.datos.notas);
      imprimirFinales(l^.sig);
   end;
end;
procedure imprimirDatos (a1:arbol);
begin
   if(a1 <> nil) then begin
      imprimirDatos(a1^.hi);
      writeln ('> El nro de legajo: ', a1^.datos.legajo);
      writeln ('- El DNI: ', a1^.datos.DNI);
      writeln ('- El anio de ingreso: ', a1^.datos.anioIngreso);
      writeln('> Las materias finales:');
      imprimirFinales(a1^.datos.finales);
      writeln('----------------------------');
      imprimirDatos(a1^.hd);
   end;
end;
procedure cargarArbol (a:alumno; var a1:arbol);
begin
   if (a1 = nil) then begin
      new(a1);
      a1^.datos:= a;
      a1^.hi:= nil;
      a1^.hd:= nil;
   end
   else if (a1^.datos.legajo > a.legajo) then
            cargarArbol(a, a1^.hi)
         else
            cargarArbol(a, a1^.hd)
end;
procedure crearLista (m:materias; var l:lista);
var
   nue:lista;
begin
   new(nue);
   nue^.datos:= m;
   nue^.sig:= l;
   l:= nue;
end;
procedure leerMaterias (var m:materias);
begin
   write ('- Ingrese el codigo de materia: ');
   readln(m.cod);
   if (m.cod <> -1) then
      m.notas:= random(10)+1;
end;
procedure cargarLista(var l:lista);// ACA
var
   m:materias;
begin
   writeln ('> Las materias finales:');
   leerMaterias(m);
   while (m.cod <> -1) do begin
      crearLista(m,l);
      leerMaterias(m);
   end;
end;
procedure leerAlumno(var a:alumno);
begin
   writeln('Ingrese el nro de legajo:');
   readln(a.legajo);
   if (a.legajo <> 0) then
      a.DNI:= random(50000000)+1;
      writeln ('Ingrese el anio de ingreso:');
      readln (a.anioIngreso);
      a.finales:= nil;
      cargarLista(a.finales);// Aca carga la lista
end;
procedure incisoA (var a1:arbol);
var
   a:alumno;
begin
   leerAlumno(a);
   while (a.legajo <> 0) do begin
      cargarArbol(a,a1);
      writeln('----------------------------');
      leerAlumno(a);
   end;
end;
//-------------------------------------------------------------------------------------------------
var
   a1:arbol;
   inf:integer;
   maxLegajo:integer;
   maxPromedio:real;
begin
   randomize;
   a1:=nil;
   maxLegajo:= 0;
   maxPromedio:= -1;
   writeln('------------------> INFORMACION DE ALUMNOS <------------------');
   writeln('> Datos:');
   incisoA(a1);
   writeln('--------------------> IMPRIMIR LOS DATOS <--------------------');
   imprimirDatos(a1);
   writeln('------------------> INFORMACION EL INFERIOR <-------------------');
   writeln ('> Ingrese el legajo:'); readln (inf);
   writeln ('> Informa los datos:');
   incisoB(a1, inf);
   writeln('----------> BUSCAR EL NUMERO DE LEGAJO MAS GRANDE <-----------');
   incisoC(a1);
   writeln('------------> BUSCAR EL NUMERO DE DNI MAS GRANDE <------------');
   incisoD(a1);// <--- El resultado mal
   writeln('---------> LA CANTIDAD DE ALUMNOS CON LEGAJOS IMPAR <---------');
   incisoE(a1);
   writeln('--------> EL PROMEDIO DEL ALUMNO CON MAYOR PROMEDIO <---------');
   incisoF(a1, maxLegajo, maxPromedio);// Duda por si hice bien este inciso F
   writeln ('> El alumno es mayor promedio:');
   writeln ('- El legajo: ', maxLegajo);
   writeln ('- El promedio: ', maxPromedio:3:2,' %');
end.