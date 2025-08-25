{Se desea analizar la informacion de documentos impresos en un laboratorio durante 2022. De cada documento impreso
 se conoce: codigo del usuario que imprimio, cantidad de paginas impresas, dia y mes. Realice un programa que contenga
 e invoque a:
 
 A) Un modulo que lea la informacion de documentos impresos y retorne una estructura con todos los registros leidos. 
    La estructura debe ser eficiente para buscar por codigo de usuario. La lectura finaliza con codigo 0.
    
 B) Un modulo que reciba la estructura generada en A) y dos valores X e Y, retorne una lista con todos los documentos
    impresos cuyo codigo de usuario esta entre X e Y.
    
 C) Un modulo recursivo que reciba la lista generada en B) y retorne la suma total de paginas impresas de los 
    documentos contenidos en la lista.}

program parcialLaboratorio;
type
    rangoDia = 1..31;
    rangoMes = 1..12;

    calendario = record
        dia:rangoDia;
        mes:rangoMes;
    end;

    documento = record
        codUsu:integer;
        cantPag:integer;
        fecha:calendario;
    end;

    arbol = ^nodoA;
    nodoA = record
        dato:documento;
        hi:arbol;
        hd:arbol;
    end;

    lista = ^nodoL;
    nodoL = record
        dato:documento;
        sig:lista;
    end;
//-----------------[ INCISO C ]------------------
function incisoC(l:lista):integer;
begin
    if (l = nil) then
        incisoC:= 0
    else begin
            incisoC:= incisoC(l^.sig) + l^.dato.cantPag;
        end;
end;
//-----------------[ INCISO B ]------------------
procedure imprimirLista(l:lista);
begin
    while (l <> nil) do begin
        writeln('> El codigo de usuario: ',l^.dato.codUsu,', la cantidad de pagina: ',l^.dato.cantPag,' y la fecha: ',l^.dato.fecha.dia,'/',l^.dato.fecha.mes);
        l:= l^.sig;
    end;
end;
procedure incisoB(a:arbol; var l:lista; x,y:integer);

    procedure agregarAdelante(var l:lista; d:documento);
    var
        nue:lista;
    begin
        new(nue);
        nue^.dato:= d;
        nue^.sig:= l;
        l:= nue;
    end;

begin
    if (a <> nil) then begin
        if (x <= a^.dato.codUsu) and (y >= a^.dato.codUsu) then begin
            agregarAdelante(l,a^.dato);
            incisoB(a^.hi,l,x,y);
            incisoB(a^.hd,l,x,y);
        end
        else if (x < a^.dato.codUsu) then
                incisoB(a^.hi,l,x,y)
            else 
                incisoB(a^.hd,l,x,y);
    end;
end;
//---------------[ TEST PRUEBA ]-----------------
procedure imprimirArbol(a:arbol);
begin
    if (a <> nil) then begin
        imprimirArbol(a^.hi);
        writeln ('> El codigo de usuario: ',a^.dato.codUsu,', la cantidad de paginas: ',a^.dato.cantPag,' y la fecha: ',a^.dato.fecha.dia,'/',a^.dato.fecha.mes);
        imprimirArbol(a^.hd);
    end;
end;
//-----------------[ INCISO A ]------------------
procedure incisoA(var a:arbol);

    procedure cargarArbol(var a:arbol; d:documento);
    begin
        if (a = nil) then begin
            new(a);
            a^.dato:= d;
            a^.hi:= nil;
            a^.hd:= nil;
        end
        else if (a^.dato.codUsu > d.codUsu) then
                cargarArbol(a^.hi,d)
            else
                cargarArbol(a^.hd,d)
    end;
    procedure leer (var d:documento);
    begin
        d.codUsu:= random (100);
        if (d.codUsu <> 0) then begin
            d.cantPag:= random (300)+1;
            d.fecha.dia:= random(31)+1;
            d.fecha.mes:= random(12)+1;
        end;
    end;

var
    d:documento;
begin
    leer(d);
    while (d.codUsu <> 0) do begin
        cargarArbol(a,d);
        leer(d);
    end;
end;
//-----------------------------------------------
var
    a:arbol;
    l:lista;
    x,y:integer;
begin
    a:= nil;
    randomize;
    incisoA(a);
    imprimirArbol(a);
    writeln('*******************************************');
    l:= nil;
    write ('> Ingrese un valor de X: '); readln(x);
    write ('> Ingrese un valor de Y: '); readln(y);
    incisoB(a,l,x,y);
    imprimirLista(l);
    writeln('*******************************************');
    writeln ('> La suma total de pagina impresas: ',incisoC(l));
end.