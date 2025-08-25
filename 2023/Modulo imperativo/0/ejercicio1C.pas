{1.c) Analizar: ¿qué cambios requieren los puntos a y b, si no se sabe de antemano la cantidad de 
    materias aprobadas de cada alumno, y si además se desean registrar los aplazos? ¿cómo puede
    diseñarse una solución modularizada que requiera la menor cantidad de cambios?}

program ejercicio1C;
type
   {Inciso C}
   listaNota = ^nodo2;
   nodo2 = record
      datos:real;
      sig:listaNota;
   end;
   {Inciso A}   
   alumno = record 
      apellido:string;
      nro:integer;
      anioIngreso:integer;
      notas:listaNota;
   end;   
   lista =^nodo;
   nodo = record
      datos:alumno;
      sig:lista;
   end;
//------------------------------------------------------------------------------------------------
{------------------------------------------- Inciso B --------------------------------------------}
procedure calcularPromedio (var resultPromedio:real; ln:listaNota);
var
   suma:real;
   cantMateria:integer;
begin
   cantMateria:= 0;
   while (ln <> nil) do begin
      if (ln^.datos <> -1) then
         suma:= resultPromedio + ln^.datos;
         cantMateria:= cantMateria + 1;
      ln:= ln^.sig;
   end;
   resultPromedio:= suma/cantMateria;
end;
procedure incisoB (l:lista);
var
   resultPromedio:real;
begin
   while (l <> nil) do begin
      resultPromedio:= 0;
      calcularPromedio (resultPromedio, l^.datos.notas);
      writeln ('El numero de alumno: ', l^.datos.nro, ', promedio es ', resultPromedio:0:2);
      l:= l^.sig;
   end;
end;
{------------------------------------ Inciso A --------------------------------------------------}
procedure agregarAdelanteNotas (var ln:listaNota; nota:real);
var
   nue:listaNota;
begin
   new (nue);
   nue^.datos:= nota;
   nue^.sig:= ln;
   ln:= nue;
end;
procedure cargarListaNota (var ln:listaNota);
var
   nota:real;
begin
   writeln ('Ingrese una nota de materia: ');
   readln (nota);
   while (nota <> -1) do begin
      agregarAdelanteNotas (ln, nota);
      writeln ('Ingrese una nota de materia: ');
      readln (nota);
   end;
end;
procedure leer (var a:alumno);
begin
   a.notas:= nil;
   writeln ('Ingrese el numero de alumno: ');
   readln (a.nro);
   writeln ('Ingrese el apellido: ');
   readln (a.apellido);
   writeln ('Ingrese el anio de ingreso: ');
   readln (a.anioIngreso);
   writeln ('Informacion de las materias: ');
   cargarListaNota (a.notas);  
end;
procedure agregarAdelante (var l:lista; a:alumno);
var
   nue:lista;
begin
   new (nue);
   nue^.datos:= a;
   nue^.sig:= l;
   l:= nue;
end;
procedure cargarLista (var l:lista);
var
   a:alumno;
begin
   repeat
   writeln ('INFORMACION DEL ALUMNO');
   leer (a);
   agregarAdelante (l, a);
   until (a.nro = 11111);
end;
//----------------------------------------------------------------------------------------------
var
   l:lista;
begin
   l:= nil;
   cargarLista(l);
   incisoB (l);
end.