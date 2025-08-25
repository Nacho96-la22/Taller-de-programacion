{3. Implementar un programa modularizado para una librería. Implementar módulos para:
    a. Almacenar los productos vendidos en una estructura eficiente para la búsqueda por
       código de producto. De cada producto deben quedar almacenados su código, la cantidad 
       total de unidades vendidas y el monto total. De cada venta se lee código de venta, 
       código del producto vendido, cantidad de unidades vendidas y precio unitario. El
       ingreso de las ventas finaliza cuando se lee el código de venta -1.
    b. Imprimir el contenido del árbol ordenado por código de producto.
    c. Retornar el código de producto con mayor cantidad de unidades vendidas.
    d. Retornar la cantidad de códigos que existen en el árbol que son menores que un valor
       que se recibe como parámetro.
    e. Retornar el monto total entre todos los códigos de productos comprendidos entre dos
       valores recibidos (sin incluir) como parámetros.}

program ejercicio3;
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

    arbol = ^nodo;
    nodo = record
        datos:producto;
        hi:arbol;
        hd:arbol;
    end;

//------------------------------- [ INCISO E ] -------------------------------
procedure incisoE (a:arbol; min,max:integer; var montoEntre:real);
begin
    if (a <> nil) then begin
        if (a^.datos.cod > min) then
            if (a^.datos.cod < max) then begin
                montoEntre:= montoEntre + a^.datos.montoTotal;
                incisoE(a^.hi,min,max,montoEntre);
                incisoE(a^.hd,min,max,montoEntre);
            end
            else
                incisoE(a^.hi,min,max,montoEntre)
        else
            incisoE(a^.hd,min,max,montoEntre);
    end;
end;
//------------------------------- [ INCISO D ] -------------------------------
function incisoC(a:arbol; valor:integer):integer;
begin
    if (a <> nil) then begin
        if (a^.datos.cod < valor) then
            incisoC:= incisoC(a^.hi,valor) + incisoC(a^.hd,valor) + 1
        else
            incisoC:= incisoC(a^.hi,valor);
    end
    else
        incisoC:= 0;
end;
//------------------------------- [ INCISO C ] -------------------------------
procedure incisoB (a:arbol; var codMax:integer; var cantMax:integer);
begin
    if (a <> nil) then begin
        if (a^.datos.cantTotal > cantMax) then begin
            cantMax:= a^.datos.cantTotal;
            codMax:= a^.datos.cod;
        end;
        incisoB(a^.hi,codMax,cantMax);
        incisoB(a^.hd,codMax,cantMax);
    end;
end;
//------------------------------- [ INCISO B ] -------------------------------
procedure imprimir(a:arbol);
begin
    if (a <> nil) then begin
        imprimir (a^.hi);
        writeln('> El codigo de producto: ',a^.datos.cod,', cantidad total de unidades vendidas: ',a^.datos.cantTotal,' y el monto total: ', a^.datos.montoTotal:0:2);
        imprimir (a^.hd);
    end;
end;
//------------------------------- [ INCISO A ] -------------------------------
procedure incisoA(var a:arbol);

    procedure armarProducto(var p:producto; v:venta);
    begin
        p.cod:= v.codP;
        p.cantTotal:= v.cant;
        p.montoTotal:= v.cant * v.precio;
    end;
    procedure cargarArbol(var a:arbol; v:venta);
    var
        p:producto;
    begin
        if (a = nil) then begin
            new(a);
            armarProducto(p,v);
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
                    cargarArbol(a^.hd, v);
    end;
    procedure leer(var v:venta);
    begin 
        //readln(v.codV);  
        v.codV:= random(100)-1;
        if (v.codV <> -1) then begin
            v.codP:= random(51)*100;
            v.cant:= random(15);
            v.precio:= random (100 +(100))/2; 
        end;
    end;

var
    v:venta;
begin
    leer(v);
    while (v.codV <> -1) do begin
        cargarArbol(a,v);
        leer(v);
    end;
end;
//--------------------------------------------------------
var
    a:arbol;
    codMax,cantMax,valor:integer;
    min,max:integer;
    montoEntre:real;
begin
    a:= nil;
    randomize;
    incisoA(a);
    imprimir(a);
    codMax:= 0;
    cantMax:= -1;
    incisoB (a,codMax,cantMax);
    writeln ('Este codigo de producto con mayor cantidad de unidad vendidas: ',codMax);
    write ('> Ingrese el codigo: '); readln (valor);
    writeln ('- La cantidad de codigos que existen en el arbol que son menores: ', incisoC(a,valor));
    montoEntre:= 0;
    write ('> Ingrese el codigo para minimo: '); readln (min);
    write ('> Ingrese el codigo para maximo: '); readln (max);
    incisoE(a,min,max,montoEntre);
    writeln ('- El monto total entre todos los codigos de productos comprendidos entre dos valores recibidos: ', montoEntre:0:2);
end.