{El correo argentino necesita procesar los envios entregados durante el mes de agosto de 2023. De cada 
 envio se conoce el código del cliente, día, código postal y peso del paquete.
 A) implementar un módulo que lea envios, genere y retorne una estructura adecuada para la búsqueda por 
    código postal, donde para cada código postal se almacenen juntos todos los envíos (código de cliente,
    día y peso del paquete). La lectura finaliza con peso de paquete 0. Se sugiere utilizar el módulo 
    leerEnvia(). 
 B) Implementar un módulo que reciba la estructura generada en A) y un código postal, y retorne todos los
    envíos de dicho código postal. 
 C) Realizar un módulo recursivo que reciba la estructura que retorna el inciso B) y retorne los dos códigos 
    de cliente correspondientes al envío con mayor y menor peso.
    NOTA: Implementar el programa principal, que invoque a los incisos A, B y C.}

program parcialCorreo;
type
    rangoDia = 1..31;
    envio = record
        codCliente:integer;
        dia:rangoDia;
        codPostal:integer;
        pesoPaquete:real;
    end;

    arbol = ^nodo;
    nodo = record
        datos:envio;
        hi:arbol;
        hd:arbol;
    end;

//--------------------------------------------------------------------------------------------------
procedure buscarUnPesoDelPaqueteMayor (a:arbol; pesoMax:real ;var CodClienteMax:integer);
begin
    if (a <> nil) then begin
        if (a^.datos.pesoPaquete > pesoMax) then begin
            pesoMax:= a^.datos.pesoPaquete;
            CodClienteMax:= a^.datos.codCliente;
        end;
        buscarUnPesoDelPaqueteMayor (a^.hi, pesoMax, CodClienteMax);
        buscarUnPesoDelPaqueteMayor (a^.hd, pesoMax, CodClienteMax);
    end;
end;
procedure buscarUnPesoDelPaqueteMenor (a:arbol; pesoMin:real ;var CodClienteMin:integer);
begin
    if (a <> nil) then begin
        if (a^.datos.pesoPaquete < pesoMin) then begin
            pesoMin:= a^.datos.pesoPaquete;
            CodClienteMin:= a^.datos.codCliente;
        end;
        buscarUnPesoDelPaqueteMenor (a^.hi, pesoMin, CodClienteMin);
        buscarUnPesoDelPaqueteMenor (a^.hd, pesoMin, CodClienteMin);
    end;
end;
procedure incisoC (a:arbol);
var
    CodClienteMax, CodClienteMin:integer;
    pesoMax, pesoMin:real;
begin
    CodClienteMax:= 0; pesoMax:= -1;
    CodClienteMin:= 0; pesoMin:= 999;
    buscarUnPesoDelPaqueteMenor (a, pesoMin, CodClienteMin);
    buscarUnPesoDelPaqueteMayor (a, pesoMax, CodClienteMax);
    writeln ('Su paquete es menor peso, el cliente es ', CodClienteMin);
    writeln ('Su paquete es mayor peso, el cliente es ', CodClienteMax);
end;
//--------------------------------------------------------------------------------------------------
procedure encontrarUnCodigoPostal (a:arbol; numPostal:integer; var ok:Boolean);
begin
    if (a <> nil) then begin 
        if (numPostal = a^.datos.codPostal) then begin
            ok:= true;
            writeln ('> Ha encontrado este codigo postal, informa su dato:');
            writeln ('- El codigo de cliente: ', a^.datos.codCliente);
            writeln ('- El dia: ', a^.datos.dia);
            writeln ('- El peso del paquete: ', a^.datos.pesoPaquete:2:3);
        end
        else
            encontrarUnCodigoPostal (a^.hi, numPostal, ok);
            encontrarUnCodigoPostal(a^.hd, numPostal, ok);
    end;
end;
procedure incisoB (a:arbol);
var
    numPostal:integer;
    ok:boolean;
begin
    ok:= false;
    writeln ('Ingrese un codigo postal:');
    readln (numPostal);
    encontrarUnCodigoPostal (a, numPostal, ok);    
    if (not ok) then
        writeln ('No ha encontrado este codigo postal.');
end;
//--------------------------------------------------------------------------------------------------
procedure agregarArbol (var a:arbol; e:envio);
begin
    if (a = nil) then begin
        new (a);
        a^.datos:= e;
        a^.hi:= nil;
        a^.hd:= nil;
    end
    else if (a^.datos.codPostal >= e.codPostal) then
            agregarArbol (a^.hi, e)
        else
            agregarArbol (a^.hd, e);   
end;
procedure leerEnvio (var e:envio);
begin
    writeln ('Ingrese el peso del paquete:');
    readln (e.pesoPaquete);
    if (e.pesoPaquete <> 0) then begin
        writeln ('Ingrese el codigo de cliente:');
        readln (e.codCliente);
        //writeln ('Ingrese el dia:');
        e.dia:= random(31)+1;
        writeln ('Ingrese el codigo postal:');
        readln (e.codPostal);
    end;
end;
procedure cargarArbol (var a:arbol);
var
    e:envio;
begin
    leerEnvio (e);
    while (e.pesoPaquete <> 0) do begin
        agregarArbol (a, e);
        writeln ();
        leerEnvio (e);
    end;
end;
//--------------------------------------------------------------------------------------------------
var
    a:arbol;
begin  
    randomize;
    a:= nil;
    writeln ('-----------------> INFORMACION DE CORREO ARGENTINO <-----------------');
    cargarArbol (a);
    writeln  ();
    writeln ('--------> BUSCAR EL CODIGO POSTAL PARA INFORMAR EL ENVIO <-----------');
    incisoB (a);
    writeln  ();
    writeln ('------------> BUSCAR EL PESO DEL PAQUETE MAYOR Y MENOR <-------------');
    incisoC (a);
end.