{Una empresa de alquiler de autos desea procesar la informacion de sus alquileres. Implementar un programa que:
 
 A) Implementar un modulo que lea informacion de los alquileres y retorne una estructura de datos eficiente para
    la busqueda por patente. Para cada patente deben quedar almacenados juntos todos sus alquileres. De cada alquiler
    se lee: DNI del cliente, patente, mes y año. La lectura finaliza con la patente 0.
    
 B) Implementar un modulo que reciba la estructura generada en A) y un DNI D. Este modulo debe retornar la cantidad
    de alquileres realizados por el DNI D.
    
 C) Implementar un modulo que reciba la estructura generada en A), un año X y dos patentes A y B. Este modulo debe 
    retornar la cantidad de alquileres realizados para las patentes entre A y B (incluidas) durante el año X.
    
 NOTA: Implementar el programa principal, que invoque a los incisos A,B y C. En caso de ser necesario, puede utilizar 
       los modulos que se encuentran a continuacion.}

program parcialAlquilerAuto;
type

    alquiler = record
        DNI:integer;
        patente:integer;
        mes:integer;
        anio:integer;
    end;

    arbol = ^nodoA;
    nodoA = record
        dato:alquiler;
        hi:arbol;
        hd:arbol;
    end;
//------------------[ INCISO C ]-------------------
procedure incisoC(a:arbol; X:integer; inf,sup:integer; var cant:integer);
begin
    if (a <> nil) then begin
        if (inf <= a^.dato.patente) and (a^.dato.patente <= sup) then begin
            if (X = a^.dato.anio) then
                cant:= cant + 1;
                incisoC(a^.hi,X,inf,sup,cant); 
                incisoC(a^.hd,X,inf,sup,cant); 
        end
        else if (inf <= a^.dato.patente) then
                incisoC(a^.hi,X,inf,sup,cant)
            else
                incisoC(a^.hd,X,inf,sup,cant); 
    end;
end;
//------------------[ INCISO B ]-------------------
function incisoB(a:arbol; D:integer):integer;
begin
    if (a = nil) then
        incisoB:= 0
    else begin
            if (D = a^.dato.DNI) then
                incisoB:= incisoB(a^.hi,D) + incisoB(a^.hd,D) + 1
            else
                incisoB:= incisoB(a^.hi,D) + incisoB(a^.hd,D);
        end;
end;
//----------------[ TEST PRUEBA ]------------------
procedure imprimirArbol(a:arbol);
begin
    if (a <> nil) then begin
        imprimirArbol(a^.hi);
        writeln ('> Patente: ',a^.dato.patente);
        writeln ('- DNI: ',a^.dato.DNI);
        writeln ('- Mes ',a^.dato.mes,', anio: ',a^.dato.anio);
        writeln();
        imprimirArbol(a^.hd);
    end;
end;
//------------------[ INCISO A ]-------------------
procedure incisoA (var a:arbol);

    procedure cargarArbol(var a:arbol; auto:alquiler);
    begin
        if (a = nil) then begin
            new(a);
            a^.dato:= auto;
            a^.hi:= nil;
            a^.hd:= nil;
        end
        else if (a^.dato.patente > auto.patente) then 
                cargarArbol(a^.hi,auto)
            else
                cargarArbol(a^.hd,auto)
    end;
    procedure leer(var auto:alquiler);
    begin
        auto.patente:= random(100);
        if (auto.patente <> 0) then begin
            auto.DNI:= random(2000-1000)+1000;
            auto.mes:= random(12)+1;
            auto.anio:= random(2024-2000)+2000;
        end;
    end;

var
    auto:alquiler;
begin
    leer(auto);
    while (auto.patente <> 0) do begin
        cargarArbol(a,auto);
        leer(auto);
    end;
end;
//-------------------------------------------------
var
    a:arbol;
    D:integer;
    X,inf,sup,cant:integer;
begin
    a:= nil;
    randomize;
    incisoA(a);
    imprimirArbol(a);
    writeln('************************');
    write ('> Ingrese un DNI: '); readln(D);
    writeln ('- La cantidad de alquileres realizados: ',incisoB(a,D));
    writeln('************************');
    cant:= 0;
    write ('> Ingrese un anio: '); readln(X);
    write ('> Ingrese un patente (inferior): '); readln(inf);
    write ('> Ingrese un patente (superior): '); readln(sup);
    incisoC(a,X,inf,sup,cant);
    writeln ('- La cantidad de alquileres realizados durante este anio ',X,': ',cant);
end.