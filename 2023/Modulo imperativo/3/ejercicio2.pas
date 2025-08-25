{2. Escribir un programa que:
 a) Implemente un módulo que lea información de ventas de un comercio. De cada venta 
    se lee código de producto, fecha y cantidad de unidades vendidas. La lectura 
    finaliza con el código de producto 0. Un producto puede estar en más de una venta.
    Se pide:
    i) Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de
       producto.
    ii) Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado
        por código de producto. Cada nodo del árbol debe contener el código de producto 
        y la cantidad total de unidades vendida.
                    NOTA: EL MODULO DEBE RETORNAR LOS DOS ARBOLES.
 b) Implemente un módulo que reciba el árbol generado en i. y un código de producto y
    retorne la cantidad total de unidades vendidas de ese producto.
 c) Implemente un módulo que reciba el árbol generado en ii. y un código de producto y 
    retorne la cantidad total de unidades vendidas de ese producto.}

program ejercicio2;
type
    rangoDia = 1..31;
    rangoMes = 1..12;
    {Inciso a.i}
    venta = record
        cod:integer;
        dia:rangoDia;
        mes:rangoMes;
        cant:integer;
    end;
    arbol1 = ^nodo1;
    nodo1 = record
        datos:venta;
        hi:arbol1;
        hd:arbol1;
    end;

    {Inciso a.ii}
    vendido = record
        cod:integer;
        cantotal:integer;
    end;
    
    arbol2 = ^nodo2;
    nodo2 = record
        datos:vendido;
        hi:arbol2;
        hd:arbol2;
    end;
//-------------------------------------------------------------------------------------------------
//--------------------------------------> INCISO C <-----------------------------------------------
function buscarArbol2(a2: arbol2; num: integer): integer;
begin
    if (a2 = nil) then
        buscarArbol2 := 0
    else if (a2^.datos.cod = num) then
            buscarArbol2 := a2^.datos.cantotal
        else if (a2^.datos.cod < num) then
                buscarArbol2 := buscarArbol2(a2^.hd, num)
            else
                buscarArbol2 := buscarArbol2(a2^.hi, num);
end;
procedure incisoC (a2:arbol2);
var
    num:integer;
begin
    writeln ('> Busqueda de ventas ordenado por el codigo de producto (con total vendida):');
    write ('Ingrese el numero de codigo: '); readln (num);
    writeln ('La cantidad de productos vendidos del arbol 2 es ', buscarArbol2 (a2, num));
end;
//--------------------------------------> INCISO B <-----------------------------------------------
function buscarArbol1(a1: arbol1; num: integer): integer;
begin
    if (a1 = nil) then
        buscarArbol1 := 0 
    else if (a1^.datos.cod = num) then
            buscarArbol1 := a1^.datos.cant + buscarArbol1(a1^.hi, num)
        else if (a1^.datos.cod < num) then
                buscarArbol1 := buscarArbol1(a1^.hd, num)
            else
                buscarArbol1 := buscarArbol1(a1^.hi, num);
end;
procedure incisoB (a1:arbol1);
var
    num:integer;
begin
    writeln ('> Busqueda de ventas ordenado por el codigo de producto (sin total vendida):');
    write ('Ingrese el numero de codigo: '); readln (num);
    writeln ('La cantidad de productos vendidos del arbol 1 es ', buscarArbol1 (a1, num));
end;
//--------------------------------------> INCISO A <-----------------------------------------------
procedure imprimirArbol2 (a2:arbol2);
begin
    if (a2 <> nil) then begin
        writeln ('Codigo de producto: ', a2^.datos.cod);    
        writeln ('Cantidad de vendidas total: ', a2^.datos.cantotal);
        writeln ();
        imprimirArbol2(a2^.hi);
        imprimirArbol2(a2^.hd);
    end;
end;
procedure imprimirArbol1 (a1:arbol1);
begin
    if (a1 <> nil) then begin
        writeln ('Codigo de producto: ', a1^.datos.cod);    
        writeln ('Fecha: ', a1^.datos.dia,'/', a1^.datos.mes);
        writeln ('Cantidad de unidades vendidas: ', a1^.datos.cant);
        writeln ();
        imprimirArbol1(a1^.hi);
        imprimirArbol1(a1^.hd);
    end;
end;
procedure cargarArbol2 (var a2:arbol2; cod:integer; cant:integer);
begin
    if (a2 = nil) then begin
        new (a2);
        a2^.datos.cod:= cod;
        a2^.datos.cantotal:= cant;
        a2^.hi:= nil;
        a2^.hd:= nil;
    end
    else if (a2^.datos.cod = cod) then 
            a2^.datos.cantotal:= a2^.datos.cantotal + cant
        else if (cod < a2^.datos.cod) then
            cargarArbol2 (a2^.hi, cod, cant)
        else
            cargarArbol2(a2^.hd, cod, cant);
end;
procedure cargarArbol1 (var a1:arbol1; v:venta);
begin
    if (a1 = nil) then begin
        new (a1);
        a1^.datos:= v;
        a1^.hi:= nil;
        a1^.hd:= nil;
    end
    else if (a1^.datos.cod > v.cod) then
            cargarArbol1 (a1^.hi, v)
        else
            cargarArbol1 (a1^.hd, v);
end;
procedure leer (var v:venta);
begin
    writeln ('Ingrese el codigo:');
    readln (v.cod);
    if (v.cod <> 0) then begin
        v.dia:= random(31)+1;
        v.mes:= random(12)+1;
        writeln ('Ingrese la cantidad de unidades vendidas: ');
        readln (v.cant);
    end;
end;
procedure incisoA (var a1:arbol1; var a2:arbol2);
var
    v:venta;
begin
    leer (v);
    while (v.cod <> 0) do begin   
        cargarArbol1 (a1, v);
        cargarArbol2 (a2, v.cod, v.cant);
        writeln ('');
        leer (v);
    end;
end;
//-------------------------------------------------------------------------------------------------
var
    a1:arbol1;
    a2:arbol2;
begin
    randomize;
    a1:= nil;
    a2:= nil;
    writeln ('------------------> INFORMACION DE VENTAS DE UN COMERCIO <------------------');
    writeln ('> Datos:');
    incisoA (a1, a2); // Cargar los dos arboles
    writeln ('---------------------------> IMPRIMIR LOS DATOS <---------------------------');
    writeln ('> Arbol de venta:');
    imprimirArbol1 (a1);
    writeln ();
    writeln ('> Arbol de vendida:');
    imprimirArbol2 (a2);
    writeln ('----------------------------------------------------------------------------');
    incisoB (a1);// Buscar al codigo (Arbol 1)
    writeln();
    writeln ('----------------------------------------------------------------------------');
    incisoC(a2);
end.