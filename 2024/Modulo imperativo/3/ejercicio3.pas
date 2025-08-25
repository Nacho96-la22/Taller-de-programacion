{3. Implementar un programa que contenga:
 a. Un módulo que lea información de los finales rendidos por los alumnos de la Facultad de
    Informática y los almacene en una estructura de datos. La información que se lee es legajo,
    código de materia, fecha y nota. La lectura de los alumnos finaliza con legajo 0. La estructura
    generada debe ser eficiente para la búsqueda por número de legajo y para cada alumno deben
    guardarse los finales que rindió en una lista.
 b. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con
    legajo impar.
 c. Un módulo que reciba la estructura generada en a. e informe, para cada alumno, su legajo y
    su cantidad de finales aprobados (nota mayor o igual a 4).
 d. Un módulo que reciba la estructura generada en a. y un valor real. Este módulo debe
    retornar los legajos y promedios de los alumnos cuyo promedio supera el valor ingresado.}

program ejercicio3;
type
    rangoDia = 1..31;
    rangoMes = 1..12;
    rangoAnio = 2010..2024;

    calendario = record
        dia:rangoDia;
        mes:rangoMes;
        anio:rangoAnio;
    end;

    final = record
        codMateria:integer;
        fecha:calendario;
        nota:real;
    end;

    lista = ^nodoL;
    nodoL = record
        datos:final;
        sig:lista;
    end;

    alumno = record
        legajo:integer;
        l:lista;
    end;

    arbol = ^nodoA;
    nodoA = record
        datos:alumno;
        hi:arbol;
        hd:arbol;
    end;

    alumnoProm = record
        legajo:integer;
        promedio:real;
    end;

    listaProm = ^nodoP;
    nodoP = record
        datos:alumnoProm;
        sig:listaProm;
    end;
//---------------------- [ INCISO D ] --------------------------
procedure imprimirPromedios (lp:listaProm);
begin
    while (lp <> nil) do begin
        writeln ('> Legajo: ', lp^.datos.legajo);
        writeln ('- Promedio: ', lp^.datos.promedio:2:2,'%');
        writeln();
        lp:= lp^.sig;
    end;
end;
procedure incisoD(a:arbol; var lp:listaProm; valor:real);

    procedure agregarAdelante (var lp:listaProm; legajo:integer; prom:real);
    var
        nue:listaProm;
    begin
        new(nue);
        nue^.datos.legajo:= legajo;
        nue^.datos.promedio:= prom;
        nue^.sig:= lp;
        lp:= nue;
    end;
    function calculoPromedios (l:lista):real;
    var
        suma:real;
        cant:integer;
    begin  
        suma:= 0;
        cant:= 0;
        while (l <> nil) do begin
            suma:= suma + l^.datos.nota;
            cant:= cant + 1;
            l:= l^.sig;
        end;
        if (cant <> 0) then
            calculoPromedios:= suma / cant
        else
            calculoPromedios:= 0;
    end;

var
    prom:real;
begin
    if (a <> nil) then begin
        prom:= calculoPromedios(a^.datos.l);
        if (prom > valor) then 
            agregarAdelante(lp,a^.datos.legajo,prom);
        incisoD(a^.hi, lp);
        incisoD(a^.hd, lp);
    end;
end;
//---------------------- [ INCISO C ] --------------------------
procedure incisoC(a:arbol);

    function cantidadAprobadoMaterias(l:lista):integer;
    var
        cant:integer;
    begin
        cant:= 0;
        while (l <> nil) do begin
            if (l^.datos.nota >= 4) then
                cant:= cant + 1; 
            l:= l^.sig;
        end;
        cantidadAprobadoMaterias:= cant;
    end;

begin
    if (a <> nil) then begin
        incisoC(a^.hi);
        writeln ('> Legajo: ',a^.datos.legajo);
        if (cantidadAprobadoMaterias(a^.datos.l) > 0) then
            writeln ('- Ha aprobado las materias finales: ',cantidadAprobadoMaterias(a^.datos.l))
        else
            writeln ('- No ha aprobado ninguna materias finales.');
        writeln('************************************');
        incisoC(a^.hd);
    end;
end;
//---------------------- [ INCISO B ] --------------------------
function incisoB (a:arbol):integer;
begin
    if (a = nil) then 
        incisoB:= 0
    else begin
            if (((a^.datos.legajo) mod 2) = 1) then
                incisoB:= incisoB(a^.hi)+ incisoB(a^.hd) + 1
            else
                incisoB:= incisoB(a^.hi)+ incisoB(a^.hd)
        end;
end;
//---------------------[ TEST PRUEBA ]--------------------------
procedure imprimir(a:arbol);

    procedure imprimrLista (l:lista);
    begin
        while (l <> nil) do begin
            writeln ('El codigo de materia: ',l^.datos.codMateria);
            writeln ('La fecha: ',l^.datos.fecha.dia,'/',l^.datos.fecha.mes,'/',l^.datos.fecha.anio);
            writeln ('Nota: ',l^.datos.nota:2:2);
            writeln();
            l:= l^.sig;
        end;
    end;
begin
    if (a <> nil) then begin
        imprimir(a^.hi);
        writeln ('> Legajo: ',a^.datos.legajo);
        writeln ('- Lista de las materias finales:');
        imprimrLista (a^.datos.l);
        writeln('************************************');
        imprimir(a^.hd);
    end;
end;
//---------------------- [ INCISO A ] --------------------------
procedure incisoA (var a:arbol);

    procedure agregarAdelante (var l:lista; f:final);
    var
        nue:lista;
    begin
        new(nue);
        nue^.datos:= f;
        nue^.sig:= l;
        l:= nue;
    end;
    procedure cargaArbol (var a:arbol; alu:alumno; f:final);
    begin
        if (a = nil) then begin
            new (a);
            a^.datos.legajo:= alu.legajo;
            a^.datos.l:= nil;
            agregarAdelante(a^.datos.l,f);
            a^.hi:= nil;
            a^.hd:= nil;
        end
        else if (a^.datos.legajo = alu.legajo) then 
                agregarAdelante(a^.datos.l,f)
            else if (a^.datos.legajo > alu.legajo) then
                    cargaArbol(a^.hi,alu,f)
            else
                cargaArbol(a^.hd,alu,f);
    end;
    procedure leer(var alu:alumno; var f:final);
    begin
        write ('> Ingrese el legajo: '); readln (alu.legajo);
        if (alu.legajo <> 0) then begin
            f.codMateria:= random (300-100)+ 100;
            f.fecha.dia:= random (31)+ 1;
            f.fecha.mes:= random (12)+ 1;
            f.fecha.anio:= random (2024 - 2010) + 2010;
            f.nota:= random()*10;
        end;    
    end;

var
    alu:alumno;
    f:final;
begin
    leer(alu,f);
    while (alu.legajo <> 0) do begin
        cargaArbol(a,alu,f);
        leer(alu,f);
    end;
end;
//--------------------------------------------------------------
var
    a:arbol;
    lp:listaProm;
begin
    a:= nil;
    randomize;
    incisoA(a);
    writeln('---------> INFORME ALUMNOS <--------');
    imprimir(a);// Prueba
    writeln('----> CANTIDAD DE LEGAJO IMPAR <----');
    writeln('> La cantidad de alumnos con legajos impar: ', incisoB(a));
    writeln('----> CADA ALUMNO HA APROBADO LA CANTIDAD DE FINALES <----');
    incisoC(a); 
    writeln('-----------> ALUMNOS FUERON MEJORES PROMEDIOS <-----------');
    lp:= nil;
    incisoD(a,lp,6);
    imprimirPromedios(lp);
end.