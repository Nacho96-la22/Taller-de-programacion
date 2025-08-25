{Playstation Store requiere procesar las compras realizadas por sus clientes durante el año 2022.

A) Implementar un modulo que lea compras de videojuegos. De cada compra se lee codigo del videojuego, codigo de
   cliente, dia y mes. La lectura finaliza con el codigo de cliente 0. Se sugiere utilizar el modulo leerCompras().
   Se deben retornar 2 estructuras de datos:
   i. Una estructura eficiente para la busqueda por codigo de cliente.
   ii. Otra estructura que almacena la cantidad de compras realizadas en cada mes.
B) Implementar un modulo que reciba la estructura generada en A.i, un codigo de cliente, retorne todas las compras
   que realizo dicho cliente.
C) Implementar un modulo que reciba la estructura generada en A.ii y retorne la misma estructura ordenada por cantidad 
   de mayor a menor.

NOTA: Implementar el programa principal, que invoque a los incisos A, B y C.

PD: Para mi, es mejor lo q hago el arbol de lista porque si repite el codigo de cliente y almacena todas compras
    pero me enteré que dicen que es el arbol de registro por debe respetar el enunciado entonces lo hago la V1.}

program parcialPlaystationV2;
type
    rangoDia = 1..31;
    rangoMes = 1..12;
    
    calendario = record
        dia:rangoDia;
        mes:rangoMes;
    end;

    compra = record
        codVideojuego:integer;
        fecha:calendario;
    end;

    lista = ^nodoL;
    nodoL = record
        dato:compra;
        sig:lista;
    end;

    cliente = record
        codCliente:integer;
        l:lista;
    end;

    arbol = ^nodoA;
    nodoA = record
        dato:cliente;
        hi:arbol;
        hd:arbol;
    end;

    vectorMes = array [rangoMes] of integer;

//--------------------------> INCISO C <--------------------------
procedure incisoC (var v:vectorMes);
var
    i,j,pos,actual:integer;
begin
    for i:= 1 to 12 do begin
        pos:= i;
        for j:= i+1 to 12 do 
            if (v[j] > v[pos]) then
                pos:= j;
        actual:= v[pos];
        v[pos]:= v[i];
        v[i]:= actual;
    end;
end;
procedure imprimirV(v:vectorMes);
var
    i:integer;
begin
    for i:= 1 to 12 do begin
        writeln (i,' mes, la cantidad de compras realizado: ',v[i]);
    end;
end;
//--------------------------> INCISO B <--------------------------
procedure incisoB(a:arbol; cod:integer);
    
    procedure imprimirL(l:lista);
    begin
        writeln ('> Informe las compradas realizadas del cliente:');
        while (l <> nil) do begin
            writeln ('+> El codigo del videojuego: ',l^.dato.codVideojuego,', fecha: ', l^.dato.fecha.dia,'/',l^.dato.fecha.mes);
            writeln ();
            l:= l^.sig;
        end;    
    end;

begin
    if (a <> nil) then begin
        if (cod = a^.dato.codCliente) then begin
            writeln ('  *** Existe este codigo ***');
            imprimirL(a^.dato.l)
        end
        else if (cod < a^.dato.codCliente) then
                incisoB(a^.hi,cod)
            else
                incisoB(a^.hd,cod);
    end
    else
        writeln ('  *** No existe este codigo ***');
end;
//------------------------> TEST PRUEBA <-------------------------
procedure imprimirA(a:arbol);

    procedure imprimirLista(l:lista);
    begin
        while (l <> nil) do begin
            writeln ('+> El codigo del videojuego: ',l^.dato.codVideojuego,', fecha: ', l^.dato.fecha.dia,'/',l^.dato.fecha.mes);
            writeln ();
            l:= l^.sig;
        end;
    end;

begin
    if (a <> nil) then begin
        imprimirA(a^.hi);
        writeln ('> El codigo de cliente: ',a^.dato.codCliente);
        imprimirLista(a^.dato.l);
        writeln ('*******************************************');
        imprimirA(a^.hd);
    end;
end;
//--------------------------> INCISO A <--------------------------
procedure incisoA (var a:arbol; var v:vectorMes);

    procedure agregarAdelante(var l:lista; cv:compra);
    var 
        nue:lista;
    begin
        new(nue);
        nue^.dato:= cv;
        nue^.sig:= l;
        l:= nue;
    end;
    procedure cargarArbol(var a:arbol; c:cliente; cv:compra);
    begin
        if (a = nil) then begin
            new(a);
            a^.dato.codCliente:= c.codCliente;
            a^.dato.l:= nil;
            agregarAdelante(a^.dato.l, cv);
            a^.hi:= nil;
            a^.hd:= nil;
        end
        else if (c.codCliente = a^.dato.codCliente) then
                agregarAdelante(a^.dato.l, cv)
            else if (a^.dato.codCliente > c.codCliente) then
                    cargarArbol(a^.hi,c,cv)
                else
                    cargarArbol(a^.hd,c,cv)

    end;
    procedure leerCompras(var c:cliente; var cv:compra);
    begin
        c.codCliente:= random(100);
        if (c.codCliente <> 0) then begin
            cv.codVideojuego:= random(2000-1000)+1000;
            cv.fecha.dia:= random(31)+1;
            cv.fecha.mes:= random(12)+1;
        end;
    end;

var
    c:cliente;
    cv:compra;
begin
    leerCompras(c,cv);
    while (c.codCliente <> 0) do begin
        v[cv.fecha.mes]:= v[cv.fecha.mes] + 1;
        cargarArbol(a,c,cv);
        leerCompras(c,cv);
    end;
end;
procedure inicializarVector (var v:vectorMes);
var
    i:integer;
begin
    for i:= 1 to 12 do
        v[i]:= 0
end;
//----------------------------------------------------------------
var
    a:arbol;
    v:vectorMes;
    cod:integer;
begin
    a:= nil;
    randomize;
    inicializarVector(v);
    incisoA(a,v);
    imprimirA(a); // Es una prueba xq no pide en enunciado
    write ('> Ingrese el codigo de cliente: '); readln(cod);
    incisoB(a,cod);
    writeln ('*******************************************');
    writeln ('> Vector de mes desordenado:');
    imprimirV(v); // Es una prueba xq no pide en enunciado
    writeln();
    writeln ('> Vector de mes ordenado:');
    incisoC(v);
    imprimirV(v);
end.