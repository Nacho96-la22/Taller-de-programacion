{Un psicólogo necesita un sistema para administrar a sus pacientes. De cada paciente registra: dni, 
 cód. de paciente, obra social (1: ioma 2: pami 3: osde 4: galeno 5: no tiene) y costo abonado por
 sesión. Implemente un programa que:

 a) Genere un ABB ordenado por cód. de paciente. Para ello, genere información hasta el paciente con
    dni 0.
 A partir del ABB, realice módulos (uno por inciso) para:
 b) Generar una estructura con código y nombre de los pacientes de ioma, sabiendo que cómo máximo 
    son 50. La estructura debe ordenarse por código descendentemente.
 c) Informar los datos de los pacientes cuyo código está comprendido entre dos valores.
 
 NOTA: Realice el programa principal que invoque a los módulos desarrollados.}

program Psicologa;
const
    dimF = 50;
type
    rangoObraSocial = 1..5;

    paciente = record
        DNI:integer;
        cod:integer;
        obraSocial:rangoObraSocial;
        abonado:real;
    end;

    arbol = ^nodoA;
    nodoA = record
        datos:paciente;
        hi:arbol;
        hd:arbol;
    end;

    IOMA = record
        cod:integer;
        nombre:string;
    end;

    vectorIoma = array [1..dimF] of IOMA;

//--------------------------> INCISO B <--------------------------------------
procedure incisoB (a:arbol; var v:vectorIoma; var i:integer);

    {procedure cargarVector (a:arbol; var v:vectorIoma; var i:Integer);
    var
        nom:string;
    begin
        i:= i+1;
        write ('Ingrese nombre del paciente: '); readln (nom);
        v[i].cod:= a^.datos.cod;
        v[i].nombre:= nom;
    end;}

var
    codActual:integer;
    nom:string;
begin
    if (a <> nil) then begin
        codActual:= a^.datos.cod;
        i:= i+1;
        if (a^.datos.obraSocial = 1) then begin
            //cargarVector(a,v,i);
            if (i <= dimF) then begin
                write ('Ingrese nombre del paciente: '); readln (nom);
                v[i].cod:= a^.datos.cod;
                v[i].nombre:= nom;
            end;
        end;
    end
    else if (a^.datos.cod > codActual) then 
            incisoB(a^.hi,v,i)
        else
            incisoB(a^.hd,v,i);
end;
//--------------------------> INCISO A <--------------------------------------
procedure imprimirArbol(a:arbol);
begin
    if (a <> nil) then begin
        imprimirArbol (a^.hi);
        writeln ('> El DNI: ', a^.datos.DNI);
        writeln ('- El codigo de paciente: ', a^.datos.cod);
        writeln ('- La obra de social: ', a^.datos.obraSocial);
        writeln ('- Costo abonado: ', a^.datos.abonado:4:2);
        writeln('------------------------');
        imprimirArbol (a^.hd);
    end;
end;
procedure incisoA (var a:arbol);

    procedure cargarArbol(var a:arbol; p:paciente);
    begin
        if (a = nil) then begin
            new(a);
            a^.datos:= p;
            a^.hi:= nil;
            a^.hd:= nil;
        end
        else if (p.cod < a^.datos.cod) then 
                cargarArbol(a^.hi, p)
            else
                cargarArbol(a^.hd, p);
    end;
    procedure leerPaciente(var p:paciente);
    begin
        writeln ('> Ingrese el DNI:');
        readln (p.DNI);
        if (p.DNI <> 0) then begin
            p.cod:= random(100)+1;
            p.obraSocial:= random(5)+1;
            p.abonado:= random(100)+1;
        end;
    end;

var
    p:paciente;
begin
    leerPaciente(p);
    while (p.DNI <> 0) do begin
        cargarArbol(a,p);
        writeln('------------------------');
        leerPaciente(p);
    end;
end;
//----------------------------------------------------------------------------
var
    i:integer;
    a:arbol;
    v:vectorIoma;
begin
    randomize;
    a:= nil;
    i:= 0;
    writeln('::::::::::::::::::::::> INFORMACION DE PACIENTES <::::::::::::::::::::::');
    incisoA(a);
    writeln ();
    imprimirArbol(a);
    writeln(':::::::::::::::::::::::::> INFORMACION DE IOMA <::::::::::::::::::::::::');
    incisoB(a,v,i);
end.