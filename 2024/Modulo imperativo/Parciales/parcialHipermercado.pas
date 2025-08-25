{El hipermercado Carrefour necesita un sistema para obtener estadisticas sobre las compras realizadas por sus clientes.
 
 A) Implementar un modulo que lea informacion de todas las compras de 2023, los almacene y retorne una estructura
    de datos eficiente para la busqueda por codigo de cliente, donde para cada codigo de cliente se almacenen juntas
    todas sus compras. De cada compra se conoce: codigo de cliente, numero de factura, cantidad de productos y monto.
    La lectura finaliza con el codigo de cliente 0.
 
 B) Implementar un modulo que reciba la estructura generada en A), un codigo de cliente y retorne la cantidad de 
    compras y el monto total gastado por dicho cliente durante el 2023.
    
 C) Realizar un modulo que reciba la estructura generada en A) y dos numeros de factura X e Y, y retorne todas las
    ventas cuyo numero de factura estén entre X e Y (incluidos).}

program parcialHipermercado;
type
    compra1 = record
        codCliente:integer;
        nroFactura:integer;
        cantProducto:integer;
        monto:real;
    end;
    
    compra2 = record
        nroFactura:integer;
        cantProducto:integer;
        monto:real;
    end;

    lista = ^nodoL;
    nodoL = record
        dato:compra2;
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

//--------------------------> INCISO C <--------------------------
procedure imprimirNroFactura(l2:lista);
begin
    while (l2 <> nil) do begin
        writeln ('- Numero de factura: ',l2^.dato.nroFactura,', cantidad de producto: ', l2^.dato.cantProducto,' y monto: ', l2^.dato.monto:0:2);
        l2:= l2^.sig;
    end;
end;
procedure incisoC(a:arbol; minFac,maxFac:integer; var l2:lista);

    procedure agregarAdelanteFac(var l2:lista; c:compra2);
    var
        nue:lista;
    begin
        new(nue);
        nue^.dato:= c;
        nue^.sig:= l2;
        l2:= nue;
    end;
    procedure cargarListaNroFactura(l:lista; minFac,maxFac:integer; var l2:lista);
    begin
        while (l <> nil) do begin
            if (minFac <= l^.dato.nroFactura) then begin
                if (maxFac >= l^.dato.nroFactura) then
                    agregarAdelanteFac(l2,l^.dato);
            end;
            l:= l^.sig;
        end;
    end;

begin
    if (a <> nil) then begin
        incisoC(a^.hi,minFac,maxFac,l2);
        cargarListaNroFactura(a^.dato.l,minFac,maxFac,l2);
        incisoC(a^.hd,minFac,maxFac,l2);
    end;
end;
//--------------------------> INCISO B <--------------------------
procedure incisoB(a:arbol; cod:integer; var cantTotal:integer; var montototal:real);

    procedure sumandoCantMonto(l:lista; var cantTotal:integer; var montototal:real);
    begin
        while (l <> nil) do begin
            cantTotal:= cantTotal + l^.dato.cantProducto;
            montototal:= montototal + l^.dato.monto;
            l:= l^.sig;
        end;
    end;

begin
    if (a <> nil) then begin
        if (cod = a^.dato.codCliente) then 
            sumandoCantMonto(a^.dato.l, cantTotal, montototal)
        else if (cod < a^.dato.codCliente) then
                incisoB(a^.hi,cod,cantTotal,montototal)
            else
                incisoB(a^.hd,cod,cantTotal,montototal)
    end;
end;
//------------------------> TEST PRUEBA <-------------------------
procedure imprimirArbol(a:arbol);

    procedure imprimirLista(l:lista);
    begin
        while (l <> nil) do begin
            writeln ('- El nro de factura: ',l^.dato.nroFactura,', la cantidad de producto: ', l^.dato.cantProducto,' y monto: ', l^.dato.monto:0:2);
            l:= l^.sig;
        end;
    end;

begin
    if (a <> nil) then begin
        imprimirArbol(a^.hi);
        writeln ('> El codigo de cliente:',a^.dato.codCliente);
        writeln ('+ La lista de compras:');
        imprimirLista(a^.dato.l);
        writeln();
        imprimirArbol(a^.hd);
    end;
end;
//--------------------------> INCISO A <--------------------------
procedure incisoA (var a:arbol);

    procedure agregarAdelante(var l:lista; c2:compra2);
    var
        nue:lista;
    begin
        new(nue);
        nue^.dato:= c2;
        nue^.sig:= l;
        l:= nue;
    end;
    procedure armarDatos(c1:compra1; var c2:compra2);
    begin
        c2.nroFactura:= c1.nroFactura;
        c2.cantProducto:= c1.cantProducto;
        c2.monto:= c1.monto;
    end;
    procedure cargarArbol(var a:arbol; c1:compra1);
    var
        c2:compra2;
    begin
        if (a = nil) then begin
            new(a);
            a^.dato.codCliente:= c1.codCliente;
            armarDatos(c1,c2);
            a^.dato.l:= nil;
            agregarAdelante(a^.dato.l, c2);
            a^.hi:= nil;
            a^.hd:= nil;
        end
        else if (a^.dato.codCliente = c1.codCliente) then begin
                armarDatos(c1,c2);
                agregarAdelante(a^.dato.l, c2);
            end
            else if (a^.dato.codCliente > c1.codCliente) then
                    cargarArbol (a^.hi,c1)
                else
                    cargarArbol (a^.hd,c1)
    end;
    procedure leerRegistro(var c1:compra1);
    begin
        c1.codCliente:= random(100);
        if (c1.codCliente <> 0) then begin
            c1.nroFactura:= random (2000-1000)+1000;
            c1.cantProducto:= random(50)+1;
            c1.monto:= random(100)*1.5;
        end;
    end;

var
    c1:compra1;
begin
    leerRegistro(c1);
    while (c1.codCliente <> 0) do begin
        cargarArbol(a,c1);
        leerRegistro(c1);
    end;
end;
//----------------------------------------------------------------
var
    a:arbol;
    cod,cantTotal:integer;
    montototal:real;
    minFac,maxFac:integer;
    l2:lista;
begin
    a:= nil;
    randomize;
    incisoA(a);
    imprimirArbol(a);
    writeln(':::::::::: BUSCAR EL CODIGO DE CLIENTE ::::::::::');
    cantTotal:= 0; montototal:= 0;
    write ('> Ingrese el codigo de cliente: '); readln (cod);
    incisoB(a,cod,cantTotal,montototal);
    writeln ('> El codigo de cliente: ',cod,', la cantidad de producto total: ',cantTotal,' y el monto total: ',montototal:0:2);
    l2:= nil;
    write ('> Ingrese un numero de factura para minimo: '); readln (minFac);
    write ('> Ingrese un numero de factura para maximo: '); readln (maxFac);
    incisoC(a,minFac,maxFac,l2);
    writeln('> Informe los datos entre dos valores de nro de factura:');
    imprimirNroFactura(l2);
end.