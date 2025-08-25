{La ciudad de La Plata esta organizando un festival de musica. Para ello abrio la inscripcion para que las bandas locales
 puedam participar del festival. De la banda se desea conocer su nombre, estilo musical (codificado numericamente del 1 al
 15) y cantidad de integrantes.
 
 A) Implementar un modulo que permita la inscripcion de las bandas. El ingreso de datos finaliza con la banda que tiene cero
    integrantes. Los datos deben estar almacenados en una estructura agrupada por estilo y ordenada por nombre de banda.
    
 B) Implementar un modulo que reciba la estructura generada en A) y devuelva una nueva estructura con todas las bandas 
    inscriptas ordenada por nombre de mayor a menor (de la Z hasta la A).
    
 C) Implementar un modulo recursivo que reciba la estructura generada en B) y devuelva otra estructura ordenada por nombre
    de banda, pero que solo tenga los solistas (bandas con cantidad de ingresantes igual a uno).
    
 NOTA: Implementar el programa principal, que invoque a los incisos A, B y C.}

program parcialMusicalT2;
type
    cadena30 = String[30];
    rangoMusical = 1..15;

    banda = record
        nombre:cadena30;
        estMusical:rangoMusical;
        cantIntegrantes:integer;
    end;

    lista = ^nodo;
    nodo = record
        dato:banda;
        sig:lista;
    end;

    vectorEstMusical = array [rangoMusical] of lista;
//--------------------------> INCISO C <--------------------------
//--------------------------> INCISO B <--------------------------

//------------------------> TEST PRUEBA <-------------------------
procedure imprimirVector (v:vectorEstMusical);
var
    i:integer;
    aux:lista;
begin
    for i:= 1 to 15 do begin
        aux:= v[i];
        writeln ('> Estilo musical ',i,':');
        if (aux <> nil) then begin
            while (aux <> nil) do begin
                writeln ('- Nombre de la banda: ', aux^.dato.nombre,', cantidad de integrantes: ',aux^.dato.cantIntegrantes);
                aux:= aux^.sig;
            end;
        end
        else
            writeln ('- No hay informacion.');
        writeln ('----------------------------------------------------------');
    end;
end;
//--------------------------> INCISO A <--------------------------
procedure incisoA (var v:vectorEstMusical);

    procedure ordenada (var l:lista; b:banda);
    var
        nue,ant,act:lista;
    begin
        new(nue);
        nue^.dato:= b;
        act:= l; ant:= l;
        while (act <> nil) and (act^.dato.nombre < b.nombre) do begin
            ant:= act;
            act:= act^.sig;
        end;
        if (ant = act) then
            l:= nue
        else
            ant^.sig:= nue;
        nue^.sig:= act;
    end;
    procedure leerBanda(var b:banda);
    var
        n:array[0..5] of String = ('KISS','U2','Oasis','Los piojos','The Mavericks','Onda Vaga');
    begin
        b.cantIntegrantes:= random (6);
        if (b.cantIntegrantes <> 0) then begin
            b.nombre:= n[random(5)];
            b.estMusical:= random(15)+1;
        end;
    end;

var
    b:banda;
begin
    leerBanda(b);
    while (b.cantIntegrantes <> 0) do begin
        ordenada(v[b.estMusical],b);
        leerBanda(b);
    end;
end;
procedure inicializarVector(var v:vectorEstMusical);
var
    i:integer;
begin
    for i:= 1 to 15 do
        v[i]:= nil;
end;
//----------------------------------------------------------------
var
    v:vectorEstMusical;
begin
    randomize;
    inicializarVector(v);
    incisoA(v);
    imprimirVector(v);
    // Inciso B no es necesario porque piden la margen pero me dijeron que ya sacaron
    // Inciso C tampoco como anterior dice
end.