{Una casa de comidas para llevar necesita el procesamiento de los pedidos de combos realizados por los
 clientes durante agosto de 2022. De cada pedido se conoce el numero del cliente, dia, cantidad de combos
 y monto pagado.
 
 a) Implementar un modulo que lea pedidos, genere y retorne una estructura adecuada para busqueda por
    numero de cliente, donde para cada numero de cliente se almacenen juntos todos sus pedidos (dia, cantidad
    de combos y monto) que realizo. La lectura finaliza con cliente 0.
 b) Implementar un modulo que reciba la estructura generada en a) y un numero de cliente, y retorne todos los
    pedidos que realizo dicho cliente.
 c) Realice un modulo recursivo que reciba la informacion retornada en el inciso b) y retorne el monto total
    abonado por el cliente.
    
 NOTA: Implementar el programa principal, que invoque a los incisos a, b y c.}


program UnaCasaComida;
type
    rangoDia = 1..31;

    pedido1 = record
        nroCliente:integer;
        dia:rangoDia;
        cantCombo:integer;
        monto:real;
    end;

    pedido2 = record 
        dia:rangoDia;
        cantCombo:integer;
        monto:real;
    end;

    lista = ^nodoL;
    nodoL = record
        datos:pedido2;
        sig:lista;
    end;

    cliente = record
        nroCliente:integer;
        l:lista;
    end;

    arbol = ^nodoA;
    nodoA = record
        datos:cliente;
        hi:arbol;
        hd:arbol;
    end;    

//--------------------------> INCISO C <--------------------------
function incisoC (l:lista):real;
begin    
    if (l = nil) then
        incisoC:= 0
    else
        incisoC:= incisoC(l^.sig) + l^.datos.monto;
end;
//--------------------------> INCISO B <--------------------------------------
procedure informarCliente(l:lista);
begin
    while (l <> nil) do begin
        writeln ('- El dia: ', l^.datos.dia);
        writeln ('- La cantidad de combo: ', l^.datos.cantCombo);
        writeln ('- El monto: ', l^.datos.monto:4:2);
        writeln();
        l:= l^.sig;
    end;
end;
procedure incisoB (a:arbol; nro:integer; var l:lista);
begin
    if(a = nil) then begin
        writeln ('*** No existe este cliente ***');
    end
    else if (nro = a^.datos.nroCliente) then begin
            writeln('*** Existe este cliente ***');
            writeln('+> Los listados comprados:');
            l:= a^.datos.l;
        end
        else if (nro < a^.datos.nroCliente) then
                incisoB(a^.hi, nro, l)
            else
                incisoB (a^.hd, nro, l);
end;
//--------------------------> INCISO A <--------------------------------------
procedure imprimirCliente (a:arbol);

    procedure imprimirLista(l:lista);
    begin
        while (l <> nil) do begin
            writeln ('- El dia: ', l^.datos.dia);
            writeln ('- La cantidad de combo: ', l^.datos.cantCombo);
            writeln ('- El monto: ', l^.datos.monto:4:2);
            writeln();
            l:= l^.sig;
        end;
    end;
    
begin
    if (a <> nil) then begin
        imprimirCliente(a^.hi);
        writeln ('> Nro de cliente: ', a^.datos.nroCliente);
        writeln ('+> Los listados de compras:');
        imprimirLista(a^.datos.l);
        writeln();
        imprimirCliente(a^.hd);
    end;
end;
procedure incisoA(var a:arbol);

    procedure cargarLista(var l:lista; p1:pedido1);
    var
        nue:lista;
    begin
        new(nue);
        nue^.datos.dia:= p1.dia;
        nue^.datos.cantCombo:= p1.cantCombo;
        nue^.datos.monto:= p1.monto;
        nue^.sig:= l;
        l:= nue;
    end;
    procedure cargarArbol(var a:arbol; p1:pedido1);
    begin
        if(a = nil) then begin
            new(a);
            a^.datos.nroCliente:= p1.nroCliente;
            a^.datos.l:= nil;
            a^.hi:= nil;
            a^.hd:= nil;
            cargarLista(a^.datos.l, p1);
        end
        else if (a^.datos.nroCliente = p1.nroCliente) then 
                cargarLista(a^.datos.l, p1)
            else if (a^.datos.nroCliente > p1.nroCliente) then
                    cargarArbol(a^.hi, p1)
                else
                    cargarArbol(a^.hd, p1);
    end;
    procedure leerPedido(var p1:pedido1);
    begin
        writeln('> Ingrese el nro de cliente:');
        readln(p1.nroCliente);
        if (p1.nroCliente <> 0) then begin
            p1.dia:= random(31)+1;
            p1.cantCombo:= random(10)+1;
            p1.monto:= random(100)*1.5;
        end;
    end;

var
    p1:pedido1;
begin
    leerPedido(p1);
    while (p1.nroCliente <> 0) do begin
        cargarArbol(a,p1);
        writeln ('---------------------------');
        leerPedido(p1);
    end;
end;
//----------------------------------------------------------------------------
var
    a:arbol;
    num:integer;
    l:lista;
begin
    randomize;
    a:= nil;
    writeln('------------------> INFORMACION DE CLIENTES <-------------------');
    incisoA(a);
    writeln('--------------------> IMPRIMIR LOS CLIENTES <-------------------');
    imprimirCliente(a);
    writeln('------------------> BUSCAR EL NRO DE CLIENTE <------------------');
    l:= nil;
    write('> Ingrese el nro de cliente: '); readln(num);
    incisoB(a, num, l);
    informarCliente(l);
    writeln ('> El monto total abonado: ', incisoC(l):5:2);
end.