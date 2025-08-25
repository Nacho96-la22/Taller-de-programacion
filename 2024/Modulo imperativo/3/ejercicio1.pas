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
//----------------------------------> INCISO B.vi y B.vii <--------------------------------------
function cantidadSocio (a:arbol):integer;
begin
    if (a = nil) then 
        cantidadSocio:= 0
    else
        cantidadSocio:= cantidadSocio (a^.hi) + cantidadSocio (a^.hd) +1;
end;
function promedioEdad (a:arbol):integer;
begin
    if (a = nil) then 
        promedioEdad:= 0
    else
        promedioEdad:= promedioEdad(a^.hi) + promedioEdad(a^.hd) + a^.datos.edad;
end;
procedure promedioEdadSocios (a:arbol);
begin
    writeln ('> Informa el promedio de edad de los socios es ', (promedioEdad (a) / cantidadSocio(a)):2:2, ' %');
end;
//--------------------------------------> INCISO B.v <---------------------------------------------
procedure buscarNombreEnSocios (a:arbol);

    function verificarSocio (a:arbol; nombre:String):boolean;
    begin
        if (a = nil) then    
            verificarSocio:= False
        else begin
                if (nombre = a^.datos.nombre) then
                    verificarSocio:= true
                else
                    verificarSocio:= verificarSocio (a^.hi, nombre) or verificarSocio (a^.hd, nombre);
            end;
    end;

var
    nombre:String;
begin
    writeln ('--------------> VERIFICAR EL NUMERO DE SOCIO <--------------');
    write ('Ingrese el nombre de socio: '); readln (nombre);
    if (verificarSocio (a, nombre)) then
        writeln ('            *** Existe este nombre de socio ***             ')
    else
        writeln ('           *** No existe este nombre de socio ***           ');
end;
//--------------------------------------> INCISO B.iv <--------------------------------------------
procedure aumentarEdadImpar (a:arbol);

    function aumentarEdad(a:arbol):integer;
    var
        resto:integer;
    begin
        if (a = nil) then
            aumentarEdad:= 0
        else begin 
                resto:= a^.datos.edad mod 2;
                if (resto = 1) then
                    a^.datos.edad:= a^.datos.edad + 1;
                aumentarEdad:= resto + aumentarEdad(a^.hi) + aumentarEdad(a^.hd);
            end;
    end;

begin
    writeln ('> La cantidad de socios que se les aumento edad: ', aumentarEdad(a));
end;
//--------------------------------------> INCISO B.iii <-------------------------------------------
procedure mayorEdad (a:arbol);

    procedure buscarMayorEdad (a:arbol; var maxEdad:integer; var maxSocio:integer);
    begin
        if (a <> nil) then begin
            if (maxEdad < a^.datos.edad) then begin
                maxEdad:= a^.datos.edad;
                maxSocio:= a^.datos.nro;
            end;
            buscarMayorEdad (a^.hi, maxEdad, maxSocio);
            buscarMayorEdad (a^.hd, maxEdad, maxSocio);
        end;  
    end;

var
    maxSocio:integer;
    maxEdad:integer;
begin
    maxSocio:= 0;
    maxEdad:= -1;
    buscarMayorEdad (a, maxEdad, maxSocio);
    writeln ('> El numero de socio con mayor edad es ', maxSocio);
end;
//--------------------------------------> INCISO B.ii <--------------------------------------------
procedure ordenDecriciente (a:arbol);
begin
    if (a <> nil)  then begin
        ordenDecriciente (a^.hd);
        writeln ('- Nro: ', a^.datos.nro,', nombre: ',a^.datos.nombre,' y edad: ', a^.datos.edad);
        ordenDecriciente (a^.hi);
    end;
end;
//--------------------------------------> INCISO B.i <-----------------------------------------------
procedure ordenCreciente (a:arbol); 
begin
    if (a <> nil) then begin
        ordenCreciente (a^.hi);
        writeln ('- Nro: ', a^.datos.nro,', nombre: ',a^.datos.nombre,' y edad: ', a^.datos.edad);
        ordenCreciente (a^.hd);
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
        writeln ('Ingrese el numero de socio:');
        readln (s.nro);
        if (s.nro <> 0) then begin
            s.nombre:= vNom[random(10)];
            s.edad:= random(99);
        end;
    end;

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
    randomize;
    writeln ('------------------> INFORMACION DE SOCIO <------------------');
    writeln ('> DATOS:');
    cargarSocio (a);                                                         // Inciso A
    writeln ('---------------> INFORME EN ORDEN CRECIENTE <---------------');
    ordenCreciente (a);                                                      // Inciso B.i
    writeln ('--------------> INFORME EN ORDEN DECRECIENTE <--------------');
    ordenDecriciente (a);                                                    // Inciso B.ii
    writeln ('------------------------------------------------------------');
    mayorEdad (a);                                                           // Inciso B.iii
    writeln ('------------------------------------------------------------');
    aumentarEdadImpar (a);                                                   // Inciso B.iv
    writeln ('------------------------------------------------------------');
    buscarNombreEnSocios (a);                                                // Inciso B.v 
    writeln ('------------------------------------------------------------');
    writeln ('> Informa la cantidad de socios hay ', cantidadSocio (a));     // Inciso B.vi
    writeln ('------------------------------------------------------------');
    promedioEdadSocios (a);                                                  // Inciso B.vii
    writeln ('------------------------> FINALIZADO <----------------------');
end.