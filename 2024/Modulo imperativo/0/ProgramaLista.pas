program ProgramaLista;
type
    lista = ^nodo;
    nodo = record
        dato:integer;
        sig:lista;
    end;

//--------------------------------------------------------------------
procedure buscarElemento (l:lista);

    function buscar (nro:integer; l:lista):boolean;
    var
        ok:boolean;
    begin
        ok:= false;
        while (l <> nil) and (ok <> true) do begin
            if (nro = l^.dato) then
                ok:= true
            else
                ok:= false;
            l:= l^.sig;
        end;
        buscar:= ok;
    end;

var
    nro:integer;
begin
    writeln('- BUSCAR UN NUMERO EXISITIDO:'); 
    write ('> Ingrese un numero: '); readln (nro);
    writeln('Verifica el nro ', nro , ' es ', buscar(nro,l));
end;
procedure imprimirListas (l:lista);
begin
    while (l <> nil) do begin
        writeln('> ',l^.dato);
        writeln('**************');
        l:= l^.sig;
    end;
end;
procedure agregarAdelante (var l:lista; num:integer);
var
    nue:lista;
begin
    new(nue);
    nue^.dato:= num;
    nue^.sig:= l;
    l:= nue;
end;
procedure cargarListas (var l:lista);
var
    num:integer;
begin
    num:= random(150-100)+100;
    while (num <> 120) do begin
        agregarAdelante(l,num);
        num:= random(150-100)+100;
    end;
end;
//--------------------------------------------------------------------
var
    l:lista;
begin
    randomize;
    l:= nil;
    cargarListas(l);
    imprimirListas(l);
    writeln('::::::::::::::');   
    buscarElemento(l);
end.