{2. Una agencia dedicada a la venta de autos ha organizado su stock y, dispone en papel de la
    información de los autos en venta. Implementar un programa que:
    A) Lea la información de los autos (patente, año de fabricación (2010..2018), marca y
       modelo) y los almacene en dos estructuras de datos:
       i. Una estructura eficiente para la búsqueda por patente.
       ii. Una estructura eficiente para la búsqueda por marca. Para cada marca se deben
           almacenar todos juntos los autos pertenecientes a ella.
    B) Invoque a un módulo que reciba la estructura generado en a) i y una marca y retorne la
       cantidad de autos de dicha marca que posee la agencia.
    C) Invoque a un módulo que reciba la estructura generado en a) ii y una marca y retorne
       la cantidad de autos de dicha marca que posee la agencia.
    D) Invoque a un módulo que reciba el árbol generado en a) i y retorne una estructura con
       la información de los autos agrupados por año de fabricación.
    E) Invoque a un módulo que reciba el árbol generado en a) i y una patente y devuelva el
       modelo del auto con dicha patente.
    F) Invoque a un módulo que reciba el árbol generado en a) ii y una patente y devuelva el
       modelo del auto con dicha patente.}

program ejercicio2;
type
    rangoAnio = 2010..2018;
    auto = record
        patente:string[10];
        anioFabrica:rangoAnio;
        marca:string;
        modelo:string;
    end;

    arbolPatente = ^nodo1;
    nodo1 = record
        datos:auto;
        hi:arbolPatente;
        hd:arbolPatente;
    end;

    arbolMarca = ^nodo2;
    nodo2 = record
        datos:auto;
        hi:arbolMarca;
        hd:arbolMarca;
    end;
//------------------------------------------------------------------------------------------
procedure crearArbolPatente (var ap:arbolPatente; a:auto);
begin
    if (ap <> nil) then begin
        new (ap);
        ap^.datos:= a;
        ap^.hi:= nil;
        ap^.hd:= nil;
    end
    else if (ap^.datos.patente) then 
end;
procedure leerAuto (var a:auto);
begin
    writeln ('Ingrese el patente:');
    readln (a.patente);
    if (a.patente <> 'ZZZ') then begin
        a.anioFabrica:= random(2018) +1;
        writeln ('Ingrese la marca:');
        readln (a.marca);
        writeln ('Ingrese el modelo:');
        readln (a.modelo);
    end;
end;
procedure cargarArboles (var ap:arbolPatente; var am:arbolMarca);
var
    a:auto;
begin
    leerAuto (a);
    while (a.patente <> 'ZZZ') do begin
        crearArbolPatente (ap, a);
        crearArbolMarca (am, a);
        leerAuto (a);
    end;
end;
//------------------------------------------------------------------------------------------
var
    ap:arbolPatente;
    am:arbolMarca;
begin
    randomize;
    ap:= nil;
    am:= nil;
    cargarArboles (ap, am);
end.