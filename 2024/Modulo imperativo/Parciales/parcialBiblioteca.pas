{La biblioteca Sarmiento necesita un sistema para obtener estadisticas sobre los libros prestados. De cada prestamo se
 conoce: el numero de prestamo, ISBN del libro y codigo de socio. La lectura finaliza con codigo de socio 0 y todos los
 prestamos realizados a un mismo socio se leen consecutivamente.
 
 A) Implementar un modulo que lea informacion de los prestamos y geere:
    i.  Una estructura de datos eficiente para la busqueda por ISBN del libro.
    ii. Una estructura donde se almacenen codigos de socios junto a su cantidad de prestamos.
    
 B) Implementar un modulo que reciba la estructura generada en A) y un ISBN y retorne la cantidad de prestamos de ese
    ISBN.
    
 C) Realizar un modulo recursivo que reciba la estructura generada en A) ii y un valor X y retorne la cantidad de socios
    con cantidad de prestamos superior al valor X.
    
 NOTA: Implementar el programa principal, que invoque a los incisos A, B y C. En caso de ser necesario, puede utilizar los
       modulos que se encunetran a continuacion.}

program parcialBiblioteca;
type
    prestamo = record
        nroPrestamo:integer;
        ISBN:integer;
        codSocio:integer;
    end;

    arbol = ^nodoA;
    nodoA = record
        dato:prestamo;
        hi:arbol;
        hd:arbol;
    end;

    socio = record
        cod:integer;
        cant:integer;
    end;

    lista = ^nodoL;
    nodoL = record
        dato:socio;
        sig:lista;
    end;

//-------------------------[ INCISO C ]---------------------------
procedure incisoC(l:lista; sup:integer; var cantSup:integer);
begin
    if (l <> nil) then begin 
        if (l^.dato.cant > sup) then
            cantSup:= cantSup + 1;
        incisoC(l^.sig,sup,cantSup);
    end;
end;

//-------------------------[ INCISO B ]---------------------------
procedure incisoB(a:arbol; ISBN:integer; var cant:integer);
begin
    if (a <> nil) then begin
        if (ISBN = a^.dato.ISBN) then
            cant:= cant + 1;
        if (ISBN < a^.dato.ISBN) then 
            incisoB(a^.hi,ISBN,cant)
        else
            incisoB(a^.hd,ISBN,cant);
    end;
end;
//-----------------------[ TEST PRUEBA ]--------------------------
procedure imprimirArbol(l:lista);
begin
    while (l <> nil) do begin
        writeln ('> El codigo de socio: ',l^.dato.cod,' y la cantidad de prestamo: ',l^.dato.cant);
        l:= l^.sig;
    end;
end;
procedure imprimirArbol(a:arbol);
begin
    if (a <> nil) then begin
        imprimirArbol(a^.hi);
    	writeln ('> El ISBN del libro: ',a^.dato.ISBN);
        writeln ('- El numero de prestamo: ',a^.dato.nroPrestamo);
        writeln ('- El codigo de socio: ',a^.dato.codSocio);
        writeln;
        imprimirArbol(a^.hd);
    end;
end;
//-------------------------[ INCISO A ]---------------------------
procedure incisoA(var a:arbol; var l:lista);

    procedure agregarListas(var l:lista; codSocio,cant:integer);
    var
        nue:lista;
    begin
        new(nue);
        nue^.dato.cod:= codSocio;
        nue^.dato.cant:= cant;
        nue^.sig:= l;
        l:= nue;
    end;
    procedure cargarArbol(var a:arbol; p:prestamo);
    begin
        if (a = nil) then begin
            new (a);
            a^.dato:= p;
            a^.hi:= nil;
            a^.hd:= nil;
        end
        else if (a^.dato.ISBN > p.ISBN) then
                cargarArbol(a^.hi,p)
            else
                cargarArbol(a^.hd,p);
    end;
    procedure leer(var p:prestamo);
    begin
        p.codSocio:= random(15);
        if (p.codSocio <> 0) then begin
            p.ISBN:= random(300-100)+100;
            p.nroPrestamo:= random(500-300)+300;
        end;
    end;

var
    p:prestamo;
    actualSocio,cant:integer;
begin
    leer(p);
    while (p.codSocio <> 0) do begin
        actualSocio:= p.codSocio;
        cant:= 0;
        while (p.codSocio <> 0) and (p.codSocio = actualSocio) do begin
            cant:= cant + 1;
            cargarArbol(a,p);
            leer(p);
        end;
        agregarListas(l,actualSocio,cant);
    end;
end;
//----------------------------------------------------------------
var
    a:arbol;
    l:lista;
    ISBN,cant,cantSup:integer;
    sup:integer;
begin
    a:= nil;
    l:= nil;
    randomize;
    incisoA(a,l);
    imprimirArbol(a);
    writeln('***********************************');
    imprimirArbol(l);
    writeln('***********************************');
    cant:= 0;
    write ('> Ingrese el ISBN: '); readln(ISBN);
    incisoB(a,ISBN,cant);
    writeln ('- Ese ISBN ',ISBN, ', la cantidad de prestamos: ',cant);
    writeln('***********************************');
    cantSup:= 0;
    write ('> Ingrese el valor X: '); readln(sup);
    incisoC(l,sup,cantSup);
    writeln('- La cantidad de socio con cantidad de prestamos superior al valor ',sup,': ',cantSup);
end.