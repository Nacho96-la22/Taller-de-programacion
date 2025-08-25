program ProgramaVectores;
const 
    dimF = 50;
type
    vectoresEnteros = array [1..dimF] of integer;
//--------------------------------------------------------------------
procedure imprimirVectorInverso(dimL:integer; v:vectoresEnteros);
var
    i:integer;
begin
    for i:= dimL downto 1 do 
        writeln('Pos ', i, ': ', v[i]);
end;
procedure imprimirVector(dimL:integer; v:vectoresEnteros);
var
    i:integer;
begin
    for i:= 1 to dimL do 
        writeln('Pos ', i, ': ', v[i]);
end;
procedure cargarVector (var dimL:integer; var v:vectoresEnteros);
var 
    min,max:integer;
begin
    write ('> Ingrese un numero de minimo: '); readln(min);
    write ('> Ingrese un numero de maximo: '); readln(max);
    v[dimL]:= random(max-min)+min;
    while (dimL < dimF) and (v[dimL] <> 0) do begin
        dimL:= dimL + 1;
        v[dimL]:= random(max-min)+min;
    end;
end;
//--------------------------------------------------------------------
var
    v:vectoresEnteros;
    dimL:integer;
begin
    dimL:= 1;
    randomize;
    writeln('- Elige los numeros de minimos y maximo: ');
    cargarVector(dimL,v);
    writeln ('- Imprimir el vector cargado:');
    imprimirVector(dimL,v);
    writeln ('- Imprimir el vector cargado inverso:');
    imprimirVectorInverso(dimL,v);
end.