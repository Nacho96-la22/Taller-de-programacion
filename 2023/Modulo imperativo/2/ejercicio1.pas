{1- Implementar un programa que invoque a los siguientes módulos.
    A) Un módulo recursivo que permita leer una secuencia de caracteres
       terminada en punto, los almacene en un vector con dimensión física 
       igual a 10 y retorne el vector.
    B) Un módulo que reciba el vector generado en a) e imprima el contenido
       del vector.
    C) Un módulo recursivo que reciba el vector generado en a) e imprima el 
       contenido del vector.
    D) Un módulo recursivo que permita leer una secuencia de caracteres terminada
       en punto y retorne la cantidad de caracteres leídos. El programa debe informar
       el valor retornado.
    E) Un módulo recursivo que permita leer una secuencia de caracteres terminada 
       en punto y retorne una lista con los caracteres leídos.
    F) Un módulo recursivo que reciba la lista generada en e) e imprima los
       valores de la lista en el mismo orden que están almacenados.
    G) Implemente un módulo recursivo que reciba la lista generada en e) e 
       imprima los valores de la lista en orden inverso al que están almacenados.}

program ejercicio1;
const
    dimF = 10;
type
    vectorChar = array [1..dimF] of char;
    lista = ^nodo;
    nodo = record
        datos:char;
        sig:lista;
    end;
//----------------------------------------------------------------------
//---------------------------- Inciso G --------------------------------
procedure incisoG (var l:lista);
var
    ant, act:lista;
begin
    if (l <> nil) then begin
        incisoG(l^.sig); 
        writeln ('Imprimi: ', l^.datos);
    end;
end;
//---------------------------- Inciso F --------------------------------
procedure incisoF (l:lista);
begin
    if (l <> nil) then begin
        writeln ('Imprimir: ', l^.datos);
        incisoF(l^.sig);
    end;
end;
//---------------------------- Inciso E --------------------------------
procedure incisoE (var l:lista);
var
    c:char;
    nue:lista;
begin
    write ('Escribi una letra: ');
    readln (c);
    if (c <> '.') then begin
        new (nue);
        nue^.datos:= c;
        nue^.sig:= l;
        l:= nue;
        incisoE (l^.sig);
    end;
end;
//---------------------------- Inciso D --------------------------------
function incisoD ():integer;
var
    c:char;
begin
    write ('Secuencia: ');
    readln (c);
    if (c <> '.') then 
        incisoD:= incisoD() + 1
    else
        incisoD:= 0;
end;
//---------------------------- Inciso C --------------------------------
procedure imprimirC (vc:vectorChar; dimL:integer; var x:integer);
begin
    if (x < dimL) then begin
        x:= x + 1;
        writeln ('Imprimi: ', vc[x]);
        imprimirC (vc, dimL, x);
    end;    
end;
procedure incisoC (vc:vectorChar; dimL:integer);
var
    x:integer;
begin
    x:= 0;
    imprimirC (vc, dimL, x);
end;
//---------------------------- Inciso B --------------------------------
procedure incisoB (vc:vectorChar; dimL:integer);
var
    i:integer;
begin
    for i:= 1 to dimL do begin
        writeln ('Imprimi: ', vc[i]);
    end;
end;
//---------------------------- Inciso A --------------------------------
procedure incisoA (var vc:vectorChar; var dimL:integer);
var
    c:Char;
begin
    write ('Escribi un letra: '); readln (c);
    if ((dimL < dimF) and (c <> '.')) then begin
        dimL:= dimL +1;
        vc[dimL]:= c;
        incisoA (vc, dimL);
    end;
end;
//----------------------------------------------------------------------
var
    vc:vectorChar;
    dimL:integer;
    cant:integer;
    l:lista;
begin
    dimL:= 0;
    writeln ('------------------> INCISO A <------------------');
    incisoA (vc, dimL);
    writeln ();
    writeln ('------------------> INCISO B <------------------');
    incisoB (vc, dimL);
    writeln ();
    writeln ('------------------> INCISO C <------------------');
    incisoC (vc, dimL);
    writeln ();
    writeln ('------------------> INCISO D <------------------');
    cant:= incisoD ();
    writeln ('La cantidad de caracteres leidos fueron: ', cant);
    writeln ();
    writeln ('------------------> INCISO E <------------------');
    l:= nil;
    incisoE (l);
    writeln ();
    writeln ('------------------> INCISO F <------------------');
    incisoF (l);
    writeln ();
    writeln ('------------------> INCISO G <------------------');
    incisoG (l);
end.