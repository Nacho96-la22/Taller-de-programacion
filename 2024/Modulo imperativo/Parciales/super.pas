{Un supermercado necesita el procesamiento de las compras realizadas por clientes. De cada compra se conoce
 el codigo del cliente, DNI, sucursal (1..5) y el monto.

 a) Implementar un modulo que lea compras, genere y retorne ordenado eficiente pero por monto y es la compra 
    no se guarda vector.

 b) Implementar un modulo que reciba la estructura generada en a) y recibe nro de dni y devuelve estructura 
    con cantidad de compras en cada sucursal del cliente.

 c) Implementar un modulo recursivo que reciba 2 montos y devuelve cantidad de compras entre esos montos.}

program super;
type
    rangoSucursal = 1..5;
    
    venta = record
        cod:integer;
        DNI:integer;
        sucursal:rangoSucursal;
        monto:real;
    end;

    arbol = ^nodoA;
    nodoA = record 
        datos:venta;
        hi:arbol;
        hd:arbol;
    end;

    vectorSucursal = array [rangoSucursal] of integer;

//-------------------------------------
procedure incisoC (a:arbol; ini,fin:real; var cant:integer);
begin
    if (a <> nil) then begin
        if (ini <= a^.datos.monto) then begin
            if (fin >= a^.datos.monto) then begin
                    cant:= cant + 1;
                    incisoC(a^.hi, ini, fin, cant);
                    incisoC(a^.hd, ini, fin, cant);
                end
                else
                    incisoC(a^.hi, ini, fin, cant);
        end
        else
            incisoC(a^.hd, ini, fin, cant);
    end;
end;    
//-------------------------------------
procedure imprimirVector (vec:vectorSucursal);
var
    i:integer;
begin
    for i:= 1 to 5 do begin
        writeln ('> ',i ,' y cantidad ', vec[i]);
    end;
end;
procedure incisoB (a:arbol; var vec:vectorSucursal; num:integer);
begin
    if (a <> nil) then begin
        if (a^.datos.DNI = num) then
            vec[a^.datos.sucursal]:= vec[a^.datos.sucursal] + 1;
        incisoB(a^.hi, vec, num);
        incisoB(a^.hd, vec, num);
    end;
end;
//-------------------------------------
procedure imprimirArbol (a:arbol);
begin
    if (a <> nil) then begin
        imprimirArbol (a^.hi);
        writeln ('> El codigo: ', a^.datos.cod);
        writeln ('- El DNI: ', a^.datos.DNI);
        writeln ('- El codigo de sucursal: ', a^.datos.sucursal);
        writeln ('- El monto: ', a^.datos.monto:4:2);
        writeln('***********************');
        imprimirArbol (a^.hd);
    end;
end;
procedure incisoA (var a:arbol);

    procedure cargarArbol (var a:arbol; v:venta);
    begin
        if (a = nil) then begin
            new (a);
            a^.datos:= v;
            a^.hi:= nil;
            a^.hd:= nil;
        end
        else if (a^.datos.monto > v.monto) then 
                cargarArbol(a^.hi, v)
            else
                cargarArbol(a^.hd, v);
    end;
    procedure leerVenta (var v:venta);
    begin
        writeln ('> Ingrese el codigo:');
        readln (v.cod);
        if (v.cod <> 0) then begin
            v.DNI:= random(10)+1;
            v.sucursal:= random (5)+1;
            v.monto:= random (1000)+1;
        end;
    end;

var
    v:venta;
begin
    leerVenta (v);
    while (v.cod <> 0) do begin
        cargarArbol(a, v);
        writeln ('----------');
        leerVenta (v);
    end;
end;
procedure inicializarVector(var vec:vectorSucursal);
var
    i:integer;
begin
    for i:= 1 to 5 do
        vec[i]:= 0;
end;
//-------------------------------------
var
    a:arbol;
    vec:vectorSucursal;
    num, cant:integer;
    ini,fin:real;
begin
    randomize;
    a:= nil;
    inicializarVector(vec);
    incisoA(a);
    writeln();
    imprimirArbol(a);
    writeln ();
    write ('> Ingrese el nro de DNI:'); readln(num);
    incisoB(a, vec, num);
    imprimirVector(vec);
    cant:= 0;
    write ('> Ingrese el inicio de monto: '); readln (ini);
    write ('> Ingrese el final de monto: '); readln (fin);
    incisoC(a, ini, fin,cant);
    writeln ('La cantidad de compras: ', cant);
end.