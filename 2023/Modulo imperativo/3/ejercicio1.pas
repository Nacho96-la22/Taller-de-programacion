{1. Escribir un programa que:
    A) Implemente un módulo que lea información de socios de un club y las almacene en un árbol
       binario de búsqueda. De cada socio se lee número de socio, nombre y edad. La lectura finaliza
       con el número de socio 0 y el árbol debe quedar ordenado por número de socio.
    B) Una vez generado el árbol, realice módulos independientes que reciban el árbol como
       parámetro y que :
       i.  Informe el número de socio más grande. Debe invocar a un módulo recursivo que
           retorne dicho valor.
       ii. Informe los datos del socio con el número de socio más chico. Debe invocar a un módulo
           recursivo que retorne dicho socio.
       iii.Informe el número de socio con mayor edad. Debe invocar a un módulo recursivo que
           retorne dicho valor.
       iv. Aumente en 1 la edad de todos los socios.
       v.  Lea un valor entero e informe si existe o no existe un socio con ese valor. Debe invocar a
           un módulo recursivo que reciba el valor leído y retorne verdadero o falso.
       vi. Lea un nombre e informe si existe o no existe un socio con ese nombre. Debe invocar a
           un módulo recursivo que reciba el nombre leído y retorne verdadero o falso.
       vii.Informe la cantidad de socios. Debe invocar a un módulo recursivo que retorne dicha
           cantidad.
       viii.Informe el promedio de edad de los socios. Debe invocar al módulo recursivo del inciso
            vii e invocar a un módulo recursivo que retorne la suma de las edades de los socios.
       ix. Informe, a partir de dos valores que se leen, la cantidad de socios en el árbol cuyo
           número de socio se encuentra entre los dos valores ingresados. Debe invocar a un módulo
           recursivo que reciba los dos valores leídos y retorne dicha cantidad.
       x.  Informe los números de socio en orden creciente.
       xi. Informe los números de socio pares en orden decreciente.}

program ejercicio1;
type
    socio = record
        nro:integer;
        nombre:string;
        edad:integer;
    end;
    arbol = ^nodo;
    nodo = record
        datos:socio;
        hi:arbol;
        hd:arbol;
    end;
//-------------------------------------------------------------------------------------------------
//--------------------------------------> INCISO B.xi <--------------------------------------------
procedure incisoBxi (a:arbol); 
begin
    if (a <> nil) then begin
        incisoBxi (a^.hd);
        if ((a^.datos.nro mod 2)= 0) then
            writeln ('- ', a^.datos.nro);
        incisoBxi (a^.hi);
    end;
end;
//--------------------------------------> INCISO B.x <---------------------------------------------
procedure incisoBx (a:arbol); 
begin
    if (a <> nil) then begin
        incisoBx (a^.hi);
        writeln ('- ', a^.datos.nro);
        incisoBx (a^.hd);
    end;
end;
//--------------------------------------> INCISO B.ix <--------------------------------------------
procedure cantRango (a:arbol; num1, num2:integer; var cant:integer);
begin
    if (a <> nil) then begin
        if (a^.datos.nro >= num1) and (a^.datos.nro <= num2) then begin
            cant:= cant + 1;
            cantRango(a^.hi, num1, num2, cant);
            cantRango(a^.hd, num1, num2, cant);
        end;
    end;
end;
procedure incisoBix (a:arbol);
var
    num1, num2:integer;
    cant:integer;
begin
    cant:= 0;
    writeln ('> Ingresa dos valores para rangos: ');
    writeln ('Ingrese un numero de socio para inferior:');
    readln (num1);
    writeln ('Ingrese un numero de socio para superior:');
    readln (num2);
    cantRango (a, num1, num2, cant);
    writeln ('La cantidad de socios entre el rango es ', cant);
end;
//----------------------------------> INCISO B.vii y B.viii <--------------------------------------
function promedioEdad (a:arbol):integer;
begin
    if (a = nil) then 
        promedioEdad:= 0
    else
        promedioEdad:= promedioEdad(a^.hi) + promedioEdad(a^.hd) + a^.datos.edad;
end;
function cantidadSocio (a:arbol):integer;
begin
    if (a = nil) then 
        cantidadSocio:= 0
    else
        cantidadSocio:= cantidadSocio (a^.hi) + cantidadSocio (a^.hd) +1;
end;
procedure incisoBviii (a:arbol);
begin
    writeln ('> Informa el promedio de edad de los socios es ', (promedioEdad (a) / cantidadSocio(a)):2:2, ' %');
end;
procedure incisoBvii (a:arbol);
begin
    writeln ('> Informa la cantidad de socios hay ', cantidadSocio (a));
end;
//--------------------------------------> INCISO B.vi <--------------------------------------------
function verificarNombre (a:arbol; nombre:string):boolean; 
begin
    if (a = nil) then    
        verificarNombre:= False
    else begin
        if (nombre = a^.datos.nombre) then
            verificarNombre:= true
        else
            verificarNombre:= verificarNombre (a^.hi, nombre) or verificarNombre (a^.hd, nombre);
    end;
end;
procedure incisoBvi (a:arbol);
var
    nombre:string;
begin
    writeln ('--------------> VERIFICAR EL NOMBRE DE SOCIO <--------------');
    writeln ('Ingrese el nombre de socio:');
    readln (nombre);
    if (verificarNombre (a, nombre)) then
        writeln ('            *** Existe este nombre de socio ***             ')
    else
        writeln ('           *** No existe este nombre de socio ***           ')
end;
//--------------------------------------> INCISO B.v <---------------------------------------------
function verificarSocio (a:arbol; num:Integer):boolean;
begin
    if (a = nil) then    
        verificarSocio:= False
    else begin
        if (num = a^.datos.nro) then
            verificarSocio:= true
        else
            verificarSocio:= verificarSocio (a^.hi, num) or verificarSocio (a^.hd, num);
    end;
end;
procedure incisoBv (a:arbol);
var
    num:integer;
begin
    writeln ('--------------> VERIFICAR EL NUMERO DE SOCIO <--------------');
    writeln ('Ingrese el numero de socio:');
    readln (num);
    if (verificarSocio (a, num)) then
        writeln ('            *** Existe este numero de socio ***             ')
    else
        writeln ('           *** No existe este numero de socio ***           ');
end;
//--------------------------------------> INCISO B.iv <--------------------------------------------
procedure incisoBiv (var a:arbol);
begin
    if (a <> nil) then begin
        a^.datos.edad:= a^.datos.edad + 1;
        incisoBiv (a^.hi);
        incisoBiv (a^.hd);
    end;
end;
//--------------------------------------> INCISO B.iii <-------------------------------------------
procedure buscarMayorEdad (a:arbol; edad:integer; var maxSocio:integer);
begin
    if (a <> nil) then begin
        if (edad < a^.datos.edad) then begin
            edad:= a^.datos.edad;
            maxSocio:= a^.datos.nro;
        end;
        buscarMayorEdad (a^.hi, edad, maxSocio);
        buscarMayorEdad (a^.hd, edad, maxSocio);
    end;  
end;
procedure incisoBiii (a:arbol);
var
    maxSocio:integer;
    edad:integer;
begin
    maxSocio:= 0;
    edad:= 0;
    buscarMayorEdad (a, edad, maxSocio);
    writeln ('> El numero de socio con mayor edad es ', maxSocio);
end;
//--------------------------------------> INCISO B.ii <--------------------------------------------
procedure buscarMinimoNroSocio (a:arbol; var min:socio);
begin
    if (a <> nil) then begin
        if (a^.hi <> nil) then begin
            buscarMinimoNroSocio(a^.hi, min);
            if (min.nro > a^.datos.nro) then begin
                min:= a^.datos;
            end;
        end
        else
            min:= a^.datos;
    end;
end;
procedure incisoBii (a:arbol);
var
    min:socio;
begin
    writeln ('> Este datos del socio con el numero de socio mas chico:');
    buscarMinimoNroSocio (a, min);
    writeln ('nro de socio: ', min.nro);
    writeln ('nombre: ', min.nombre);
    writeln ('edad: ', min.edad);
end;
//--------------------------------------> INCISO B.i <-----------------------------------------------
function buscarMaximoNroSocio (a:arbol):integer;
var
    max:integer;
begin
    if (a <> nil) then begin
        max:= buscarMaximoNroSocio (a^.hd);
        if (max < a^.datos.nro) then begin
            max:= a^.datos.nro;
        end;
        buscarMaximoNroSocio:= max;
    end
    else
        buscarMaximoNroSocio:= -1;
end;
procedure incisoBi (a:arbol);
begin
    writeln ('> El numero de socio mas grande es ', buscarMaximoNroSocio (a));
end;
//--------------------------------------> INCISO A <-----------------------------------------------
procedure agregar (var a:arbol; s:socio);
begin
    if (a = nil) then begin
        new (a);
        a^.datos:= s;
        a^.hi:= nil;
        a^.hd:= nil;
    end 
    else
        if (s.nro <= a^.datos.nro) then
            agregar (a^.hi, s)
            else
                agregar (a^.hd, s);
end;
procedure leer (var s:socio);
begin
    writeln ('Ingrese el numero de socio:');
    readln (s.nro);
    if (s.nro <> 0) then begin
        writeln ('Ingrese nombre:');
        readln (s.nombre);
        writeln ('Ingrese edad:');
        readln (s.edad);
    end;
end;
procedure cargarSocio (var a:arbol);
var
    s:socio;
begin
    a:= nil;
    leer (s);
    while (s.nro <> 0) do begin
        agregar (a, s);
        writeln ('');
        leer (s);
    end;
end;
//-------------------------------------------------------------------------------------------------
var
    a:arbol;
begin
    writeln ('------------------> INFORMACION DE SOCIO <------------------');
    writeln ('> DATOS:');
    cargarSocio (a);// Inciso A
    writeln ('------------------------------------------------------------');
    incisoBi (a);// Inciso B.i
    writeln ('------------------------------------------------------------');
    incisoBii (a);// Inciso B.ii
    writeln ('------------------------------------------------------------');
    incisoBiii (a);// Inciso B.iii
    //-----------------------------------------------------------------------
    incisoBiv (a);
    writeln ('------------------------------------------------------------');
    incisoBv (a);
    writeln ('------------------------------------------------------------');
    incisoBvi (a);
    writeln ('------------------------------------------------------------');
    incisoBvii (a);
    writeln ('------------------------------------------------------------');
    incisoBviii (a);
    writeln ('------------------------------------------------------------');
    incisoBix (a);
    writeln ('------------------------------------------------------------');
    writeln ('> En orden ascendiente por el numero de socio:'); // Menor a mayor
    incisoBx (a);
    writeln ('------------------------------------------------------------');
    writeln ('> En orden descendiente por el numero de socio pares:'); // Mayor a menor
    incisoBxi (a);
    writeln ('------------------------> FINALIZADO <----------------------');
end.