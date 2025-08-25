{La feria del Libro necesita un sistema para obtener estadisticas sobre los libros presentados.
 A) Implementar un modulo que lea informacion de los libros, los almacenen  y retorne una esctructura de datos 
    eficiente para la busqueda por codigo de autor; donde para cada codigo de autor se almacenen juntos todos 
    sus libros. De cada libro se conoce: ISBN, codigo del autor y codigo de genero (1..20). La lectura finaliza
    con el 1000 el cual debe procesarse.
 B) Implementar un modulo que reciba la estructura generada en A), un codigo de genero y retorne la cantidad de
    libros existentes para dicho genero.
 C) Realizar un modulo que reciba la estructura generada en A) y dos codigos de autor X e Y, y retorne todos los 
    ISBN de libros cuyo codigo de autor estén entre X e Y (incluidos).
 NOTA: Implementar el programa principal, que invoque a los incisos A, B y C. En caso de ser necesario, puede 
       utilizar los modulos que se encuentran a continuado.}

program parcialLibro;
type
    rangoGenero = 1..20;
    libro = record
        ISBN:integer;
        codAutor:integer;
        codGenero:rangoGenero;
    end;

    arbol = ^nodo;
    nodo = record 
        datos:libro;
        hi:arbol;
        hd:arbol;
    end;

    vectorGenero = array [rangoGenero] of integer;
//--------------------------------------------------------------------------------------------------------------
//-----------------------------------------------> INCISO C <---------------------------------------------------
procedure entreNumerosInferiorSuperior (a:arbol; numSup, numInf:integer);
begin
    if (a <> nil) then begin
        if ((numInf >= a^.datos.codAutor) and (a^.datos.codAutor <= numSup)) then begin
            writeln ('Datos:');
            writeln ('ISBN: ', a^.datos.ISBN);
            writeln ('El codigo de autor: ', a^.datos.codAutor);
            writeln ('El codigo de genero: ', a^.datos.codGenero);
            entreNumerosInferiorSuperior (a^.hi, numSup, numInf);
        end
        else 
            entreNumerosInferiorSuperior (a^.hd, numSup, numInf);
    end;
end;
procedure incisoC (a:arbol);
var
    numSup, numInf:integer;
begin
    writeln ('Ingrese un numero de inferior:');
    readln (numInf);
    writeln ('Ingrese un numero de superior:');
    readln (numSup);
    entreNumerosInferiorSuperior(a, numSup, numInf);
end;
//-----------------------------------------------> INCISO B <---------------------------------------------------
function buscarUnNumeroGenero (v:vectorGenero; num:integer):integer;
var
    i:integer;
begin
    buscarUnNumeroGenero:= 0;
    for i:= 1 to 20 do begin
        if (num = i) then
            buscarUnNumeroGenero:= v[i];
    end;
end;
procedure incisoB (v:vectorGenero);
var
    num:integer;
begin
    writeln ('Ingrese un numero de genero: ');
    readln (num);
    writeln ('Hay el numero de genero, la cantidad tiene ' buscarUnNumeroGenero(v, num));
end;
//-----------------------------------------------> INCISO A <---------------------------------------------------
procedure agregarArbol (var a:arbol; l:libro);
begin
    if (a <> nil) then begin
        new (a);
        a^.datos:= l;
        a^.hi:= nil;
        a^.hd:= nil
    end
    else if (l.codAutor <= a^.datos.codAutor) then
            agregarArbol (a^.hi, l)
        else
            agregarArbol (a^.hd, l);
end;
procedure leerLibros (var l:libro);
begin
    l.ISBN:= random(1000)+1;
    l.codAutor:= random(1000)+1;
    l.codGenero:= random (20)+1;
end;
procedure cargarArbol (var a:arbol; var v:vectorGenero);
var
    l:libro;
begin
    repeat
        leerLibros (l);
        v[l.codGenero]:= v[l.codGenero] + 1;
        agregarArbol (a, l);
    until (l.ISBN = 1000);
end;
procedure inicializarVector (var v:vectorGenero);
var
    i:integer;
begin
    for i:= 1 to 20 do 
        v[i]:= 0;
end;
//--------------------------------------------------------------------------------------------------------------
var
    a:arbol;
    v:vectorGenero;
begin
    a:= nil;
    randomize;
    inicializarVector (v);
    cargarArbol (a, v);
    incisoB (v);
    incisoC(a);
end.

{function buscarUnNumeroGenero (a:arbol num:integer):integer;
begin
    buscarUnNumeroGenero:= 0;
    if (a = nil) then begin
        if (a^.datos.codGenero = num) then 
            buscarUnNumeroGenero:= buscarUnNumeroGenero + 1;
            buscarUnNumeroGenero (a^.hi, num);
        end
        else 
            buscarUnNumeroGenero (a^.hd, num);
    end;
end; }