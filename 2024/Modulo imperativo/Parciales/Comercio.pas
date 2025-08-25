{Un comercio necesita el procesamiento de las compras realizadas por sus clientes durante el mes de julio de 2022.
 De cada compra se conoce el codigo del cliente, dia, cantidad de productos y monto pagado.
 
 a) Implementar un modulo que lea compras, genere y retorne una estructura adecuada para la busqueda por codigo del
    cliente, donde para cada codigo de cliente se almacenan juntas todas sus compras (dia, cantidad de productos y 
    monto) que realizo. La lectura finaliza con cantidad de productos 0. Se sugiere utilizar el modulo leerRegistro().
 b) Implementar un modulo que reciba la estructura generada en a) y un codigo de cliente y retorne todas las compras 
    de dicho cliente.
 c) Realizar un modulo recursivo que reciba la estructura que retorna el inciso b) y retorne el monto de la compra con
    mayor cantidad de productos.
    
 NOTA: Implementar el programa principal, que invoque a los incisos a, b y c.}

program comercio;
type 
    rangoDia = 1..31;

    compra1 = record
        cod:integer;
        dia:rangoDia;
        cantP:integer;
        monto:real;
    end;

    compra2 = record 
        dia:rangoDia;
        cantP:integer;
        monto:real;
    end;

    lista = ^nodoL;
    nodoL = record
        datos:compra2;
        sig:lista;
    end;

    cliente = record
        cod:integer;
        compra:lista;
    end;

    arbol = ^nodoA;
    nodoA = record
        datos:cliente;
        hi:arbol;
        hd:arbol;
    end;

//--------------------------> INCISO C <--------------------------------------
procedure incisoC (var montoMax:real; var cantMax:integer; l:lista);
begin
    if (l <> nil) then begin
        if (cantMax < l^.datos.cantP) then begin
            cantMax:= l^.datos.cantP;
            montoMax:= l^.datos.monto;
        end;
        incisoC(montoMax, cantMax, l^.sig);
    end;
end;
//--------------------------> INCISO B <--------------------------------------
procedure retornaLista (l:lista);
begin
    if (l <> nil) then begin
        writeln ('- El dia: ', l^.datos.dia);
        writeln ('- La cantidad de producto: ', l^.datos.cantP);
        writeln ('- El monto: ', l^.datos.monto:4:2);
        writeln ();
        retornaLista (l^.sig);
    end;
end;
procedure incisoB (a:arbol; cod:integer; var data:lista);
begin
    if (a <> nil) then begin
        if (a^.datos.cod = cod) then begin
            writeln ('***** Existe este codigo *****');
            data:= a^.datos.compra;
        end
        else if (a^.datos.cod > cod) then
                incisoB(a^.hi, cod,data)
            else
                incisoB(a^.hd, cod, data);
    end
    else
        writeln ('***** No existe este codigo *****');
end;
//--------------------------> INCISO A <--------------------------------------
procedure imprimirCompras (a:arbol);

    procedure imprimirLista(l:lista);
    begin
        while (l <> nil) do begin
            writeln ('- El dia: ', l^.datos.dia);
            writeln ('- La cantidad de productos: ', l^.datos.cantP);
            writeln ('- El monto: ', l^.datos.monto:4:2);
            writeln ();
            l:= l^.sig;
        end;
    end;

begin
    if (a <> nil) then begin
        imprimirCompras(a^.hi);
        writeln ('> El codigo del cliente: ', a^.datos.cod);
        writeln ('> Informacion de compras:');
        imprimirLista(a^.datos.compra);
        writeln('----------------------------');
        imprimirCompras(a^.hd);
    end;
end;
procedure incisoA (var a:arbol); 

    procedure cargarLista(var l:lista; c1:compra1);
    var
        nue:lista;
    begin
        new (nue);
        nue^.datos.dia:= c1.dia;
        nue^.datos.cantP:= c1.cantP;
        nue^.datos.monto:= c1.monto;
        nue^.sig:= l;
        l:= nue;
    end;
    procedure cargarArbol (var a:arbol; c1:compra1);
    begin
        if (a = nil) then begin    
            new(a);
            a^.datos.cod:= c1.cod;
            a^.datos.compra:= nil;
            a^.hi:= nil;
            a^.hd:= nil;
            cargarLista(a^.datos.compra, c1);
        end
        else if (a^.datos.cod = c1.cod) then
                cargarLista(a^.datos.compra, c1)
            else if (a^.datos.cod > c1.cod) then 
                    cargarArbol(a^.hi, c1)
                else
                    cargarArbol(a^.hd, c1);
    end;

    procedure leerCompra(var c1:compra1);
    begin
        {writeln ('> Ingrese la cantidad de producto:');
        readln(c1.cantP);}
        c1.cantP:= random(50);
        if (c1.cantP <> 0) then begin
            c1.monto:= random(100)+1;
            c1.cod:= random(10)+1;
            c1.dia:= random(31)+1;
        end;    
    end;

var
    c1:compra1;
begin
    leerCompra(c1);
    while (c1.cantP <> 0) do begin
        cargarArbol(a,c1);
        leerCompra(c1);
    end;
end;
//----------------------------------------------------------------------------
var
    a:arbol;
    num, cantMax:integer;
    montoMax:real;
    data:lista;
begin
    randomize;
    a:= nil;
    writeln('------------------> INFORMACION DE COMPRAS <------------------');
    incisoA(a);
    writeln ();
    writeln('--------------------> IMPRIMIR DE COMPRAS <-------------------');
    imprimirCompras(a);
    writeln('---------------------> BUSCAR LA CLIENTE <--------------------');
    data:= nil;
    write ('> Ingrese un codigo del cliente: ');
    readln (num);
    incisoB(a, num, data);
    retornaLista(data);
    writeln('--> BUSCAR EL MONTO DE LA COMPRA CON MAYOR LA CANTIDAD DE PRODUCTOS <--');
    cantMax:= -1;
    montoMax:= -1;
    incisoC(montoMax, cantMax, data);
    writeln ('El monto de la compra con mayor cantidad de productos es: ', montoMax:4:2);
end.