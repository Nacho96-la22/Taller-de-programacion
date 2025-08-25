{2. Una agencia dedicada a la venta de autos ha organizado su stock y, tiene la información de
    los autos en venta. Implementar un programa que:
    
    A) Genere la información de los autos (patente, año de fabricación (2010..2018), marca y
       modelo, finalizando con marca ‘MMM’) y los almacene en dos estructuras de datos:
       i.  Una estructura eficiente para la búsqueda por patente.
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

program ejercicio2Patente;
type
    rangoAnio = 2010..2018;
    cadena20 = String[20];
    cadena7 = String[7];

    auto = record
        patente:cadena7;
        anioFab:rangoAnio;
        marca:cadena20;
        modelo:cadena20;
    end;

    arbolPatente = ^nodo1;
    nodo1 = record
        dato:auto;
        hi:arbolPatente;
        hd:arbolPatente;
    end;

    autoAnio = record
        patente:cadena7;
        marca:cadena20;
        modelo:cadena20;
    end;

    listaAuto = ^nodo4;
    nodo4 = record
        dato:autoAnio;
        sig:listaAuto;
    end;

    vectorAnio = array [rangoAnio] of listaAuto;

//-------------------[ INCISO E ]--------------------
function incisoE(aI:arbolPatente; patente:String):String;
begin
    if (aI = nil) then 
        incisoE:= ''
    else begin
            if (aI^.dato.patente = patente) then
                incisoE:= aI^.dato.modelo
            else if (aI^.dato.patente > patente) then
                    incisoE(aI^.hi,patente)
                else
                    incisoE(aI^.hd,patente)
        end; 
end;
//-------------------[ INCISO D ]--------------------
procedure imprimirVector (v:vectorAnio);

    procedure imprimir (l:listaAuto);
    begin
        while (l <> nil) do begin
            writeln ('- Patente: ',l^.dato.patente,', marca: ',l^.dato.marca,' y modelo: ',l^.dato.modelo);
            writeln;
            l:= l^.sig
        end;
    end;

var
    i:Integer;
    aux:listaAuto;
begin
    for i:= 2010 to 2018 do begin
        aux:= v[i];
        writeln ('> ',i,':');
        if (aux <> nil) then begin
            imprimir(aux);
        end
        else
            writeln ('+ No hay informacion.');
    end;
end;
procedure incisoD(aI:arbolPatente; var v:vectorAnio);

    procedure agregarAdelante(var l:listaAuto; aut:auto);
    var
        nue:listaAuto;
    begin
        new(nue);
        nue^.dato.patente:= aut.patente;
        nue^.dato.marca:= aut.marca;
        nue^.dato.modelo:= aut.modelo;
        nue^.sig:= l;
        l:= nue;
    end;

begin
    if (aI <> nil) then begin
        agregarAdelante(v[aI^.dato.anioFab],aI^.dato);
        incisoD(aI^.hi,v);
        incisoD(aI^.hd,v);
    end;
end;
procedure inicializarVector(var v:vectorAnio);
var
    i:integer;
begin
    for i:= 2010 to 2018 do
        v[i]:= nil
end;
//-------------------[ INCISO B ]--------------------
procedure incisoB(aI:arbolPatente; marca:String; var cantMarca:integer);
begin
    if (aI <> nil) then begin
        if (marca = aI^.dato.marca) then 
            cantMarca:= cantMarca + 1;
        incisoB(aI^.hi,marca,cantMarca);
        incisoB(aI^.hd,marca,cantMarca);
    end;
end;
//---------------------[ TEST ]----------------------
procedure imprimirPatente(aI:arbolPatente);
begin
    if (aI <> nil) then begin
        imprimirPatente(aI^.hi);
        writeln('> Patente: ',aI^.dato.patente);
        writeln('- El anio de fabricacion: ',aI^.dato.anioFab);
        writeln('- Marca: ',aI^.dato.marca);
        writeln('- Modelo: ',aI^.dato.modelo);
        writeln;
        imprimirPatente(aI^.hd);
    end;
end;
//-------------------[ INCISO A ]--------------------
procedure incisoA(var aI:arbolPatente);

    procedure cargarPatente(var aI:arbolPatente; a:auto);
    begin
        if (aI = nil) then begin
            new(aI);
            aI^.dato:= a;
            aI^.hi:= nil;
            aI^.hd:= nil;
        end
        else if (aI^.dato.patente > a.patente) then
                cargarPatente(aI^.hi,a)
            else
                cargarPatente(aI^.hd,a);
    end;
    procedure leer(var a:auto);
    var
        marca:array[0..5] of String = ('Ford','WV','Toyota','Renualt','Nissian','MMM');
        modelo: array[0..4] of String = ('Fiesta','Gol Trend','Hilux','Clio','A1');
        patente:array[0..2] of String = ('KKUUU01','UUHDJ02','PPLLL03');
    begin
        a.marca:= marca[random(6)];
        if (a.marca <> 'MMM') then begin
            a.modelo:= modelo[random(5)];
            a.patente:= patente[random(3)];
            a.anioFab:= random(2018-2010)+2010;
        end; 
    end;

var
    a:auto;
begin
    leer(a);
    while (a.marca <> 'MMM') do begin
        cargarPatente(aI,a);
        leer(a);
    end;
end;
//---------------------------------------------------
var
    aI:arbolPatente;
    marca,patente,modelo:String;
    cantMarca:integer;
    v:vectorAnio;
begin
    aI:= nil;
    randomize;
    incisoA(aI);
    imprimirPatente(aI);
    writeln('/////// BUSCAR UNA MARCA EN ARBOL DE PATENTE \\\\\\\');
    cantMarca:= 0;
    write ('> Ingrese una marca: '); readln(marca);
    incisoB(aI,marca,cantMarca);
    writeln ('- La cantidad de autos de dicha ',marca,': ',cantMarca);
    writeln('///////// INFORMACION POR AGRUPAR LOS ANIOS \\\\\\\\\\');
    inicializarVector(v);
    incisoD(aI,v);
    imprimirVector(v);
    writeln('///// BUSCAR UNA PATENTE PARA INFORME EL MODELO  \\\\\');
    write ('> Ingrese una patente: '); readln(patente);
    modelo:= incisoE(aI,patente);
    if (modelo <> '') then
        writeln ('- Modelo del auto con dicha ',patente,': ',modelo)
    else
        writeln ('- No existe esa patente.');
end.