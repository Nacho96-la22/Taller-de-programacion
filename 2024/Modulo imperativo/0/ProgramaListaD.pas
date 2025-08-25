program ProgramaListaD;
type
    lista = ^nodo;
    nodo = record
        dato:integer;
        sig:lista;
    end;

    listaO = ^nodo2;
    nodo2 = record
        dato:Integer;
        sig:listaO;
    end;

//--------------------------------------------------------------------
procedure buscarElemento (lo:listaO);

    function buscar (nro:integer; lo:listaO):boolean;
    var
        ok:boolean;
    begin
        ok:= false;
        while (lo <> nil) and (ok <> true) do begin
            if (nro = lo^.dato) then
                ok:= true
            else
                ok:= false;
            lo:= lo^.sig;
        end;
        buscar:= ok;
    end;

var
    nro:integer;
begin
    writeln('- BUSCAR UN NUMERO EXISITIDO:'); 
    write ('> Ingrese un numero: '); readln (nro);
    writeln('Verifica el nro ', nro , ' es ', buscar(nro,lo));
end;
procedure imprimirListas (lo:listaO);
begin
    while (lo <> nil) do begin
        writeln('> ',lo^.dato);
        writeln('**************');
        lo:= lo^.sig;
    end;
end;
procedure listaOrdenada(l:lista; var lo:listaO);

    procedure ordenada (num:integer; var lo:listaO);
    var
        nue,ant,act:listaO;
    begin
        new(nue);
        nue^.dato:= num;
        act:= lo; ant:= lo;
        while (act <> nil) and (act^.dato < num) do begin
            ant:= act;
            act:= act^.sig;
        end;
        if (ant = act) then
            lo:= nue
        else
            ant^.sig:= nue;
        nue^.sig:= act;
    end;

begin
    while (l <> nil) do begin
        ordenada(l^.dato,lo);
        l:= l^.sig;
    end;
end;
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
    lo:listaO;
begin
    randomize;
    l:= nil;
    lo:= nil;
    cargarListas(l);
    imprimirListas(l);
    writeln('::::::::::::::');   
    buscarElemento(l);
    writeln('::::::::::::::');
    listaOrdenada(l,lo);
    imprimirListas(lo);
    buscarElemento(lo);
end.