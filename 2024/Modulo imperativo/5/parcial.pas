program parcial;
type
    persona = record
        nom:String;
        edad:integer;
    end;

    arbol = ^nodo;
    nodo = record
        dato:persona;
        hi:arbol;
        hd:arbol
    end;

//-------------------------------------------------
procedure acotado (a:arbol; inf,sup:integer; var cant:integer)
begin
    if (a <> nil) then begin
        if (inf <= a^.dato.nro) and (a^.dato.nro <= sup) then begin
            cant:= cant +1;
            acotado(a^.hi,inf,sup,cant);
            acotado(a^.hd,inf,sup,cant);
        end
        else if (inf < a^.dato.nro) then
                acotado(a^.hi,inf,sup,cant)
            else
                acotado(a^.hd,inf,sup,cant);
    end;
end;
//-------------------------------------------------
function maximoEdad(a:arbol):integer;
begin
    if (a = nil) then
        maximoEdad:= -1
    else if (a^.hd = nil) then
            maximoEdad:= a^.dato.edad
        else
            maximoEdad:= maximoEdad(a^.hd)
end;
procedure imprimir (a:arbol);
begin
    if (a <> nil) then begin
        imprimir(a^.hi);
        writeln('> Nombre: ',a^.dato.nom, ' y ',a^.dato.edad,' edad');
        imprimir(a^.hd);
    end;
end;
//-------------------------------------------------
procedure cargar (var a:arbol);

    procedure cargarArbol (var a:arbol; p:persona);
    begin
        if (a = nil) then begin
            new(a);
            a^.dato:= p;
            a^.hi:= nil;
            a^.hd:= nil;
        end
        else if (a^.dato.edad > p.edad) then
                cargarArbol(a^.hi,p)
            else
                cargarArbol(a^.hi,p)
    end;
    procedure leer (var p:persona);
    var
        n:array[0..5] of String = ('Juana','Victor','Paolo','Martina','Carlos','Dario');
    begin
        p.edad:= random (100);
        if (p.edad <> 0) then 
            p.nom:= n[random (5)];
    end;

var
    p:persona;
begin
    leer(p);
    while (p.edad <> 0) do begin
        cargarArbol(a,p);
        leer(p);
    end;
end;
//-------------------------------------------------
var
    a:arbol;
begin
    a:= Nil;
    randomize;
    cargar(a);
    imprimir(a);
    writeln;
    writeln(maximoEdad(a));
end.