{Una clinica necesita un sistema para el procesamiento de las atenciones realizadas a los pacientes
 en julio de 2024.

 a) Implementar un modulo que lea informacion de las atenciones. De cada atencion se lee: matricula 
    del medico, DNI del paciente, dia y diagnostico (valor entre A y F). La lectura finaliza con el
    dni 0. El modulo debe retornar dos estructuras de datos:
    
    i.  Un arbol binario de la busqueda ordenado por matricula del medico. Para cada matricula de 
        medico debe almacenarse la cantidad de atenciones realizadas.
    ii. Un vector que almacene en cada posicion el tipo del genero y la lista de los DNI de pacientes
        atendidos con ese diagnostico.
 
 b) Implementar un modulo que reciba el arbol generado en a), una matricula y retorne la cantidad 
    total de atenciones realizadas por los medicos con marticula superior a la matricula ingresada.
    
 c) Realizar un modulo recursivo que reciba el vector generado en a) y retorne el diagnostico con
    maypr cantidad de pacientes atendidos.
    
 NOTA: Implementar el programa principal, que invoque a los incisos a, b y c. En caso de ser necesario,
       puede utilizar los modulos que se encuentran a continuacion.}

program parcialClinica2024;
type
	rangoDia = 1..31;
	rangoDiagnostico = 'A'..'F';
	
	atencion = record
		matriMedico:integer;
		dniPaciente:integer;
		dia:rangoDia;
		diagnostico:rangoDiagnostico;
	end;
	
	matricula = record
		matriMedico:integer;
		cantotal:integer;
	end;
	
	paciente = record
		dniPaciente:integer;
		dia:rangoDia;
	end;
	
	arbol = ^nodoA;
	nodoA = record
		dato:matricula;
		hi:arbol;
		hd:arbol;
	end;

	lista = ^nodoL;
	nodoL = record
		dato:paciente;
		sig:lista;
	end;
	
	vectorGenero = array [rangoDiagnostico] of lista;
//--------------[ INCISO C ]---------------
//--------------[ INCISO B ]---------------
function incisoB(a:arbol; num:integer):integer;
begin
	if (a = nil) then 
		incisoB:= 0
	else if (num > a^.dato.matriMedico) then
			incisoB:= a^.dato.cantotal + incisoB(a^.hd,num)
		 else
			incisoB:= incisoB(a^.hd,num);
end;
//----------------[ TEST ]-----------------
procedure imprimirVector(v:vectorGenero);
var
	i:char;
	aux:lista;
begin
	for i:= 'A' to 'F' do begin
		aux:= v[i];
		if (aux <> nil) then begin
			writeln('> Diagnostico ',i,': ');
			while (aux <> nil) do begin
				writeln('> El DNI del paciente: ',aux^.dato.dniPaciente,', dia: ',aux^.dato.dia);
				aux:= aux^.sig;
			end;
			writeln('**************');
		end;
	end;
end;
procedure imprimirArbol(a:arbol);
begin
	if (a <> nil) then begin
		imprimirArbol(a^.hi);
		writeln ('> La matricula de medico: ',a^.dato.matriMedico,', la cantidad de atenciones realizadas: ', a^.dato.cantotal);
		imprimirArbol(a^.hd);
	end;
end;
//--------------[ INCISO A ]---------------
procedure incisoA(var a:arbol; var v:vectorGenero);

	procedure agregarAdelante(var l:lista; at:atencion);
	var
		nue:lista;
	begin
		new(nue);
		nue^.dato.dniPaciente:= at.dniPaciente;
		nue^.dato.dia:= at.dia;
		nue^.sig:= l;
		l:= nue;
	end;
	procedure cargarArbol(var a:arbol; at:atencion);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato.matriMedico:= at.matriMedico;
			a^.dato.cantotal:= 1;
			a^.hi:= nil;
			a^.hd:= nil
		end
		else if (a^.dato.matriMedico = at.matriMedico) then
				a^.dato.cantotal:= a^.dato.cantotal + 1
			else if (a^.dato.matriMedico > at.matriMedico) then
					cargarArbol(a^.hi,at)
				else
					cargarArbol(a^.hi,at);
	end;
	procedure leer(var at:atencion);
	var
		d:array[1..6] of char = ('A','B','C','D','E','F');
	begin
		at.dniPaciente:= random(100);
		if (at.dniPaciente <> 0) then begin
			at.matriMedico:= random(20)+1;
			at.dia:= random(31)+1;
			at.diagnostico:= d[random(6)+1];
		end;
	end;
	
var
	at:atencion;
begin
	leer(at);
	while (at.dniPaciente <> 0) do begin
		cargarArbol(a,at);
		agregarAdelante(v[at.diagnostico],at);
		leer(at);
	end;
end;
procedure inicializarVector(var v:vectorGenero);
var
	i:char;
begin
	for i:= 'A' to 'F' do
		v[i]:= nil;
end;
//-----------------------------------------
var
	a:arbol;
	v:vectorGenero;
	num:integer;
begin
	randomize;
	a:= nil;
	inicializarVector(v);
	incisoA(a,v);
	imprimirArbol(a);
	writeln;
	imprimirVector(v);
	writeln('-------------');
	write ('> Ingrese una matricula del medico: '); readln(num);
	writeln ('> La cantidad: ',incisoB(a,num));
end.
