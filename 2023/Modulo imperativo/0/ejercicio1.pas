{1) Implementar un programa que procese la información de los alumnos de la Facultad de Informática.
 a) Implementar un módulo que lea y retorne, en una estructura adecuada, la información de todos
    los alumnos. De cada alumno se lee su apellido, número de alumno, año de ingreso, cantidad de
    materias aprobadas (a lo sumo 36) y nota obtenida (sin contar los aplazos) en cada una de las
    materias aprobadas. La lectura finaliza cuando se ingresa el número de alumno 11111, el cual 
    debe procesarse.
 b) Implementar un módulo que reciba la estructura generada en el inciso a) y retorne número de 
    alumno y promedio de cada alumno.}

program ejercicio1;
type
   {Inciso A}
   rangoMateria = 1..36;
   vectorNotas = array [rangoMateria] of real;
   alumno = record 
      apellido:string;
      nro:integer;
      anioIngreso:integer;
      cantMateriaA:rangoMateria;
      notas:vectorNotas;
   end;   
   lista =^nodo;
   nodo = record
      datos:alumno;
      sig:lista;
   end;
//----------------------------------------------------------------------------------------------
{-------------------------------------------Inciso B--------------------------------------------}
function promedio (v:vectorNotas; var dimL:rangoMateria):real;
var
   suma:real;
   i:integer;
begin
   suma:= 0;
   for i:= 1 to dimL do begin
      suma:= suma + v[i];
   end;
   promedio:= suma/dimL;
end;
procedure incisoB (l:lista);
begin
   while (l <> nil) do begin
      if (l^.datos.cantMateriaA > 1) then
         writeln ('El numero de alumno: ', l^.datos.nro, ' , promedio ', promedio(l^.datos.notas, l^.datos.cantMateriaA):0:2);
      l:= l^.sig;
   end;
end;
{------------------------------------Inciso A------------------------------------------}
procedure resultadoNotas (var v:vectorNotas; dimL:integer);
var
   i:integer;
   notaresult:real;
begin
   for i:= 1 to dimL do begin
      writeln ('> pos: ', i, ', ingrese la nota: ');
      readln (notaresult);
      v[i]:= notaresult;
   end;
end;
procedure cargarVector (var v:vectorNotas);
var
   i:integer;
begin
   for i:= 1 to 36 do begin
      v[i]:= 0;
   end;
end;
procedure leer (var a:alumno);
var
   i:integer;
begin
   writeln ('Ingrese el numero de alumno: ');
   readln (a.nro);
   writeln ('Ingrese el apellido: ');
   readln (a.apellido);
   writeln ('Ingrese el anio de ingreso: ');
   readln (a.anioIngreso);
   writeln ('Ingrese la cantidad de materias aprobadas: ');
   readln (a.cantMateriaA);
   cargarVector (a.notas); // inicializar el vector 
   if (a.cantMateriaA > 1) then begin
      resultadoNotas (a.notas, a.cantMateriaA);
   end
      else begin
         writeln ('No ha aprobado una de las materias.');        
   end;
   writeln ('Resultado materias aprobadas: ');
   for i:= 1 to a.cantMateriaA do
      writeln ('> ', i,' materia y ', a.notas[i]:0:2, ' notas.');
   writeln ('--------------------------------------------------------');
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
   writeln ('--------------------------------------------------------');
end.
