{Aerolineas Argentinas necesita procesar los pasajes vendidos durante 2023. De cada pasaje se conoce el codigo
 de vuelo, codigo del cliente, codigo ciudad destino y monto del pasaje.
 
 a) Implementar un modulo que lea pasajes, genere y retorne una estructuras adecuada para la busqueda por codigo
    de ciudad destino, donde para cada codigo de ciudad destino se almacenan juntos todos los pasajes (codigo de 
    vuelo, codigo del cliente y monto del pasaje). La lectura finaliza con el monto de pasaje 0.
    
 b) Implementar un modulo que reciba la estructura generada en a) y un codigo de ciudad destino y retorne todos 
    los pasajes hacia esa ciudad destino.
    
 c) Realizar un modulo que reciba la estructura generada en a) y retorne el codigo de ciudad de destino con mayor
    cantidad de pasajes vendidos.
    
 NOTA: Implementar el programa principal, que invoque a los incisos a, b y c}


program AerolineasArgentinas;
type
    pasaje1 = record
        codVuelo:integer;
        codCliente:integer;
        codCiudad:integer;
        monto:real;
    end;

    pasaje2 = record
        codVuelo:integer;
        codCliente:integer;
        monto:real;        
    end;

    lista = ^nodoL;
    nodoL = record
        datos:pasaje2;
        sig:lista;
    end;

    ciudadDestino = record
        codCiudad:integer;
        pasaje:lista;
    end;

    arbol = ^nodoA;
    nodoA = record
        datos:ciudadDestino;
        hi:arbol;
        hd:arbol;
    end;

//----------------------------[ INCISO C ]----------------------------------
procedure incisoC (a:arbol; var ciudadMax:integer; var cantMax:integer);

    function pasajesVendidos(l:lista):integer;
    var
        cant:integer;
    begin
        cant:= 0;
        if (l <> nil) then begin
            cant:= pasajesVendidos(l^.sig)+1;
        end;
        pasajesVendidos:= cant;
    end;

var
    cantActual:integer;
begin
    if (a <> nil) then begin
        cantActual:= pasajesVendidos(a^.datos.pasaje);
        if (cantActual > cantMax) then begin
            ciudadMax:= a^.datos.codCiudad;
            cantMax:= cantActual;
        end;
        incisoC(a^.hi, ciudadMax, cantMax);
        incisoC(a^.hd, ciudadMax, cantMax);
    end;
end;
//----------------------------[ INCISO B ]----------------------------------
procedure retornarPasajes (l:lista);
begin
    if (l <> nil) then begin
        writeln ('- El codigo del vuelo: ', l^.datos.codVuelo);
        writeln ('- El codigo del cliente: ', l^.datos.codCliente);
        writeln ('- El monto: ', l^.datos.monto:5:2);
        writeln();
        retornarPasajes (l^.sig);
    end;
end;
procedure incisoB (a:arbol; nroC:integer; var data:lista);
begin
    if (a = nil) then begin
        writeln ('****** No existe este codigo ******');
    end
    else if (nroC = a^.datos.codCiudad) then begin
            writeln('****** Existe este codigo ******');
            data:= a^.datos.pasaje;
        end
        else if (nroC < a^.datos.codCiudad) then
                incisoB(a^.hi, nroC, data)
            else 
                incisoB(a^.hd, nroC, data)
end;
//----------------------[ TEST EL INFORMACION ]-----------------------------
procedure informarCiudad(a:arbol);
    
    procedure informarListas(l:lista);
    begin
        if (l <> nil) then begin
            writeln ('- El codigo del vuelo: ', l^.datos.codVuelo);
            writeln ('- El codigo del cliente: ', l^.datos.codCliente);
            writeln ('- El monto: ', l^.datos.monto:5:2);
            writeln();
            informarListas(l^.sig);
        end;
    end;

begin
    if (a <> nil) then begin
        informarCiudad(a^.hi);
        writeln ('> El codigo del ciudad destino: ', a^.datos.codCiudad);
        writeln ('+ Los listados:');
        informarListas(a^.datos.pasaje);
        informarCiudad(a^.hd);
    end;
end;
//----------------------------[ INCISO A ]----------------------------------
procedure incisoA (var a:arbol);

    procedure cargarLista(var l:lista; p1:pasaje1);
    var
        nue:lista;
    begin
        new(nue);
        nue^.datos.codVuelo:= p1.codVuelo;
        nue^.datos.codCliente:= p1.codCliente;
        nue^.datos.monto:= p1.monto;
        nue^.sig:= l;
        l:= nue;
    end;    
    procedure cargarArbol (var a:arbol; p1:pasaje1);
    begin
        if (a = nil) then begin
            new(a);
            a^.datos.codCiudad:= p1.codCiudad;
            a^.datos.pasaje:= nil;
            cargarLista(a^.datos.pasaje, p1);
            a^.hi:= nil;
            a^.hd:= nil;
        end
        else if (a^.datos.codCiudad = p1.codCiudad) then
                cargarLista(a^.datos.pasaje, p1)
            else if (a^.datos.codCiudad > p1.codCiudad) then 
                    cargarArbol (a^.hi, p1)
                else
                    cargarArbol (a^.hd, p1);
    end;    
    procedure leerPasaje(var p1:pasaje1);
    begin
        {writeln ('> Ingrese el monto:');
        readln(p1.monto);}
        p1.monto:= random (100)*1.5;
        if (p1.monto <> 0) then begin
            p1.codVuelo:= random(100)+1;
            p1.codCliente:= random(100)+1;
            p1.codCiudad:= random(10)+1;
        end;
    end;

var
    p1:pasaje1;
begin
    leerPasaje(p1);
    while (p1.monto <> 0) do begin
        cargarArbol(a,p1);
        writeln('**********************');
        leerPasaje(p1);
    end;
end;
//--------------------------------------------------------------------------
var
    a:arbol;
    nroC:integer;
    data:lista;
    ciudadMax, cantMax:integer;
begin
    randomize;
    a:= nil;
    writeln (':::::::::::::::::::::|| AREOLINEAS ARGENTINAS ||:::::::::::::::::::::');
    incisoA(a);
    writeln ('::::::::::::|| EL INFORMACION DE AREOLINEAS ARGENTINAS ||::::::::::::');
    informarCiudad(a);
    writeln ('::::::::::::|| BUSCAR EL CODIGO DE CIUDAD DE DESTINO ||::::::::::::::');
    data:= nil;
    write ('> Ingrese un codigo de ciudad destino: ');
    readln(nroC);
    incisoB(a, nroC, data);
    retornarPasajes(data);
    writeln ('::|| LA CIUDAD DE DESTINO CON MAYOR CANTIDAD DE PASAJES VENDIDOS ||::');
    ciudadMax:= -1;
    cantMax:= -1;
    incisoC(a, ciudadMax, cantMax);
    writeln ('> El codigo de ciudad de destino es ', ciudadMax,' , ha vendidos ', cantMax,' pasajes.');
end.