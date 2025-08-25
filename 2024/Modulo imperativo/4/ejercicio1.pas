{1)
    a. Almacenar los productos vendidos en una estructura eficiente para la búsqueda por
       código de producto. De cada producto deben quedar almacenados su código, la
       cantidad total de unidades vendidas y el monto total. De cada venta se cargan código
       de venta, código del producto vendido, cantidad de unidades vendidas y precio
       unitario. El ingreso de las ventas finaliza cuando se lee el código de venta 0.
    b. Imprimir el contenido del árbol ordenado por código de producto.
    c. Retornar el menor código de producto.
    d. Retornar la cantidad de códigos que existen en el árbol que son menores que un valor
       que se recibe como parámetro.
    e. Retornar el monto total entre todos los códigos de productos comprendidos entre dos
       valores recibidos (sin incluir) como parámetros.}

program ejercicio1;
type

    producto = record
        cod:integer;
        cantTotal:integer;
        montoTotal:real;
    end;

    venta = record
        codV:integer;
        codP:integer;
        cant:integer;
        precio:real;
    end;

    arbol = ^nodoA;
    nodoA = record
        datos:producto;
        hi:arbol;
        hd:arbol;
    end;

//---------------------- [ INCISO E ] --------------------------
procedure incisoE (a:arbol; min,max:integer; var montoTotal:real);
begin
    if (a <> nil) then begin
        if (a^.datos.cod > min) then
            if (a^.datos.cod < max) then begin
                montoTotal:= montoTotal + a^.datos.montoTotal; 
                incisoE(a^.hi,min,max,montoTotal);
                incisoE(a^.hd,min,max,montoTotal)
            end
            else
                incisoE(a^.hi,min,max,montoTotal)
        else
            incisoE(a^.hd,min,max,montoTotal);
    end;
end;
//---------------------- [ INCISO D ] --------------------------
function incisoD(a:arbol; nro:integer):integer;
begin
    if (a = nil) then
        incisoD:= 0
    else if (a^.datos.cod < nro) then
            incisoD:= incisoD(a^.hi,nro) + incisoD(a^.hd,nro) + 1
        else
            incisoD:= incisoD(a^.hi,nro) + incisoD(a^.hd,nro);
end;
//---------------------- [ INCISO C ] --------------------------
function incisoC(a:arbol):integer;
begin
    if (a = nil) then 
        incisoC:= 999
    else if (a^.hi = nil) then
            incisoC:= a^.datos.cod
        else
            incisoC:= incisoC(a^.hi);
end;
//---------------------- [ INCISO B ] --------------------------
procedure imprimirArbol(a:arbol);
begin
    if (a <> nil) then begin
        imprimirArbol(a^.hi);
        writeln ('Codigo de producto: ', a^.datos.cod);
        writeln ('Cantidad total de unidades vendidas: ',a^.datos.cantTotal);
        writeln ('Monto total: ', a^.datos.montoTotal:2:2);
        writeln ('************************************************');
        imprimirArbol(a^.hd);
    end;
end;
//---------------------- [ INCISO A ] --------------------------
procedure incisoA (var a:arbol);

    procedure cargarProducto (var p:producto; v:venta);
    begin
        p.cod:= v.codP;
        p.cantTotal:= v.cant;
        p.montoTotal:= v.cant * v.precio;
    end;
    procedure cargarArbol (var a:arbol; v:venta);
    var
        p:producto;
    begin
        if (a = nil) then begin
            new(a);
            cargarProducto(p,v);
            a^.datos:= p;
            a^.hi:= nil;
            a^.hd:= nil;
        end
        else if (a^.datos.cod = v.codP) then begin
                a^.datos.cantTotal:= a^.datos.cantTotal + v.cant;
                a^.datos.montoTotal:= a^.datos.montoTotal + (v.cant * v.precio);
            end
            else if (a^.datos.cod > v.codP) then
                cargarArbol(a^.hi, v)
            else
                cargarArbol(a^.hd, v)           
    end;
    procedure cargarVenta(var v:venta);
    begin
        v.codV:= random (51)*100;
        if (v.codV <> 0) then begin
            v.codP:= random(100)+1;
            v.cant:= random(15)+1;
            v.precio:= random(100)+1;
        end;
    end;

var
    v:venta;
begin
    cargarVenta(v);
    while (v.codV <> 0) do begin
        cargarArbol(a,v);
        cargarVenta(v);
    end;
end;
//--------------------------------------------------------------
var
    a:arbol;
    nro:integer;
    min,max:integer;
    montoTotal:real;
begin
    a:= Nil;
    randomize;
    writeln ('------------------> Inciso A <------------------');
    writeln ('         *** Han cargados los datos ***');
    incisoA(a);
    writeln ('------------------> Inciso B <------------------');
    imprimirArbol(a); // Inciso B
    writeln ('------------------> Inciso C <------------------');
    writeln ('> El menor codigo de producto es ',incisoC(a));
    writeln ('------------------> Inciso D <------------------');
    write ('> Ingrese un codigo de producto: '); readln(nro);
    writeln ('- Este valor tiene menor la cantidad de codigos: ',incisoD(a,nro));
    writeln ('------------------> Inciso E <------------------');
    montoTotal:= 0;
    write ('> Ingrese el minimo de codigo: '); readln (min);
    write ('> Ingrese el maximo de codigo: '); readln (max);
    incisoE(a,min,max,montoTotal);
    writeln ('> El monto total entre dos valores recibidos: ', montoTotal:2:2);
end.