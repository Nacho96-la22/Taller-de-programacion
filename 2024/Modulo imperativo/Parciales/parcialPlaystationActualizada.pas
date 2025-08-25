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

program parcialPlaystationActualizada;
type
    rangoDia = 1..31;
    rangoMes = 1..12;

    compra = record
        codVideojuego:integer;
        dia:rangoDia;
        mes:rangoMes;
    end;

    listaJuegos = ^nodo1;
    nodo1 = record
        datos:compra;
        sig:listaJuegos;
    end;

    cliente = record
        codCliente:integer;
        detalle:listaJuegos;
    end;

    arbolCliente = ^nodo2;
    nodo2 = record
        datos:cliente;
        hi:arbolCliente;
        hd:arbolCliente;
    end;

    vectorMes = array [rangoMes] of integer;
//---------------------------------------------------------------------
procedure imprimirVectorActualizada (v:vectorMes);
var
    i:integer;
begin
    writeln ('-----> ACTUALIZA ORDENADA POR LA CANTIDAD MAYOR A MENOR <-----');
    for i:= 1 to 12 do begin
        writeln ('> ', v[i]);
    end;
end;
procedure ordenadaVector (var v:vectorMes);
var
    i, pos:integer;
    actual:integer;
begin
    for i:= 2 to 12 do begin
        actual:= v[i];
        pos:= i - 1;
        while (pos > 0) and (v[pos] < actual) do begin
            v[pos+1]:= v[pos];
            pos:= pos - 1;
        end;
        v[pos+1]:= actual;
    end;
end;
//---------------------------------------------------------------------
procedure recorrerLista2 (l:listaJuegos);
begin
    while (l <> nil) do begin
        writeln ('> El codigo de videojuegos: ', l^.datos.codVideojuego);
        writeln ('- La fecha: ', l^.datos.dia,'/', l^.datos.mes);
        writeln ();
        l:= l^.sig;
    end;
end;
procedure buscarCodigoCliente (a:arbolCliente; cod:integer);
begin
    if (a <> nil) then begin
        if (cod = a^.datos.codCliente) then begin
            recorrerLista2 (a^.datos.detalle);
        end
        else if (cod < a^.datos.codCliente) then
            buscarCodigoCliente (a^.hd, cod)
        else
            buscarCodigoCliente(a^.hd, cod);
    end
    else
        writeln ('No ha encontrado este codigo de cliente.');
end;
procedure incisoB (a:arbolCliente);
var 
    buscarCod:integer;
begin
    writeln ('Ingrese un codigo de cliente:');
    readln (buscarCod);
    writeln ();
    buscarCodigoCliente (a, buscarCod);
end;
//---------------------------------------------------------------------
procedure imprimirVector (v:vectorMes);
var
    i:integer;
begin
    for i:= 1 to 12 do begin
        writeln ('> ', i, ' mes, la cantidad es ', v[i]);
    end;
end;
procedure recorrerLista1 (l:listaJuegos);
begin
    while (l <> nil) do begin
        writeln ('- El codigo de videojuegos: ', l^.datos.codVideojuego);
        writeln ('- La fecha: ', l^.datos.dia,'/', l^.datos.mes);
        writeln ();
        l:= l^.sig;
    end;
end;
procedure imprimirArbol (a:arbolCliente);
begin
    if (a <> nil) then begin
        writeln ('> El codigo de cliente: ', a^.datos.codCliente);
        recorrerLista1 (a^.datos.detalle);
        writeln ('------------------------------');
        imprimirArbol (a^.hi);
        imprimirArbol (a^.hd);
    end;
end;
//---------------------------------------------------------------------
procedure agregarAdelante (var l:listaJuegos; cv:compra);// LISTA
var
    nue:listaJuegos;
begin
    new (nue);
    nue^.datos:= cv;
    nue^.sig:= l;
    l:= nue;
end;
procedure agregarArbol (var a:arbolCliente; cv:compra; cod:integer);// ARBOL
begin
    if (a = nil) then begin
        new (a);
        a^.datos.codCliente:= cod;
        a^.datos.detalle:= nil;
        a^.hi:= nil;
        a^.hd:= nil;
        agregarAdelante (a^.datos.detalle, cv);
    end
    else if (a^.datos.codCliente = cod) then
             agregarAdelante (a^.datos.detalle, cv)
        else begin
            if (a^.datos.codCliente >= cod) then
                agregarArbol(a^.hi, cv, cod)
            else
                agregarArbol (a^.hd, cv, cod);
        end;
end;
procedure leer (var c:compra);
begin
    writeln ('Ingrese el codigo de videojuegos:');
    readln (c.codVideojuego);
    //writeln ('Fecha:');
    c.dia:= random(31)+1;
    c.mes:= random(12)+1;
end;
procedure cargarCompras (var a:arbolCliente; var v:vectorMes);
var
    cod:integer; //lea un codigo de cliente
    c:compra;// compra de videojuegos
begin
    writeln ('Ingrese el codigo de cliente:');
    readln (cod);
    while (cod <> 0) do begin
        leer (c);// compras
        agregarArbol (a, c, cod);
        v[c.mes]:= v[c.mes] + 1;
        writeln ();
        writeln ('Ingrese el codigo de cliente:');
        readln (cod);
    end;
end;
procedure inicializarVector (var v:vectorMes);
var
    i:integer;
begin
    for i:= 1 to 12 do begin
        v[i]:= 0;
    end;
end;
//---------------------------------------------------------------------
var
    a:arbolCliente;
    v:vectorMes;
begin
    randomize;
    a:= nil;
    inicializarVector (v);
    writeln ('----------------> INFORMACION DE COMPRAS <--------------------');
    cargarCompras(a, v);
    writeln ('--------------------------------------------------------------');
    writeln ('Datos de clientes:');
    imprimirArbol (a);
    writeln ('--------------------------------------------------------------');
    writeln ('Datos la cantidad de mes:');
    imprimirVector (v);
    writeln ('--------------------------------------------------------------');
    writeln ('Mostrar un codigo de cliente que ha realizado las compras:');
    incisoB (a);
    writeln ('--------------------------------------------------------------');
    ordenadaVector (v);
    imprimirVectorActualizada (v);
end.