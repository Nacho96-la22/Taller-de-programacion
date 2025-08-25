{3- Escribir un programa que:
    A) Implemente un módulo recursivo que genere una lista de números
       enteros “random” mayores a 0 y menores a 100. Finalizar con 
       el número 0.
    B) Implemente un módulo recursivo que devuelva el mínimo valor 
       de la lista.
    C) Implemente un módulo recursivo que devuelva el máximo valor 
       de la lista.
    D) Implemente un módulo recursivo que devuelva verdadero si un 
       valor determinado se encuentra en la lista o falso en caso 
       contrario.}

program ejercicio3;
type    
    lista = ^nodo;
    nodo = record
        datos:integer;
        sig:lista;
    end;
//----------------------------------------------------------------------
//---------------------------- Inciso D --------------------------------
function buscarUnValor (l:lista; num:integer):boolean;
begin
    if (l <> nil) then begin
        if (l^.datos = num) then
            buscarUnValor:= true
        else
            buscarUnValor(l^.sig, num);
    end
    else
        buscarUnValor:= false;
end;
procedure incisoD (l:lista);
var
    num:integer;
begin
    writeln ('Ingrese un valor:');
    readln (num);
    if (buscarUnValor(l, num)) then begin
        writeln ('Si esta este numero en la lista.');
    end
    else
        writeln ('No esta este numero en la lista.');
end;
//---------------------------- Inciso C --------------------------------
function maximo (l:lista):integer;
var 
    max:Integer;
begin
    if (l <> nil) then begin
        max:=maximo(l^.sig);
        if (l^.datos > max) then begin
            max:= l^.datos;
        end;
        maximo:=max;
    end
    else
        maximo:= -1;
end;
procedure incisoC (l:lista);
begin
    writeln ('El numero es mas grande: ', maximo (l));
end;
//---------------------------- Inciso B --------------------------------
function minimo (l:lista):integer;
var
    min:integer;
begin
    if (l <> nil) then begin
        min:= minimo(l^.sig);
        if (min > l^.datos) then begin
            min:= l^.datos;
        end;
        minimo:= min;
    end
    else
        minimo:= 999;
end;
procedure incisoB (l:lista);
begin
    writeln ('El numero es mas chico: ', minimo (l));
end;
//---------------------------- Inciso A --------------------------------
procedure incisoA (var l:lista);
var
    num:integer;
    nue:lista;
begin
    num:= random (100);
    if (num <> 0) then begin
        new (nue);
        nue^.datos:= num;
        nue^.sig:= l;
        l:= nue;
        incisoA(l^.sig);
    end;
end;
//----------------------------------------------------------------------
var
    l:lista;
begin
    randomize;
    l:= nil;
    writeln ('------------------> EJERCICIO 3 <------------------');
    //writeln ('-------------------> INCISO A <--------------------');
    incisoA (l);
    writeln ();
    writeln ('-------------------> INCISO B <--------------------');
    incisoB (l);
    writeln ();
    writeln ('-------------------> INCISO C <--------------------');
    incisoC (l);
    writeln ();
    writeln ('-------------------> INCISO D <--------------------');
    writeln ('----------> BUSCAR UN VALOR VERIFICAR <------------');
    incisoD (l);
end.