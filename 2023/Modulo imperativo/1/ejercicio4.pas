{4.-Una librería requiere el procesamiento de la información de sus productos. De cada
    producto se conoce el código del producto, código de rubro (del 1 al 8) y precio.
    Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
    A) Lea los datos de los productos y los almacene ordenados por código de producto y
	   agrupados por rubro, en una estructura de datos adecuada. El ingreso de los productos finaliza
       cuando se lee el precio 0.
    B) Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.
    C) Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3. Considerar que
       puede haber más o menos de 30 productos del rubro 3. Si la cantidad de productos del rubro 3
       es mayor a 30, almacenar los primeros 30 que están en la lista e ignore el resto.
    D) Ordene, por precio, los elementos del vector generado en c) utilizando alguno de los dos
       métodos vistos en la teoría.
    E) Muestre los precios del vector resultante del punto d).
	F) Calcule el promedio de los precios del vector resultante del punto d).}
	
program ejercicio4;
const
	dimF = 30;
type
	rangoRubro = 1..8;
	producto = record
		cod:integer;
		rubro:rangoRubro;
		precio:real;
	end;
	
	lista = ^nodo;
	nodo = record
		datos:producto;
		sig:lista;
	end;

	vectorRubro = array [rangoRubro] of lista;
	vectorTresRubro = array [1..dimF] of producto;
//---------------------------- INCISO F --------------------------------
procedure incisoF (v3:vectorTresRubro; dimL:integer);
var
	i:integer;
	suma:real;
begin
	suma:= 0;
	if (dimL > 0) then begin
		for i:= 1 to dimL do begin
			suma:= suma+v3[i].precio;
		end;
		writeln ('El promedio de los precios del vector resultante del rubro 3: ', suma/dimL:3:2,' %');
	end
	else begin
		writeln ('El promedio de los precios del vector resultante del rubro 3: ', suma:3:2,' %');
	end;
end;
//---------------------------- INCISO E --------------------------------
procedure incisoE(v3:vectorTresRubro; dimL:integer);
var
	i:integer;
begin
	writeln('::::::::::::::::::::: MOSTRAR LOS DATOS DE RUBRO 3 :::::::::::::::::::::::');
	if (dimL > 0) then begin
		for i:= 1 to dimL do begin
			writeln('> ',i, ' Pos:');
			writeln('- El codigo: ', v3[i].cod);  
			writeln ('- El precio: ', v3[i].precio:4:2);
			writeln();
		end;
	end
	else begin
		writeln ('No hay informacion.');	
	end;
end;
//---------------------------- INCISO D --------------------------------
procedure incisoD (var v3:vectorTresRubro; dimL:integer);
var
	i,j,pos:integer;
	actual:producto;
begin
	for i:= 1 to dimL do begin
		pos:= i;
		for j:= i+1 to dimL do 
			if(v3[j].precio > v3[pos].precio) then 
				pos:= j;
			actual:= v3[pos];
			v3[pos]:= v3[i];
			v3[i]:= actual;
	end;
end;
//---------------------------- INCISO C --------------------------------
procedure incisoC (v:vectorRubro; var v3:vectorTresRubro; var dimL:integer);
var
	aux:lista;
begin
	aux:= v[3];
	while(aux <> nil)do begin
		dimL:= dimL +1;
		if(dimL < dimF)then begin
			v3[dimL].cod:= aux^.datos.cod;
			v3[dimL].precio:= aux^.datos.precio;
		end;
		aux:= aux^.sig;
	end;
end;
//---------------------------- INCISO B --------------------------------
procedure incisoB (v:vectorRubro);
var
	i:integer;
	aux:lista;
begin
	writeln('--------------------------------------------------------------------------');
	writeln(':::::::::::::::::::::: MOSTRAR LOS DATOS DE RUBROS :::::::::::::::::::::::');
	for i:= 1 to 8 do begin
		aux:= v[i];
		if(aux <> nil) then begin
			writeln('> Rubro ',i,':');
			while (aux <> nil) do begin
				writeln('- El codigo: ', aux^.datos.cod);
				writeln('- El precio: ', aux^.datos.precio:4:2);
				writeln('');
				aux:= aux^.sig;
			end;
		end
		else
			writeln('> No ha informado oficial.');
			writeln('--------------------------------------------------------------------------');
	end;
end;
//---------------------------- INCISO A --------------------------------
procedure ordenandoPorCodigo (var l:lista; p:producto);
var
	nue:lista;
	act,ant:lista;
begin
	new(nue);
	nue^.datos:= p;
	act:= l; ant:= l;
	while(act <> nil)and(p.cod > act^.datos.cod) do begin
		ant:= act;
		act:= act^.sig;
	end;
	if (act = ant) then
		l:= nue
		else
			ant^.sig:= nue;
	nue^.sig:= act;
end;
procedure leer (var p:producto);
begin
	writeln('> El precio:');
	readln(p.precio);
	if(p.precio <> 0) then begin
		p.cod:= random(100)+1;
		p.rubro:= random(8)+1;
	end;
end;
procedure cargarLista(var v:vectorRubro);
var
	p:producto;
begin
	writeln(':::::::::::::::::::::: INFORMACION DE LOS PRODUCTOS ::::::::::::::::::::::');
	leer(p);
	while(0<>p.precio)do begin
		ordenandoPorCodigo(v[p.rubro],p);  // Se carga la lista por agrupado
		writeln('');
		leer(p);
	end;
end;
procedure inicializarVector(var v:vectorRubro);
var
	i:integer;
begin
	for i:= 1 to 8 do begin
		v[i]:= nil;
	end;
end;
procedure incisoA(var v:vectorRubro);
begin
	inicializarVector(v);
	cargarLista(v);
end;
//----------------------------------------------------------------------
var
	v:vectorRubro;
	v3:vectorTresRubro;
	dimL:integer;
begin
	dimL:= 0;
	randomize;
	incisoA(v);
	incisoB(v);
	incisoC(v,v3,dimL);
	incisoD(v3,dimL);
	incisoE(v3,dimL);
	incisoF(v3,dimL);
end.
