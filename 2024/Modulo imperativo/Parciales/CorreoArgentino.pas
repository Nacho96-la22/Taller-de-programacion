{El correo Argentino necesita procesar los envios entregados durante el mes de Agosto de 2023. De cada envio
 se conoce el codigo del cliente, dia, codigo postal y peso del paquete.
 
 a) Implementar un modulo que lea envios, genere y retorne una estructuras adecuada para la busqueda por el 
    codigo postal, donde para cada codigo postal se almacenen juntos todos los envios (codigo del cliente, dia
    y peso del paquete). La lectura finaliza con peso de paquete 0.     
 b) Implementar un modulo que reciba la estructura generada en a) y un codigo postal, y retorne todos los envios
    de dicho codigo postal.
 c) Realizar un modulo recursivo que reciba la estructura que retorna el inciso b) y retorne los dos codigos de 
    cliente correspondientes al envio con mayor y menor peso.
    
 NOTA: Implementar el programa principal, que invoque a los incisos a, b y c.}


program CorreoArgentino;
type
    rangoDia = 1..31;
    //rangoPostal = 1000..3000;

    envio1 = record
        codCliente:integer;
        dia:rangoDia;
        codPostal:integer;
        pesoPaquete:real;
    end;

    envio2 = record
        codCliente:integer;
        dia:rangoDia;
        pesoPaquete:real;
    end;
    
    lista = ^nodoL;
    nodoL = record
        datos:envio2;
        sig:lista;
    end;

    postal = record
        codPostal:integer;
        clientes:lista;
    end;

    arbol = ^nodoA;
    nodoA = record
        datos:postal;
        hi:arbol;
        hd:arbol;
    end;

//-------------------> INCISO C <-----------------------
procedure minimo (l:lista; var codMenor:integer; var pesoMenor:real);
begin
    if (l <> nil) then begin
        if (pesoMenor > l^.datos.pesoPaquete) then begin
            codMenor:= l^.datos.codCliente;
            pesoMenor:= l^.datos.pesoPaquete;
        end;
        minimo(l^.sig, codMenor, pesoMenor);
    end;
end;
procedure maximo (l:lista; var codMax:integer; var pesoMax:real);
begin
    if (l <> nil) then begin
        if (pesoMax < l^.datos.pesoPaquete) then begin
            codMax:= l^.datos.codCliente;
            pesoMax:= l^.datos.pesoPaquete;
        end;
        maximo(l^.sig, codMax, pesoMax);
    end;
end;
//-------------------> INCISO B <-----------------------
procedure retorneLista (l:lista);
begin
    if (l <> nil) then begin
        writeln ('- El codigo del cliente: ', l^.datos.codCliente);
        writeln ('- El dia: ',l^.datos.dia);
        writeln ('- El peso de paquete: ',l^.datos.pesoPaquete:3:2);
        writeln ();
        retorneLista(l^.sig);
    end;
end;
procedure incisoB (a:arbol; var l:lista; var num:integer);
begin
    if (a = nil) then begin
        writeln ('**** No existe este codigo postal ****');
    end
    else if (a^.datos.codPostal = num) then begin
            writeln ('**** Existe este codigo postal ****');
            l:= a^.datos.clientes;
        end
        else if (a^.datos.codPostal > num) then
                incisoB(a^.hi, l, num)
            else
                incisoB(a^.hd, l, num);
end;
//-------------------> INCISO A <-----------------------
procedure imprimirClientes (a:arbol);

    procedure informarLista(l:lista);
    begin
        while (l <> nil) do begin
            writeln ('- El codigo del cliente: ', l^.datos.codCliente);
            writeln ('- El dia: ',l^.datos.dia);
            writeln ('- El peso de paquete: ',l^.datos.pesoPaquete:3:2);
            writeln ();
            l:= l^.sig;
        end;
    end;

begin
    if (a <> nil) then begin
        imprimirClientes(a^.hi);
        writeln ('> El codigo de postal: ', a^.datos.codPostal);
        writeln ('+ Los listados de clientes:');
        informarLista(a^.datos.clientes);
        imprimirClientes(a^.hd);
    end;
end;
procedure incisoA (var a:arbol);

    procedure cargarLista(var l:lista; e1:envio1);
    var
        nue:lista;
    begin
        new(nue);
        nue^.datos.codCliente:= e1.codCliente;
        nue^.datos.dia:= e1.dia;
        nue^.datos.pesoPaquete:= e1.pesoPaquete;
        nue^.sig:= l;
        l:= nue;
    end;
    procedure cargarArbol(var a:arbol; e1:envio1);
    begin
        if (a = nil) then begin
            new(a);
            a^.datos.codPostal:= e1.codPostal;
            a^.datos.clientes:= nil;
            cargarLista(a^.datos.clientes, e1);
            a^.hi:= nil;
            a^.hd:= nil;
        end
        else if (e1.codPostal = a^.datos.codPostal) then
                cargarLista(a^.datos.clientes, e1)
            else if (e1.codPostal < a^.datos.codPostal) then
                    cargarArbol(a^.hi, e1)
                else
                    cargarArbol(a^.hd, e1);
    end;
    procedure leerEnvio(var e1:envio1);
    begin
        {writeln ('Ingrese el peso de paquete:');
        readln(e1.pesoPaquete);}
        e1.pesoPaquete:= random(10)*1.5;
        if(e1.pesoPaquete <> 0) then begin
            e1.codCliente:= random(100)+1;
            e1.dia:= random(31)+1;
            e1.codPostal:= random(3000-1000)+1000+1;
        end;    
    end;

var
    e1:envio1;
begin
    leerEnvio(e1);
    while (e1.pesoPaquete <> 0) do begin
        cargarArbol(a,e1);
        leerEnvio(e1);
    end;
end;
//------------------------------------------------------
var
    a:arbol;
    numPostal:integer;
    codMax, codMenor:integer;
    pesoMax, pesoMenor:real;
    l:lista;
begin
    randomize;
    a:= nil;
    writeln ('::::::::::::::::::>> INFORMACION DE CORREO ARGENTINO <<::::::::::::::::::');
    incisoA(a);
    writeln('--------------------------------------------------------------------------');
    imprimirClientes(a);
    writeln ('::::::::::::::::::::>> BUSCAR UN CODIGO DE POSTAL <<:::::::::::::::::::::');
    l:= nil;
    write ('> Ingrese un codigo de postal: '); readln(numPostal);
    incisoB(a, l, numPostal);
    writeln ('+ Los listados de clientes:');
    retorneLista(l);
    writeln('----------------------');
    codMax:= -1; pesoMax:= -1;
    codMenor:= 99; pesoMenor:= 99;
    maximo(l, codMax, pesoMax);
    writeln ('> El cliente con mayor peso:');
    writeln ('El codigo del cliente: ', codMax, ' y el peso del paquete tiene ', pesoMax:3:2);
    minimo(l, codMenor, pesoMenor);
    writeln ('> El cliente con menor peso:');
    writeln ('El codigo del cliente: ', codMenor, ' y el peso del paquete tiene ', pesoMenor:3:2);
end.