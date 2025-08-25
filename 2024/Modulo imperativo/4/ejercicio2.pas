{1. Escribir un programa que:
    A) Implemente un módulo que lea información de socios de un club y las almacene en un árbol
       binario de búsqueda. De cada socio se lee número de socio, nombre y edad. La lectura finaliza
       con el número de socio 0 y el árbol debe quedar ordenado por número de socio.
    B) Una vez generado el árbol, realice módulos independientes que reciban el árbol como
       parámetro y que :

       i.    Informar los datos de los socios en orden creciente.
       ii.   Informar los datos de los socios en orden decreciente.
       iii.  Informar el número de socio con mayor edad. Debe invocar a un módulo recursivo que
             retorne dicho valor.
       iv.   Aumentar en 1 la edad de los socios con edad impar e informar la cantidad de socios
             que se les aumentó la edad.
       v.    Leer un nombre e informar si existe o no existe un socio con ese nombre. Debe invocar
             a un módulo recursivo que reciba el nombre leído y retorne verdadero o falso.
       vi.   Informar la cantidad de socios. Debe invocar a un módulo recursivo que retorne dicha
             cantidad.
       vii.  Informar el promedio de edad de los socios. Debe invocar a un módulo recursivo que
             retorne el promedio de las edades de los socios.}

program ejercicio2;
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

//--------------------------------------> INCISO iv <--------------------------------------------
procedure incisoIV (a:arbol; minimo,maximo:integer; var cant:integer);
begin
    if (a <> nil) then begin
        if (a^.datos.nro >= minimo) then
            if (a^.datos.nro <= maximo) then begin
                cant:= cant + 1;
                incisoIV(a^.hi,minimo,maximo,cant);
                incisoIV(a^.hd,minimo,maximo,cant);
            end
            else
                incisoIV(a^.hi,minimo,maximo,cant)
        else
            incisoIV(a^.hd,minimo,maximo,cant);
    end;    
end;
//--------------------------------------> INCISO iii <-------------------------------------------
function incisoIII (a:arbol; nro:Integer):boolean;
begin
    if (a = nil) then
        incisoIII:= false
    else if (a^.datos.nro = nro) then
            incisoIII:= true
        else
            incisoIII:= incisoIII(a^.hi, nro) or incisoIII(a^.hd, nro);
end;
//--------------------------------------> INCISO ii <--------------------------------------------
procedure incisoII (a:arbol; var min:socio);
begin
    if (a <> nil) then begin
        if (a^.hi = nil) then
            min:= a^.datos
        else
            incisoII(a^.hi,min);
    end;
end;
//--------------------------------------> INCISO i <---------------------------------------------
function incisoI (a:arbol):integer;
begin
    if (a = nil) then
        incisoI:= -1
    else if (a^.hd = nil) then
            incisoI:= a^.datos.nro
        else
            incisoI:= incisoI(a^.hd);
end;
//--------------------------------------> TEST PRUEBA <---------------------------------------------
procedure imprimir (a:arbol);
begin
    if (a <> nil) then begin
        imprimir(a^.hi);
        writeln (a^.datos.nro);
        imprimir(a^.hd);
    end;
end;
//--------------------------------------> INCISO A <-----------------------------------------------
procedure cargarSocio (var a:arbol);

    procedure agregar (var a:arbol; s:socio);
    begin
        if (a = nil) then begin
            new (a);
            a^.datos:= s;
            a^.hi:= nil;
            a^.hd:= nil;
        end 
        else if (s.nro < a^.datos.nro) then
                agregar (a^.hi, s)
            else
                agregar (a^.hd, s);
    end;
    procedure leer (var s:socio);
    var
        // esta sirve para random de string
        vNom:array [0..9] of String =('Ana', 'Homero', 'Luis', 'Ignacio', 'Ariel', 'Pedro', 'Bart', 'Lisa', 'Martin', 'Vanesa');
    begin
        s.nro:= random (51)*100;
        if (s.nro <> 0) then begin
            s.nombre:= vNom[random(10)];
            s.edad:= random(99);
        end;
    end;

var
    s:socio;
begin
    leer (s);
    while (s.nro <> 0) do begin
        agregar (a, s);
        leer (s);
    end;
end;
//-------------------------------------------------------------------------------------------------
var
    a:arbol;
    min:socio;
    nro:integer;
    minimo,maximo,cant:integer;
begin
    randomize;
    a:= nil;
    writeln ('------------------> INFORMACION DE SOCIO <------------------');
    writeln ('               *** Han cargados los datos ***');
    cargarSocio (a);                                                         // Inciso A
    //imprimir(a);
    writeln ('-------------> EL NUMERO DE SOCIO MAS GRANDE <--------------');
    writeln ('> El numero de socio es ', incisoI (a));                       // Inciso I
    writeln ('--------------> EL DATOS DE SOCIOS MAS CHICO <--------------');
    incisoII (a,min);                                                        // Inciso II
    writeln ('> El nro de socio: ', min.nro,', nombre: ', min.nombre,' y edad: ', min.edad);
    writeln ('------------> EL NUMERO DE SOCIO PUEDE EXISTIR <------------');
    write ('> Ingrese el nro de socio: '); readln(nro);
    if (incisoIII (a,nro)) then                                              // Inciso III
        WriteLn ('      *** Si existe este numero de socio ***')
    else
        WriteLn ('      *** No existe este numero de socio ***');
    writeln ('------------------------------------------------------------');
    cant:= 0;
    write ('> Ingrese el minimo de rango: '); readln (minimo);
    write ('> Ingrese el maximo de rango: '); readln (maximo);
    incisoIV (a,minimo,maximo,cant);                                        // Inciso IV
    writeln ('- La cantidad de socios entre dos valores recibidos: ', cant);
    writeln ('------------------------> FINALIZADO <----------------------');
end.