{2) Implementar un programa que procese información de propiedades que están a la venta
    en una inmobiliaria. 
    Se pide:
    A) Implementar un módulo para almacenar en una estructura adecuada, las propiedades 
       agrupadas por zona. Las propiedades de una misma zona deben quedar almacenadas 
       ordenadas por tipo de propiedad. Para cada propiedad debe almacenarse el código,
       el tipo de propiedad y el precio total. De cada propiedad se lee: zona (1 a 5),
       código de propiedad, tipo de propiedad, cantidad de metros cuadrados y precio del 
       metro cuadrado. La lectura finaliza cuando se ingresa el precio del metro cuadrado -1.
    B) Implementar un módulo que reciba la estructura generada en a), un número de zona y un
       tipo de propiedad y retorne los códigos de las propiedades de la zona recibida y
       del tipo recibido.}

program ejercicio2;
type
    rangoZonas = 1..5;
    propiedad = record
        cod:integer;
        tipo:String;
        precioTotal:real;
    end;
    listaPropiedad = ^nodo;
    nodo = record
        datos:propiedad;
        sig:listaPropiedad;
    end;
    vectorPropiedad = array [rangoZonas] of listaPropiedad;

    clientePropiedad = record 
        zona:rangoZonas;
        cod:integer;
        tipo:String;
        cantCuadrado:integer;
        precioMetroCuadro:real;
    end;   
//--------------------------------------- Inciso B ---------------------------------------
procedure incisoB (lp:listaPropiedad; tipoP:String);
begin
    while (lp <> nil) do begin
        if (tipoP = lp^.datos.tipo) then 
            writeln ('> El codigo: ', lp^.datos.cod, ', el tipo de propiedad: ', lp^.datos.tipo,', el precio total: ', lp^.datos.precioTotal:3:4)
        else
            writeln ('No hay informacion.');
        lp:= lp^.sig;
    end;
end;
//--------------------------------------- Inciso A ---------------------------------------
procedure ordenadaTipoPropiedad (var lp:listaPropiedad; p:propiedad);
var
    nue, ant, act:listaPropiedad;
begin
    new (nue);
    nue^.datos:= p;
    ant:= lp; act:= lp;
    while (act <> nil) and (act^.datos.tipo < p.tipo) do begin
        ant:= act;
        act:= act^.sig;
    end;
    if (ant = act) then
        lp:= nue
        else
            ant^.sig:= nue;
    nue^.sig:= act; 
end;
procedure cargarPropiedad (var p:propiedad; c:clientePropiedad);
begin 
    p.cod:= c.cod;
    p.tipo:= c.tipo;
    p.precioTotal:= p.precioTotal + c.precioMetroCuadro;
end;
procedure leerCliente (var c:clientePropiedad);
begin
    write ('> Ingrese el precio del metro cuadrado: '); readln (c.precioMetroCuadro);
    if (c.precioMetroCuadro <> -1) then begin
        write ('> Ingrese zona: '); readln (c.zona);
        write ('> Ingrese el codigo de propiedad: '); readln (c.cod);
        write ('> Ingrese el tipo de propiedad: '); readln (c.tipo);
        write ('> Ingrese la cantidad de metros cuadrados: '); readln (c.cantCuadrado);
    end;
end;
procedure cargarLista (var v:vectorPropiedad);
var
    p:propiedad;
    c:clientePropiedad;
    actualZona:rangoZonas;
begin
    leerCliente (c);
    while (c.precioMetroCuadro <> -1) do begin
        actualZona:= c.zona;
        if (c.zona = actualZona) then begin
            cargarPropiedad(p,c);
            ordenadaTipoPropiedad(v[c.zona],p);
        end;
        writeln('************************************');
        leerCliente (c);
    end;    
end;
procedure inicializarVector (var v:vectorPropiedad);
var
    i:integer;
begin
    for i:= 1 to 5 do
        v[i]:= nil;
end;
//--------------------------------------------------------------------------------------------
var
    v:vectorPropiedad;
    nroZona:rangoZonas;
    tipoP:String;
begin
    writeln ('- INFORMACION DE PROPIEDAD: ');
    inicializarVector(v);
    cargarLista (v);
    writeln('::::::::::::::::::::::::::::::::::::');
    writeln('- Busco la zona y el tipo de propiedad:');
    writeln('> Ingrese el numero de zona: '); readln(nroZona);
    writeln ('> Ingrese el tipo de propiedad: '); readln (tipoP);
    writeln();
    writeln ('Informe:');
    incisoB(v[nroZona],tipoP);
end.