{Una clinica necesita un sistema para el procesamiento de las atenciones realizadas a los pacientes.

 a) Implementar un modulo que lea informacion de las atenciones. De cada atencion se lee: DNI del 
    paciente, numero de mes y codigo de diagnostico (1 a 15). La lectura finaliza con el mes 0.
    El modulo debe retornar dos estructuras de datos:
    i. Una estructura de datos eficiente para la busqueda por DNI del paciente. Para cada DNI debe
       almacenarse la cantidad total de atenciones recibidas.
    ii.Otra estructura de datos con la cantidad de atenciones realizadas para cada diagnostico.
 
 b) Implementar un modulo que reciba la estructura generada en a)i, dos numeros de DNI y un valor entero x.
    Este modulo debe retornar la cantidad de pacientes con mas de x atenciones cuyos DNI estan entre los 
    dos numeros de DNI recibidos.
    
 c) Implementar un modulo recursivo que reciba la estrcutra generada en a)ii, retorne la cantidad de
    diagnosticos para los cuales la cantidad de atenciones fue 0.
    
 NOTA: Implementar el programa principal, que invoque a los incisos a, b y c. En caso de ser necesario,
       puede utilizar los modulos que se encuentran a continuacion.}

program clinica;
type
    //rangoMes = 1..12;
    rangoDiagnostico = 1..15;

    atencion = record
        DNI:integer;
        mes:integer;
        diag:rangoDiagnostico;
    end;

    paciente = record //A.ii
        DNI:integer;
        cantAte:integer;
    end;

    arbol = ^nodoA;
    nodoA = record //A.ii
        datos:paciente;
        hi:arbol;
        hd:arbol;
    end;

    vectorDiagnostico = array [rangoDiagnostico] of integer;// A.i)

//------------------------/ INCISO C \----------------------------
function incisoC (v:vectorDiagnostico; dimF:integer):integer;
begin
    if (dimF = 0) then begin
        incisoC:= 0
    end
    else begin
            incisoC:= incisoC(v, dimF-1);
            if (v[dimF] = 0) then
                incisoC:= incisoC + 1;
        end;
end;

{function incisoCV2 (v:vectorDiagnostico; dimF:integer):integer;   // esa es la segunda version que sirve funcionar
begin
    if (dimF <> 0) then begin
        incisoC:= incisoC(v, dimF-1);
        if (v[dimF] = 0) then
            incisoC:= incisoC + 1;
    end
    else
        incisoC:= 0;
end;}
//------------------------/ INCISO B \----------------------------
procedure incisoB (a:arbol; num1, num2:integer; var cantTA:integer);
begin
    if (a <> nil) then begin
        if ((num1 <= a^.datos.DNI) and (a^.datos.DNI <= num2)) then begin
            cantTA:= a^.datos.cantAte + cantTA;
            incisoB(a^.hi, num1, num2, cantTA);
            incisoB(a^.hd, num1, num2, cantTA);
        end
        else if (num1 < a^.datos.DNI) then
                incisoB(a^.hi, num1, num2, cantTA)
            else
                incisoB(a^.hd, num1, num2, cantTA);
    end;
end;
//------------------/ TESTING INFORMACION \-----------------------
procedure informarAtencion (v:vectorDiagnostico);
var
    i:integer;
begin
    for i:= 1 to 15 do begin
        writeln ('> ', i ,' codigo de diagonstico se ha atentado ', v[i],' cantidad.');
    end;
end;
procedure informarPaciente (a:arbol);
begin
    if (a <> nil) then begin
        informarPaciente (a^.hi);
        writeln ('> El DNI: ', a^.datos.DNI);
        writeln ('+ La cantidad total de atenciones recibidas: ', a^.datos.cantAte);
        writeln ();
        informarPaciente (a^.hd);
    end;
end;
//------------------------/ INCISO A \----------------------------
procedure incisoA (var a:arbol; var v:vectorDiagnostico);

    procedure cargarArbol (var a:arbol; ap:atencion);
    begin
        if (a = nil) then begin
            new(a);
            a^.datos.DNI:= ap.DNI;
            a^.datos.cantAte:= 1;
            a^.hi:= nil;
            a^.hd:= nil;
        end
        else if (ap.DNI = a^.datos.DNI) then
                a^.datos.cantAte:= a^.datos.cantAte + 1
            else if (ap.DNI < a^.datos.DNI) then
                    cargarArbol (a^.hi, ap)
                else
                    cargarArbol (a^.hd, ap);
    end;
    procedure leerPaciente(var ap:atencion);
    begin
        writeln ('> Ingrese el mes:');
        readln(ap.mes);
        if (ap.mes <> 0) then begin
            ap.DNI:= random(20)+1;// es prueba que sea mas corto
            ap.diag:= random(15)+1;
        end;
    end;

var
    ap:atencion;
begin
    leerPaciente(ap);
    while (ap.mes <> 0) do begin
        v[ap.diag]:= v[ap.diag]+ 1;
        cargarArbol(a,ap);
        writeln ('******************');
        leerPaciente(ap);
    end;
end;
procedure inicializarVector (var v:vectorDiagnostico);
var
    i:integer;
begin
    for i:= 1 to 15 do
        v[i]:= 0;
end;
//----------------------------------------------------------------
var
    a:arbol;
    v:vectorDiagnostico;
    num1,num2, cantTA:integer;
    dimF:integer;
begin
    randomize;
    a:= nil;
    inicializarVector(v);
    writeln ('/////////////// CLINICA \\\\\\\\\\\\\\\'); // A
    incisoA(a, v);
    writeln ('/////// INFORMACION DE PACIENTE \\\\\\\');
    informarPaciente (a);
    writeln ('///// INFORMACION DE DIAGNOSTICO \\\\\\');
    informarAtencion (v);
    writeln ('// INFORMA ENTRE DOS DNI POR LA CANTIDAD DE ATENTOS \\'); // B
    cantTA:= 0;
    write ('> Ingrese el inicio de DNI: '); readln (num1);
    write ('> Ingrese el final de DNI: '); readln (num2);
    incisoB(a, num1, num2, cantTA);
    writeln ('> El resultado de la cantidad de pacientes con mas de atenciones que fue ', cantTA);
    writeln ('/// INFORMA NO ATENTIDERON UNOS CODIGOS DE DIAGNOTICOS \\'); // C
    dimF:= 15;
    writeln ('> La cantidad de diagnoticos que no atendieron que fue el resultado es ',incisoC(v, dimF));
end.