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

program ejercicio2Marca;
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

    autoMarca2 = record
        modelo:cadena20;
        patente:cadena7;
        anioFab:rangoAnio;
    end;

    listaMarca = ^nodo1;
    nodo1 = record
        dato:autoMarca2;
        sig:listaMarca;
    end;

    autoMarca = record
        marca:cadena20;
        l:listaMarca;
    end;

    arbolMarca = ^nodo2;
    nodo2 = record
        dato:autoMarca;
        hi:arbolMarca;
        hd:arbolMarca;
    end;

//-------------------[ INCISO F ]--------------------
procedure incisoF(aII:arbolMarca; patente:String; var modelo:String; var ok:boolean);

    procedure buscarEnLista(l:listaMarca; patente:String; var modelo:String; var ok:boolean);
    begin
        while (l <> nil) do begin
            if (l^.dato.patente = patente) then begin
                modelo:= l^.dato.modelo;
                ok:= true;
            end;
            l:= l^.sig;
        end;
    end;

begin
    if (aII <> nil) and (not ok) then begin
        buscarEnLista(aII^.dato.l,patente,modelo,ok);
        if (not ok) then begin
            incisoF(aII^.hi,patente,modelo,ok);
            incisoF(aII^.hd,patente,modelo,ok);
        end;
    end;
end;
//-------------------[ INCISO C ]--------------------
procedure incisoC(aII:arbolMarca; marca2:String; var cantMarca2:integer);

    procedure contaLista(l:listaMarca; var cantMarca2:integer);
    begin
        while (l <> nil) do begin
            cantMarca2:= cantMarca2 + 1;
            l:= l^.sig;
        end;
    end;

begin
    if (aII <> nil) then begin
        if (marca2 = aII^.dato.marca) then 
            contaLista(aII^.dato.l,cantMarca2)
        else if (marca2 < aII^.dato.marca) then
                incisoC(aII^.hi,marca2,cantMarca2)
            else
                incisoC(aII^.hd,marca2,cantMarca2);
    end;
end;
//---------------------[ TEST ]----------------------
procedure imprimirMarca(aII:arbolMarca);

    procedure imprimirListas(l:listaMarca);
    begin
        while (l <> nil) do begin
            writeln('- Modelo: ',l^.dato.modelo);
            writeln('- Patente: ',l^.dato.patente);
            writeln('- El anio de fabricacion: ',l^.dato.anioFab);
            writeln;
            l:= l^.sig;
        end;
    end;

begin
    if (aII <> nil) then begin
        imprimirMarca(aII^.hi);
        writeln('> Marca: ',aII^.dato.marca);
        imprimirListas(aII^.dato.l);
        writeln('**********************');
        imprimirMarca(aII^.hd);
    end;
end;
//-------------------[ INCISO A ]--------------------
procedure incisoA(var aII:arbolMarca);

    procedure agregarAdelante (var l:listaMarca; a:auto);
    var
        nue:listaMarca;
    begin
        new(nue);
        nue^.dato.modelo:= a.modelo;
        nue^.dato.patente:= a.patente;
        nue^.dato.anioFab:= a.anioFab;
        nue^.sig:= l;
        l:= nue;
    end;
    procedure cargarMarca(var aII:arbolMarca; a:auto);
    begin
        if (aII = nil) then begin
            new(aII);
            aII^.dato.marca:= a.marca;
            aII^.dato.l:= nil;
            agregarAdelante(aII^.dato.l,a);
            aII^.hi:= nil;
            aII^.hd:= nil;
        end
        else if (aII^.dato.marca = a.marca) then 
                agregarAdelante(aII^.dato.l,a)
            else if (aII^.dato.marca > a.marca) then
                    cargarMarca(aII^.hi,a)
                else
                    cargarMarca(aII^.hd,a)
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
        cargarMarca(aII,a);
        leer(a);
    end;
end;
//---------------------------------------------------
var
    aII:arbolMarca;
    marca:String;
    cantMarca:integer;
    patente,modelo:String;
    ok:boolean;
begin
    aII:= nil;
    randomize;
    incisoA(aII);
    imprimirMarca(aII);
    writeln('///////// BUSCAR UNA MARCA EN ARBOL DE MARCA \\\\\\\\\');
    cantMarca:= 0;
    write ('> Ingrese una marca: '); readln(marca);
    incisoC(aII,marca,cantMarca);
    writeln ('- La cantidad de autos de dicha ',marca,': ',cantMarca);
    writeln('///// BUSCAR UNA PATENTE PARA INFORME EL MODELO  \\\\\');
    modelo:= '';
    ok:= false;
    write ('> Ingrese una patente: '); readln(patente);
    incisoF(aII,patente,modelo,ok);
    if (modelo <> '') then
        writeln ('- Modelo del auto con dicha ',patente,': ',modelo)
    else
        writeln ('- No existe esa patente.');
end.