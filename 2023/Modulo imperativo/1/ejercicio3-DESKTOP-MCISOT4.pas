{3.-Netflix ha publicado la lista de películas que estarán disponibles durante el mes de 
    diciembre de 2022. De cada película se conoce: código de película, código de género
    (1: acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélico, 7: documental
    y 8: terror) y puntaje promedio otorgado por las críticas.
    Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
    A) Lea los datos de películas, los almacene por orden de llegada y agrupados por código
       de género, y retorne en una estructura de datos adecuada. La lectura finaliza cuando
       se lee el código de la película -1.
    B) Genere y retorne en un vector, para cada género, el código de película con mayor puntaje
       obtenido entre todas las críticas, a partir de la estructura generada en a).
    C) Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los
       dos métodos vistos en la teoría.
    D) Muestre el código de película con mayor puntaje y el código de película con menor puntaje,
       del vector obtenido en el punto c).}

program ejercicio3;
type
    rangoGenero = 1..8;
    //Inciso A
    pelicula = record
        codPelicula:integer;
        codGenero:rangoGenero;
        puntajePromedio:real;
    end;
    lista = ^nodo;
    nodo = record
        datos:pelicula;
        sig:lista;
    end;
    vectorGenero = array [rangoGenero] of lista;
    //Inciso B
    regMayorPuntaje = record
        genero:integer;
        codPeliMayor:integer;
        MaxPuntaje:real;
    end;
    vectorPuntaje = array [rangoGenero] of regMayorPuntaje;
//-------------------------------------------------------------------------------------------------
//-------------------------------------------- Inciso D -------------------------------------------
procedure incisoD (vp:vectorPuntaje; dimL:integer);
begin
    writeln ('-----------------------------------------------------------------------------');
    writeln ('------------------> Resultados de mayor y menor puntajes <-------------------');
    writeln ('> Mayor puntaje:');
    writeln ('- El codigo: ', vp[1].codPeliMayor);
    writeln ('- El puntaje: ', vp[1].MaxPuntaje:2:2, ' %');
    writeln ('-----------------------------------------------------------------------------');
    writeln ('> Menor puntaje:');
    writeln ('- El codigo: ', vp[dimL].codPeliMayor);
    writeln ('- El puntaje: ', vp[dimL].MaxPuntaje:2:2, ' %');
end;
//-------------------------------------------- Inciso C -------------------------------------------
procedure incisoC (vp:vectorPuntaje; var dimL:integer);

    procedure imprimirOrdenada (vp:vectorPuntaje; dimL:integer);
    var
        i:integer;
    begin
        writeln ('-----------------------------------------------------------------------------');
        writeln ('--------------> ACTUALIZACION ORDENADA POR MEJORES PUNTAJES <----------------');
        for i:= 1 to dimL do begin
            writeln ('- Genero: ', vp[i].genero);
            writeln ('- El mejor codigo: ', vp[i].codPeliMayor);
            writeln ('- El mejor puntaje: ', vp[i].MaxPuntaje:2:2, ' %');
            writeln ('');
            writeln ('-----------------------------------------------------------------------------');
        end;
    end;
    procedure ordenadaPuntaje (var vp:vectorPuntaje);
    var
        i,j, pos:integer;
        Actual:regMayorPuntaje;
    begin
        for i:= 1 to 8 do begin
            pos:= i;
            for j:= i+1 to 8 do 
                if (vp[j].MaxPuntaje > vp[pos].MaxPuntaje)then
                    pos:= j;
                Actual:= vp[pos];
                vp[pos]:= vp[i];
                vp[i]:= Actual;
        end;
    end;

var
    i:integer;
begin
    for i:= 1 to 8 do begin
        if (vp[i].MaxPuntaje > 0) then
            dimL:= dimL + 1; 
    end;
    ordenadaPuntaje (vp);
    imprimirOrdenada (vp,dimL);
end;
//-------------------------------------------- Inciso B -------------------------------------------
procedure incisoB (var vp:vectorPuntaje; v:vectorGenero);

    procedure imprimirPuntaje (vp:vectorPuntaje);
    var
        i:Integer;
    begin
        writeln ('-----------------------------------------------------------------------------');
        writeln ('---------------------> INFORMACION DE GENEROS MEJORES <----------------------');
        for i:= 1 to 8 do begin
            if (vp[i].MaxPuntaje > 0) then begin
                writeln ('> Genero: ', vp[i].genero);
                writeln ('- El mejor codigo: ', vp[i].codPeliMayor);
                writeln ('- El mejor puntaje: ', vp[i].MaxPuntaje:2:2, ' %');
                writeln ('');
                writeln ('-----------------------------------------------------------------------------');
                end
                else begin
                    writeln ('> Sin informacion.');
                    writeln ('-----------------------------------------------------------------------------');
                end;
        end;
    end;
    procedure PeliculaMayorPuntaje (var vp:vectorPuntaje; v:vectorGenero);
    var
        i:integer;
        l:lista;
    begin
        for i:= 1 to 8 do begin
            l:= v[i];
            vp[i].MaxPuntaje:= -1;
            while (l <> nil) do begin
                if (vp[i].MaxPuntaje < l^.datos.puntajePromedio) then begin
                    vp[i].genero:= l^.datos.codGenero;
                    vp[i].codPeliMayor:= l^.datos.codPelicula;
                    vp[i].MaxPuntaje:= l^.datos.puntajePromedio;
                end;
                l:= l^.sig;
            end;
        end;
    end;

begin
    PeliculaMayorPuntaje (vp, v);
    imprimirPuntaje (vp);
end;
//-------------------------------------------- Inciso A -------------------------------------------
procedure incisoA (var v:vectorGenero);

    procedure imprimirGenero (v:vectorGenero);
    var
        i:integer;
        aux:lista;
    begin
        writeln ('-----------------------------------------------------------------------------');
        writeln ('--------------------------> INFORMACION DE GENERO <--------------------------');
        for i:= 1 to 8 do begin
            aux:= v[i];
            if (aux <> nil) then begin
                writeln ('> Genero: ', i);
                while (aux <> nil) do begin
                    writeln ('El codigo de pelicula: ', aux^.datos.codPelicula);
                    writeln ('El codigo de genero: ', aux^.datos.codGenero);
                    writeln ('El puntaje promedio: ', aux^.datos.puntajePromedio:2:2, ' %');
                    writeln ('');
                    aux:= aux^.sig;
                end;
            end 
            else
                writeln ('No ha informado oficial.'); 
            writeln ('-----------------------------------------------------------------------------');
        end;
    end;
    procedure agregarAtras (var l:lista; p:pelicula);
    var
        pos,nue:lista;
    begin
        new (nue);
        nue^.datos:= p;
        nue^.sig:= nil;
        if (l = nil) then
            l:= nue
        else begin
            pos:= l;
            while (pos^.sig <> nil) do
                pos:= pos^.sig;
            pos^.sig:= nue;
        end; 
    end;
    procedure leer (var p:pelicula);
    begin
        writeln ('Ingrese el codigo de pelicula:');
        readln (p.codPelicula);
        if (p.codPelicula <> -1) then begin
            p.codGenero:= random(8)+1;
            p.puntajePromedio:= random(10)+1;
        end;
    end;
    procedure cargarLista (var v:vectorGenero);
    var
        p:pelicula;
    begin
        writeln ('--------------> NETFLIX HA PUBLICADO LA LISTA DE PELICULAS <-----------------');
        leer (p);
        while (p.codPelicula <> -1) do begin
            agregarAtras (v[p.codGenero], p); // Se carga por cada vector de genero
            writeln ('-----------------------------------------------------------------------------');
            leer (p);
        end;
    end;
    procedure inicializarVector (var v:vectorGenero);
    var
        i:integer;
    begin
        for i:= 1 to 8 do 
            v[i]:= nil;
    end;

begin
    inicializarVector (v);    
    cargarLista(v);
    imprimirGenero (v);
end;
//-------------------------------------------------------------------------------------------------   
var
    v:vectorGenero;
    vp:vectorPuntaje;
    dimL:integer;
begin
    dimL:= 0;
    randomize;
    incisoA (v);
    incisoB (vp, v);
    incisoC (vp,dimL);
    incisoD (vp,dimL);
end.