program ejercicio2;
const
    A = 100;
    B = 200;
type
    lista = ^nodo;
    nodo = record
        dato:integer;
        sig:lista;
    end;

//-------------------------[ INCISO E ]-------------------------------
procedure incisoE(l:lista);

    function buscar(l:lista; nro:integer):boolean;
    var
        ok:boolean;
    begin
        if (l = nil) then 
            ok:= false
        else if (nro = l^.dato) then   
                ok:= true
            else
                ok:= buscar(l^.sig,nro);
        buscar:= ok;
    end;

var
    nro:integer;
begin
    write ('> Ingrese el numero: '); readln (nro);
    writeln ('Este numero es ', buscar(l,nro));
end;
//-------------------------[ INCISO D ]-------------------------------
function incisoD(l:lista):integer;
var
    min:integer;
begin
    if (l <> nil) then begin
        min:= incisoD(l^.sig);
        if (min > l^.dato) then
            min:= l^.dato;
        incisoD:= min;
    end
    else
        incisoD:= 999;
end;
//-------------------------[ INCISO C ]-------------------------------
procedure incisoC(l:lista);
begin
    if (l <> nil) then begin
        incisoC(l^.sig);
        writeln('-------------------');
        writeln('- ',l^.dato);
    end;
end;
//-------------------------[ INCISO B ]-------------------------------
procedure incisoB(l:lista);
begin
    if (l <> nil) then begin
        writeln('- ',l^.dato);
        writeln('-------------------');
        incisoB(l^.sig);
    end;
end;
//-------------------------[ INCISO A ]-------------------------------
procedure incisoA (var l:lista);
var
    num:integer;
    nue:lista;
begin
    num:= random (B - A)+A;
    if (num <> 100) then begin
        new(nue);
        nue^.dato:= num;
        nue^.sig:= l;
        l:= nue;
        incisoA(l^.sig);
    end;
end;
//--------------------------------------------------------------------
var
    l:lista;
begin
    l:= nil;
    randomize;
    incisoA(l);
    writeln ('> Imprimir la lista recursiva:');
    incisoB(l);
    writeln ('> Imprimir la lista recursiva en orden inverso:');
    incisoC(l);
    writeln ('> El valor minimo es ', incisoD(l));
    incisoE(l);
end.