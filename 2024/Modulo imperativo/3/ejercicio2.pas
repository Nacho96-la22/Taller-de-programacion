{2. Escribir un programa que:
 a. Implemente un módulo que genere aleatoriamente información de ventas de un comercio.
    Para cada venta generar código de producto, fecha y cantidad de unidades vendidas. Finalizar
    con el código de producto 0. Un producto puede estar en más de una venta. Se pide:

    i.   Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de
         producto. Los códigos repetidos van a la derecha.
    ii.  Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
         código de producto. Cada nodo del árbol debe contener el código de producto y la
         cantidad total de unidades vendidas.
    iii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
         código de producto. Cada nodo del árbol debe contener el código de producto y la lista de
         las ventas realizadas del producto.
    
    Nota: El módulo debe retornar TRES árboles.

 b. Implemente un módulo que reciba el árbol generado en i. y una fecha y retorne la cantidad
    total de productos vendidos en la fecha recibida.
 c. Implemente un módulo que reciba el árbol generado en ii. y retorne el código de producto
    con mayor cantidad total de unidades vendidas.
 d. Implemente un módulo que reciba el árbol generado en iii. y retorne el código de producto
    con mayor cantidad de ventas.}

program ejercicio2;
type
    rangoDia = 1..31;
    rangoMes = 1..12;

    calendario = record
        dia:rangoDia;
        mes:rangoMes;
    end;

    // Inciso a.i
    venta = record
        cod:integer;
        fecha:calendario;
        cant:integer;
    end;

    arbol1 = ^nodo1;
    nodo1 = record
        datos:venta;
        hi:arbol1;
        hd:arbol1;
    end;

    // Inciso a.ii
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

    // Inciso a.iii
    ventaL = record
        fecha:calendario;
        cant:integer;
    end;

    lista = ^nodoL;
    nodoL = record
        datos:ventaL;
        sig:lista;
    end;

    ventaA3 = record
        cod:integer;
        l:lista; 
    end;

    arbol3 = ^nodo3;
    nodo3 = record
        datos:ventaA3;
        hi:arbol3;
        hd:arbol3;
    end;

//------------------------------- [ INCISO D ] -------------------------------
procedure buscarCodigoMayorCantidadA3 (a3:arbol3; var codMax3:integer; var cantMax3:integer);

    function calculoListas(l:lista):integer;
    var
        total:integer;
    begin
        total:= 0;
        while (l <> nil) do begin
            total:= total + 1;            
            l:= l^.sig
        end;
        calculoListas:= total;
    end;

var
    actual:integer;
begin
    if (a3 <> nil) then begin
        actual:= calculoListas(a3^.datos.l);
        if (cantMax3 < actual) then begin
            codMax3:= a3^.datos.cod;
            cantMax3:= actual;
        end;
        buscarCodigoMayorCantidadA3(a3^.hi,codMax3,cantMax3);
        buscarCodigoMayorCantidadA3(a3^.hd,codMax3,cantMax3);
    end;
end;
//------------------------------- [ INCISO C ] -------------------------------
procedure buscarCodigoMayorCantidadA2 (a2:arbol2; var codMax2:integer; var cantMax2:integer);
begin
    if (a2 <> nil) then begin
        if (cantMax2 < a2^.datos.cantotal) then begin
            codMax2:= a2^.datos.cod;
            cantMax2:= a2^.datos.cantotal;
        end;
        buscarCodigoMayorCantidadA2(a2^.hi,codMax2,cantMax2);
        buscarCodigoMayorCantidadA2(a2^.hd,codMax2,cantMax2);
    end;
end;
//------------------------------- [ INCISO B ] -------------------------------
procedure incisoB(a1:arbol1);

    function totalFecha(dia:rangoDia; mes:rangoMes; a1:arbol1):integer;
    begin
        if (a1 = nil) then
            totalFecha:= 0
        else if (dia = a1^.datos.fecha.dia) and (mes = a1^.datos.fecha.mes) then
                totalFecha:= a1^.datos.cant + totalFecha(dia, mes, a1^.hi) + totalFecha(dia,mes, a1^.hd)
            else
                totalFecha:= totalFecha(dia, mes, a1^.hi) + totalFecha(dia,mes, a1^.hd);
    end;

var
    f:calendario;
begin
    write ('> Ingrese el dia: '); readln(f.dia);
    write ('> Ingrese el mes: '); readln(f.mes);
    writeln ('La cantidad total es ', totalFecha(f.dia, f.mes,a1));
end;
//--------------------------------------------------------------
procedure imprimirA3(a3:arbol3);

    procedure imprimirListas(l:lista);
    begin
        if (l <> nil) then begin
            writeln ('Fecha: ',l^.datos.fecha.dia, '/', l^.datos.fecha.mes);
            writeln ('Cantidad de unidades vendidas: ', l^.datos.cant);
            writeln();
            imprimirListas(l^.sig);
        end;
    end;

begin
    if (a3 <> nil) then begin
        imprimirA3(a3^.hi);
        writeln('---------------> INFORME EL CODIGO <--------------');
        writeln('Codigo de producto: ', a3^.datos.cod);
        writeln('> INFORME LAS LISTAS:');
        imprimirListas(a3^.datos.l);
        imprimirA3(a3^.hd);
    end;
end;
procedure imprimirA2(a2:arbol2);
begin
    if (a2 <> nil) then begin
        imprimirA2(a2^.hi);
        writeln('Codigo de producto: ', a2^.datos.cod);
        writeln('Cantidad total de unidades vendidas: ', a2^.datos.cantotal);
        writeln('------------------------------------------------------------');
        imprimirA2(a2^.hd);
    end;
end;
procedure imprimirA1(a1:arbol1);
begin
    if (a1 <> nil) then begin
        imprimirA1(a1^.hi);
        writeln('Codigo del producto: ', a1^.datos.cod);
        writeln('Fecha: ',a1^.datos.fecha.dia,'/',a1^.datos.fecha.mes);
        writeln('Cantidad de unidad vendidas: ', a1^.datos.cant);
        writeln('------------------------------------------------------------');
        imprimirA1(a1^.hd);
    end;
end;
//------------------------------- [ INCISO A ] -------------------------------
procedure incisoA (var a1:arbol1; var a2:arbol2; var a3:arbol3); 

    procedure agregarAdelante (var l:lista; fecha:calendario; cant:integer);
    var
        nue:lista;
    begin
        new(nue);
        nue^.datos.fecha:= fecha;
        nue^.datos.cant:= cant;
        nue^.sig:= l;
        l:= nue;
    end;
    procedure cargarArbol3 (var a3:arbol3; v:venta);
    begin
        if (a3 = nil) then begin
            new (a3);
            a3^.datos.cod:= v.cod;
            a3^.datos.l:= nil;
            agregarAdelante(a3^.datos.l, v.fecha,v.cant);
            a3^.hi:= nil;
            a3^.hd:= nil;
        end
        else if (a3^.datos.cod = v.cod) then 
                agregarAdelante(a3^.datos.l, v.fecha,v.cant)
            else if (v.cod < a2^.datos.cod) then
                cargarArbol3 (a3^.hi,v)
            else
                cargarArbol3(a3^.hd,v);
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
        else if (a1^.datos.cod <= v.cod) then // <<-- El código repetido van a la derecha.
                cargarArbol1 (a1^.hd, v)
            else
                cargarArbol1 (a1^.hi, v);
    end;
    procedure leer (var v:venta);
    begin
        v.cod:= random (100);
        if (v.cod <> 0) then begin
            v.fecha.dia:= random(31)+1;
            v.fecha.mes:= random(12)+1;
            v.cant:= random(100);
        end;
    end;

var
    v:venta;
begin
    leer(v);
    while (v.cod <> 0) do begin
        cargarArbol1(a1,v);
        cargarArbol2(a2,v.cod,v.cant);
        cargarArbol3(a3,v);
        leer(v);
    end;
end;
//--------------------------------------------------------------
var
    a1:arbol1;
    a2:arbol2;
    a3:arbol3;
    codMax2, cantMax2:integer;
    codMax3, cantMax3:integer;
begin
    a1:= nil;
    a2:= nil;
    a3:= nil;
    codMax2:= 0; cantMax2:= -1;
    codMax3:= 0; cantMax3:= -1;
    randomize;
    incisoA(a1,a2,a3);
    // abajo es prueba para ver si funciona bien porque no me pide en el enunciado
    writeln('-------------------> INFORME ARBOL 1 <----------------------');
    imprimirA1(a1);
    writeln('-------------------> INFORME ARBOL 2 <----------------------');
    imprimirA2(a2);
    writeln('-------------------> INFORME ARBOL 3 <----------------------');
    imprimirA3(a3);
    writeln('--------> BUSCAR LA CANTIDAD TOTAL EN UNA FECHA <-----------');
    incisoB(a1);
    writeln ('---------> BUSCAR UN CODIGO CON MAYOR CANTIDAD <------------');
    buscarCodigoMayorCantidadA2(a2,codMax2, cantMax2);
    writeln ('> Arbol 2:');
    writeln ('- Este codigo con mayor cantidad total de unidades vendidas: ',codMax2);
    buscarCodigoMayorCantidadA3(a3,codMax3, cantMax3);
    writeln ('> Arbol 3:');
    writeln ('- Este codigo con mayor cantidad de ventas: ',codMax3); 
end.