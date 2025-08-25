{Una pizzeria recibe pedidos telefonicos de sus clientes. De cada pedido interesa conocer: DNI del cliente, nombre,
 fecha y monto a abonar por el pedido.
 
 1- Lea la informacion de los pedidos telefonicos hasta ingresar uno con monto 0. A partir de esto, genere una
    estructura que almacene para cada DNI de cliente, su nombre y una lista con informacion de la fecha y monto de 
    los pedidos realizados. La estructura debe estar ordenada por DNI y ser eficiente para la busqueda por dicho
    criterio.
    
 A partir de la estructura generada en 1) realice modulos independientes para:
 
 2- Informar la cantidad de clientes que realizaron pedidos en una fecha que se lee de teclado.
 3- Informar el total abonado y el total de pedidos realizados por el cliente cuyo DNI coincide con uno ingresado.
 
 NOTA: la informacion en 1 se lee sin orden alguno.}

program parcialPizzeria;
type
    cadena20 = String[20];
    rangoDia = 1..31;
    rangoMes = 1..12;


    calendario = record
        dia:rangoDia;
        mes:rangoMes;
    end;

    pedido1 = record
        DNI:integer;
        nombre:cadena20;
        fecha:calendario;
        monto:real;
    end;

    pedido2 = record
        fecha:calendario;
        monto:real;
    end;

    lista = ^nodoL;
    nodoL = record
        dato:pedido2;
        sig:lista;
    end;

    cliente = record
        DNI:integer;
        nombre:cadena20;
        l:lista;
    end;

    arbol = ^nodoA;
    nodoA = record
        dato:cliente;
        hi:arbol;
        hd:arbol;
    end;

//--------------------------> INCISO 3 <--------------------------
procedure inciso3(a:arbol; dni:integer; var montotal:real; var cantPedido:integer);

    procedure sumandoMontoPedido (l:lista; var montotal:real; var cantPedido:integer);
    begin
        while (l <> nil) do begin
            montotal:= montotal + l^.dato.monto;
            cantPedido:= cantPedido + 1;
            l:= l^.sig;
        end;
    end;

begin
    if (a <> nil) then begin
        if (a^.dato.DNI = dni) then
            sumandoMontoPedido(a^.dato.l,montotal,cantPedido)
        else if (a^.dato.DNI > dni) then
                inciso3(a^.hi,dni,montotal,cantPedido)
            else 
                inciso3(a^.hd,dni,montotal,cantPedido);
    end;
end;
//--------------------------> INCISO 2 <--------------------------
procedure inciso2(a:arbol; dia:rangoDia; mes:rangoMes; var cant:integer);

    procedure verificarFecha (dia:rangoDia; mes:rangoMes; l:lista; var cant:integer);
    begin
        while (l <> nil) do begin
            if (l^.dato.fecha.dia = dia) then begin
                if (l^.dato.fecha.mes = mes) then 
                    cant:= cant + 1;
            end;
            l:= l^.sig;
        end;
    end;

begin
    if (a <> nil) then begin
        verificarFecha(dia,mes,a^.dato.l,cant);
        inciso2(a^.hi,dia,mes,cant);
        inciso2(a^.hd,dia,mes,cant);
    end;
end;
//------------------------> TEST PRUEBA <-------------------------
procedure imprimirArbol(a:arbol);

    procedure imprimirListas(l:lista);
    begin
        while (l <> nil) do begin
            writeln ('+ Monto: ',l^.dato.monto:0:2,', fecha: ',l^.dato.fecha.dia,'/',l^.dato.fecha.mes);
            l:= l^.sig;
        end;
    end;

begin
    if (a <> nil) then begin
        imprimirArbol (a^.hi);
        writeln ('> DNI: ',a^.dato.DNI,', nombre: ',a^.dato.nombre);
        writeln('- Las listas de pedidos:');
        imprimirListas(a^.dato.l);
        writeln ('****************************************');
        imprimirArbol (a^.hd);
    end;
end;
//--------------------------> INCISO 1 <--------------------------
procedure inciso1 (var a:arbol);

    procedure agregarAdelante (var l:lista; p:pedido2);
    var
        nue:lista;
    begin
        new(nue);
        nue^.dato:= p;
        nue^.sig:= l;
        l:= nue;
    end;
    procedure armarPedidos(p:pedido1; var p2:pedido2);
    begin
        p2.fecha:= p.fecha;
        p2.monto:= p.monto;
    end;
    procedure cargarArbol (var a:arbol; p:pedido1);
    var
        p2:pedido2;
    begin
        if (a = nil) then begin
            new(a);
            a^.dato.DNI:= p.DNI;
            a^.dato.nombre:= p.nombre;
            armarPedidos(p,p2);
            a^.dato.l:= nil;
            agregarAdelante(a^.dato.l,p2);
            a^.hi:= nil;
            a^.hd:= nil;
        end
        else if (a^.dato.DNI = p.DNI) then begin
                armarPedidos(p,p2);
                agregarAdelante(a^.dato.l,p2);
            end
            else if (a^.dato.DNI > p.DNI) then
                    cargarArbol (a^.hi,p)
                else
                    cargarArbol (a^.hd,p);
    end;
    procedure leer (var p:pedido1);
    var
        n:array[0..5] of String = ('Maritn','Juana','Jose','Ana','Nicolas','Luciana');
    begin
        p.monto:= random(100)*1.5;
        if (p.monto <> 0) then begin
            p.DNI:= random(300-100)+100;
            p.nombre:= n[random(5)];
            p.fecha.dia:= random(31)+1;
            p.fecha.mes:= random(12)+1;
        end;
    end;

var
    p:pedido1;
begin
    leer(p);
    while (p.monto <> 0) do begin
        cargarArbol(a,p);
        leer(p);
    end;
end;
//----------------------------------------------------------------
var
    a:arbol;
    dia:rangoDia; mes:rangoMes;
    cant:integer;
    montotal:real; cantPedido,dni:integer;
begin
    a:= nil;
    randomize;
    inciso1(a);
    imprimirArbol(a);
    write ('> Ingrese el dia: '); readln(dia);
    write ('> Ingrese el mes: '); readln(mes);
    cant:= 0;
    inciso2(a,dia,mes,cant);
    writeln ('> La cantidad de cliente ha realizado pedidos en la fecha: ',dia,'/',mes,': ',cant);
    montotal:= 0; cantPedido:= 0;
    write ('> Ingrese el DNI: '); readln(dni);
    inciso3(a,dni,montotal,cantPedido);
    if (cantPedido > 0) then
        writeln('> El cliente de DNI ',dni,', informa el total abonado: ',montotal:0:2,' y el total de pedidos: ',cantPedido)
    else
        writeln ('*** No existe este cliente de DNI ***');
end.