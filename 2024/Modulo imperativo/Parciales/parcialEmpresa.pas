{Una empresa desdea procesar la informacion de las horas trabajadas por sus empleados durante 2021. Para ello, la
 empresa posee registros de las horas trabajadas por empleado. Cada registro consta del numero de empleado, dia, 
 mes y la cantidad de horas trabajas (a lo sumo 8) para dicho dia y mes.
 
 A) Realizar un modulo que lea la informacion de los empleados y retorne estructura de datos con todos los registros
    leidos. La estructura debe ser eficiente para busqueda por numero de empleado. La lectura finaliza al ingresar un
    registro con dia 0. Se sugiere utilizar el modulo leerRegistro();
 
 B) Realizar un modulo que reciba la estructura generada en A) y dos numeros de empleados X e Y, y retorne todos los
    registros de horas trabajadas por empleados cuyos numeros esten entre X e Y (incluidos).
 
 C) Realizar un modulo recursivo que reciba la estructura generada en B) y retorne la cantidad total de horas trabajadas.}


program parcialEmpresa;
type
    rangoDia = 1..31;
    rangoMes = 1..12;

    calendario = record
        dia:rangoDia;
        mes:rangoMes;
    end;

    empleado = record
        nro:integer;
        fecha:calendario;
        cantHora:integer;
    end;

    arbol = ^nodoA;
    nodoA = record
        dato:empleado;
        hi:arbol;
        hd:arbol;
    end;

    lista = ^nodoL;
    nodoL = record
        dato:empleado;
        sig:lista;
    end;
//--------------------[ INCISO C ]--------------------
function incisoC(l:lista):integer;
begin
    if (l = nil) then
        incisoC:= 0
    else 
        incisoC:= incisoC(l^.sig) + l^.dato.cantHora;
end;
//--------------------[ INCISO B ]--------------------
procedure imprimirListas(l:lista);
begin
    while (l <> nil) do begin
        writeln('> El numero de empleado: ', l^.dato.nro);
        writeln('- La fecha: ', l^.dato.fecha.dia,'/',l^.dato.fecha.mes);
        writeln('- La cantidad de horas trabajada: ',l^.dato.cantHora);
        writeln;
        l:= l^.sig;
    end;
end;
procedure incisoB(a:arbol; x,y:integer; var l:lista);

    procedure agregarAdelante (var l:lista; e:empleado);
    var
        nue:lista;
    begin
        new(nue);
        nue^.dato:= e;
        nue^.sig:= l;
        l:= nue;
    end;

begin
    if (a <> nil) then begin
        if (x <= a^.dato.nro) and (a^.dato.nro <= y) then begin
            agregarAdelante(l,a^.dato);
            incisoB(a^.hi,x,y,l);
            incisoB(a^.hd,x,y,l);
        end
        else if (x < a^.dato.nro) then
                incisoB(a^.hi,x,y,l)
            else
                incisoB(a^.hd,x,y,l);
    end;
end;
//----------------------[ TEST ]----------------------
procedure imprimirArbol(a:arbol);
begin
    if (a <> nil) then begin
        imprimirArbol(a^.hi);
        writeln('> El numero de empleado: ', a^.dato.nro);
        writeln('- La fecha: ', a^.dato.fecha.dia,'/',a^.dato.fecha.mes);
        writeln('- La cantidad de horas trabajada: ',a^.dato.cantHora);
        writeln;
        imprimirArbol(a^.hd);
    end;
end;
//--------------------[ INCISO A ]--------------------
procedure incisoA(var a:arbol);

    procedure cargarArbol(var a:arbol; e:empleado);
    begin
        if (a = nil) then begin
            new(a);
            a^.dato:= e;
            a^.hi:= nil;
            a^.hd:= nil;
        end
        else if (a^.dato.nro > e.nro) then 
                cargarArbol(a^.hi,e)
            else
                cargarArbol(a^.hd,e)
    end;
    procedure leer(var e:empleado);
    begin
        e.nro:= random(50);
        if (e.nro <> 0) then begin
            e.fecha.dia:= random(31)+1;
            e.fecha.mes:= random(12)+1;
            e.cantHora:= random(8)+1;
        end;
    end;

var
    e:empleado;
begin
    leer(e);
    while (e.nro <> 0) do begin
        cargarArbol(a,e);
        leer(e);
    end;
end;
//----------------------------------------------------
var
    a:arbol;
    x,y:integer;
    l:lista;
begin
    a:= nil;
    randomize;
    incisoA(a);
    imprimirArbol(a);
    writeln('*************************');
    l:= nil;
    write ('> Ingrese el numero de X: '); readln(x);
    write ('> Ingrese el numero de Y: '); readln(y);
    incisoB(a,x,y,l);
    writeln('- Imprimiendo entre X e Y:');
    imprimirListas(l);
    writeln('*************************');
    writeln ('> La cantidad total de horas trabajadas: ',incisoC(l));
end.