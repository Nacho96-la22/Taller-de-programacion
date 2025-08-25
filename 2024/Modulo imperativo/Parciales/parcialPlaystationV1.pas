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

NOTA: Implementar el programa principal, que invoque a los incisos A, B y C.}

program parcialPlaystationV1;
type
    rangoDia = 1..31;
    rangoMes = 1..12;
    
    calendario = record
        dia:rangoDia;
        mes:rangoMes;
    end;

    compra = record
        codCliente:integer;
        codVideojuego:integer;
        fecha:calendario;
    end;

    lista = ^nodoL;
    nodoL = record
        dato:compra;
        sig:lista;
    end;

    arbol = ^nodoA;
    nodoA = record
        dato:compra;
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
procedure imprimirLista (l:lista);
begin
    while (l <> nil) do begin
        writeln ('- El codigo de videojuego: ',l^.dato.codVideojuego,', fecha: ',l^.dato.fecha.dia,'/',l^.dato.fecha.mes);
        l:= l^.sig;
    end;
end;
procedure incisoB(a:arbol; cod:integer; var l:lista);

    procedure agregarAdelante (var l:lista; c:compra);
    var
        nue:lista;
    begin
        new(nue);
        nue^.dato:= c;
        nue^.sig:= l;
        l:= nue;
    end;

begin
    if (a <> nil) then begin
        if (cod = a^.dato.codCliente) then
            agregarAdelante(l,a^.dato);
        if (cod < a^.dato.codCliente) then
            incisoB(a^.hi,cod,l)
        else
            incisoB(a^.hd,cod,l);
    end;
end;
//------------------------> TEST PRUEBA <-------------------------
procedure imprimirA(a:arbol);
begin
    if (a <> nil) then begin
        imprimirA(a^.hi);
        writeln ('> El codigo de cliente: ',a^.dato.codCliente);
        writeln ('- El codigo de videojuegos: ',a^.dato.codVideojuego,', fecha: ',a^.dato.fecha.dia,'/',a^.dato.fecha.mes);
        writeln ('*******************************************');
        imprimirA(a^.hd);
    end;
end;
//--------------------------> INCISO A <--------------------------
procedure incisoA (var a:arbol; var v:vectorMes);

    procedure cargarArbol(var a:arbol; c:compra);
    begin
        if (a = nil) then begin
            new(a);
            a^.dato:= c;
            a^.hi:= nil;
            a^.hd:= nil;
        end
        else if (a^.dato.codCliente > c.codCliente) then
                cargarArbol(a^.hi,c)
            else
                cargarArbol(a^.hd,c)

    end;
    procedure leerCompras(var c:compra);
    begin
        c.codCliente:= random(100);
        if (c.codCliente <> 0) then begin
            c.codVideojuego:= random(2000-1000)+1000;
            c.fecha.dia:= random(31)+1;
            c.fecha.mes:= random(12)+1;
        end;
    end;

var
    c:compra;
begin
    leerCompras(c);
    while (c.codCliente <> 0) do begin
        v[c.fecha.mes]:= v[c.fecha.mes] + 1;
        cargarArbol(a,c);
        leerCompras(c);
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
    l:lista;
begin
    a:= nil;
    randomize;
    inicializarVector(v);
    incisoA(a,v);
    imprimirA(a); // Es una prueba xq no pide en enunciado
    writeln ('---------------> INCISO B <----------------');
    l:= nil;
    write ('> Ingrese el codigo de cliente: '); readln(cod);
    incisoB(a,cod,l);
    writeln ('> Informa la lista de videojuegos:');
    imprimirLista(l);
    writeln ('---------------> INCISO C <----------------');
    writeln ('> Vector de mes desordenado:');
    imprimirV(v); // Es una prueba xq no pide en enunciado
    writeln();
    writeln ('> Vector de mes ordenado:');
    incisoC(v);
    imprimirV(v);
end.