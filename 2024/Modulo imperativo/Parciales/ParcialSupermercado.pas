{Se lee informacion de las compras realizadas por los clientes a un supermercado en el año 2022. De cada compra 
 se lee el codigo de cliente, numero de mes y monto gastado. La lectura finaliza cuando se lee el cliente con
 codigo 0.
 A) Realizar un modulo que lea la informacion de las compras y retorne una estructura de datos eficiente para la
    busqueda por codigo de cliente. Para cliente, esta estructura debe acumular el monto total gastado para cada
    mes del año 2022. Sugiere utilizar el modulo leerCompras().
 B) Realizar un modulo que reciba la estructura generada en la A) y un cliente, y retorne el mes con mayor gasto 
    de dicho cliente.
 C) Realizar un modulo que reciba la estructura generada en A) y un numero de mes, y retorne la cantidad de cliente
    clientes que no gastaron nada en dicho mes.}

program ParcialSupermercado;
type
    rangoMes = 1..12;

    compras = record
        mes:rangoMes;
        monto:real;
    end;

    listaCompras = ^nodoLista;
    nodoLista = record
        datos:compras;
        sig:listaCompras;
    end;

    cliente = record
        cod:integer;
        detalle:compras;
    end;

    arbolCliente = ^nodoArbol;
    nodoArbol = record
        datos:cliente;
        hi:arbolCliente;
        hd:arbolCliente;
    end;

    vectorMes = array [rangoMes] of listaCompras;
    vectorContadoMees = array [rangoMes] of integer;
//----------------------------------------------------------------------------
procedure agregarAdelante (var l:listaCompras; c:compras);
var
    nue:listaCompras;
begin
    new (nue);
    nue^.datos:= c;
    nue^.sig:= l;
    l:= nue;
end;
procedure agregarArbol (var a:arbolCliente; cod:integer; c:compras);
begin
    if (a = nil) then begin
        new (a);
        a^.datos.cod:= cod;
        a^.datos.detalle:= nil;
        agregarAdelante (a^.datos.detalle, c);
        a^.hi:= nil;
        a^.hd:= nil;
    end
    else if (a^.datos.cod >= cod) then
            agregarAdelante (a^.datos.detalle, c)
        else begin
            if (cod <= a^.datos.cod) then
                agregarArbol (a^.hi, cod, c)
            else
                agregarArbol (a^.hd, cod, c);
        end;
end;
procedure leerCompras (var c:compras);
begin
    writeln ('Ingrese el mes:');
    readln (c.mes);
    writeln ('Ingrese el monto:');
    readln (c.monto);
end;
procedure cargarArbol (var a:arbolCliente);
var
    cod:integer;
    c:compras;
begin
    writeln ('Ingrese el codigo de cliente:');
    readln (cod);
    while (cod <> 0) do begin
        leerCompras (c);
        agregarArbol (a, cod, c);
        writeln ();
        writeln ('Ingrese el codigo de cliente:');
        readln (cod);
    end;
end;
procedure inicializarVector (var v:vectorContadoMees);
var
    i:integer;
begin
    for i:= 1 to 12 do begin
        v[i]:= 0;
    end;
end;
//----------------------------------------------------------------------------
var
    a:arbolCliente;
    v:vectorContadoMees;
begin
    a:= nil;
    inicializarVector (v);
    cargarArbol (a);
end.