{La ciudad de La Plata esta organizando un festival de musica. Para ello abrio la inscripcion para que las bandas locales
 puedan participar del festival. De cada banda se desea conocer su nombre, estilo musical (un string) y cantidad de 
 integrantes.
 
 A) Implementar un modulo que permita la inscripcion de las bandas. El ingreso de datos finaliza con la banda que tiene
    cero integrantes. Los datos deben estar almacenados en una estructura ordenada por nombre de banda y ser eficiente 
    para la busqueda por ese criterio.
    
 B) Implementar un modulo que reciba la estructura generada en A) y devuelva una nueva estructura, ordenada por estilo
    musical, con todos los solistas (bandas con cantidad de integrantes igual a uno).
 
 C) Implementar un modulo recursivo que reciba la estructura generada en A) y devuelva el nombre de la banda con mas
    integrantes.
    
 NOTA: Implementar el programa principal, que invoque a los incisos A, B y C.}

program parcialMusicalT1;
type    
    cadena30 = String[30];
    
    banda = record
        nombre:cadena30;
        estiloMus:cadena30;
        cantIntegrantes:integer;
    end;

    arbol = ^nodoA;
    nodoA = record
        dato:banda;
        hi:arbol;
        hd:arbol;
    end;

    lista = ^nodoL;
    nodoL = record
        dato:banda;
        sig:lista;
    end;

//--------------------------> INCISO C <--------------------------
procedure incisoC(a:arbol; var cantMax:integer; var nomMax:cadena30);
begin
    if (a <> nil) then begin
        if (cantMax < a^.dato.cantIntegrantes) then begin
            cantMax:= a^.dato.cantIntegrantes;
            nomMax:= a^.dato.nombre;
        end;
        incisoC(a^.hi,cantMax,nomMax);
        incisoC(a^.hd,cantMax,nomMax);
    end;
end;
//--------------------------> INCISO B <--------------------------
procedure imprimirLista (l:lista);
begin
    while (l <> nil) do begin
        writeln ('> Estilo musical: ',l^.dato.estiloMus,', nombre de banda: ',l^.dato.nombre);
        l:= l^.sig;
    end;
end;
procedure incisoB(a:arbol; var l:lista);

    procedure ordenadaLista(var l:lista; b:banda); 
    var
        nue,ant,act:lista;
    begin
        new(nue);
        nue^.dato:= b;
        ant:= l; 
        act:= l;
        while (act <> nil) and (act^.dato.estiloMus < b.estiloMus) do begin
            ant:= act;
            act:= act^.sig;
        end;
        if (ant = act) then 
            l:= nue
        else
            ant^.sig:= nue;
        nue^.sig:= act;
    end;

begin
    if (a <> nil) then begin
        if (a^.dato.cantIntegrantes = 1) then
            ordenadaLista(l,a^.dato);
        incisoB (a^.hi,l);
        incisoB (a^.hd,l);
    end;
end;
//------------------------> TEST PRUEBA <-------------------------
procedure imprimirArbol(a:arbol);
begin
    if (a <> nil) then begin
        imprimirArbol(a^.hi);
        writeln('> Nombre de la banda: ', a^.dato.nombre,', estilo musical: ',a^.dato.estiloMus,' y la cantidad de integrantes: ',a^.dato.cantIntegrantes);
        imprimirArbol(a^.hd);
    end;
end;
//--------------------------> INCISO A <--------------------------
procedure incisoA (var a:arbol);

    procedure cargarArbol(var a:arbol; b:banda);
    begin
        if (a = nil) then begin
            new(a);
            a^.dato:= b;
            a^.hi:= nil;
            a^.hd:= nil;
        end
        else if (a^.dato.nombre > b.nombre) then
                cargarArbol(a^.hi,b)
            else
                cargarArbol(a^.hd,b)
    end;
    procedure leerRegistro(var b:banda);
    var
        v:array [0..4] of String =('Rock','Rap','hip-hop','Metal','Flamenco');
        vn:array [0..8] of String=('Los Piojos','U2','KISS','Virus','The Mavericks','Oasis','La Adictiva','La Banda','Onda Vaga');
    begin
        b.cantIntegrantes:= random(6);
        //write ('> Ingrese cantidad de integrante: '); readln(b.cantIntegrantes);
        if (b.cantIntegrantes <> 0) then begin
            b.nombre:= vn[random(8)];
            //write ('> Ingrese nombre de banda'); readln(b.nombre);
            b.estiloMus:= v[random(5)];
            //write ('> Ingrese estilo musical: '); readln(b.estiloMus);
        end;
    end;

var
    b:banda;
begin
    leerRegistro(b);
    while (b.cantIntegrantes <> 0) do begin
        cargarArbol(a,b);
        //writeln();
        leerRegistro(b);
    end;    
end;
//----------------------------------------------------------------
var
    a:arbol;
    l:lista;
    cantMax:integer;
    nomMax:cadena30;
begin
    a:= nil;
    randomize;
    incisoA(a);
    imprimirArbol(a);
    l:= nil;
    incisoB(a,l);
    writeln('***************************************************');
    writeln ('> La lista de banda solista:');
    writeln();
    imprimirLista(l);
    writeln('***************************************************');
    cantMax:= -1; nomMax:= '';
    incisoC(a,cantMax,nomMax);
    writeln('> El nombre de la banda con mas integrantes: ', nomMax);
end.