program prueba;
type
	sub_dia = 1..30;
	envio=record
		codigo_postal:integer;
		cod_cliente:integer;
		dia:sub_dia;
		peso:real;
	end;
	envioLista=record
		cod_cliente:integer;
		dia:sub_dia;
		peso:real;
	end;
	
	lista=^nodoL;
	nodoL=record
		datosL:envioLista;
		sig:lista;
	end;
	
	postal=record
		codigo_postal:integer;
		datos_lista:lista;
	end;
	
	Arbol=^nodoA;
	nodoA=record
		datosA:postal;
		hi:Arbol;
		hd:Arbol;
	end;
		
procedure imprimir(a:arbol);
	procedure imprimirlista(l:lista);
	begin
		while (l <> nil) do begin
			writeln('codigo de cliente: ', l^.datosL.cod_cliente);
			writeln('dia: ',l^.datosL.dia);
			writeln('peso: ',l^.datosL.peso);
			l:=l^.sig;
		end;
	end;
{var
	l:lista;}
begin
	if(a <> nil)then
	begin
		imprimir(a^.hi);
		write(a^.datosA.codigo_postal);
		imprimirlista(a^.datosA.datos_lista);
		imprimir(a^.hd);
	end;
end;
procedure incisoA(var a:Arbol);
	procedure AgregarAdelante(var l:lista; e:envio);
	var
		nuevo:lista;
	begin
		new(nuevo);
		nuevo^.datosL.cod_cliente:=e.cod_cliente;
		nuevo^.datosL.dia:=e.dia;
		nuevo^.datosL.peso:=e.peso;
		nuevo^.sig:=l;
		l:=nuevo;
	end;

	procedure AgregarArbol(var a:arbol; e:envio);
	begin
		if (a=nil)then begin
			new(a);
			a^.datosA.codigo_postal:=e.codigo_postal;
			a^.datosA.datos_lista:=nil;
			AgregarAdelante(a^.datosA.datos_lista,e);
			a^.hi:=nil;
			a^.hd:=nil;
		end
		else if (a^.datosA.codigo_postal= e.codigo_postal)then
				AgregarAdelante(a^.datosA.datos_lista,e)
			else if (e.codigo_postal < a^.datosA.codigo_postal)then
					AgregarArbol(a^.hi,e)
				else
					AgregarArbol(a^.hd,e);
	end;

	procedure leerenvio(var e: envio);
	begin
		//writeln ('codigo postal : ');
		e.codigo_postal:=random(100);
		//writeln('codigo de cliente : ');
		e.cod_cliente:=random(1000);
		//writeln ('dia : ');
		e.dia:=random(30);
		//writeln('peso : '); 
		e.peso:=random()*100;
	end;
var
	e:envio;
begin
	leerenvio(e);
	while (e.codigo_postal <> 0) do begin
		AgregarArbol(a,e);
		leerenvio(e);
	end;
end;
var
	a:Arbol;
begin
	randomize;
	a:=nil;
	incisoA(a);
	imprimir(a)
end.