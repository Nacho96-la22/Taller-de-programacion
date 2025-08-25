{4- Escribir un programa con:
    a. Un módulo recursivo que retorne un vector de 20 números enteros “random” mayores a 0 y
       menores a 100.
    b. Un módulo recursivo que devuelva el máximo valor del vector.
    c. Un módulo recursivo que devuelva la suma de los valores contenidos en el vector.}

program ejercicio4;
const 
    dimF = 20;
type
    vectorNumero = array[1..dimF] of integer;

//---------------------------- INCISO C --------------------------------
function suma(v:vectorNumero; i:integer):integer;
begin
    if(i <= dimF) then begin
        suma:= suma(v,i+1)+v[i];
    end
    else
        suma:=0;
end;
procedure incisoC (v:vectorNumero);
begin
    writeln ('> La suma de los contenidos en el vector: ', suma(v,1));
end;
//---------------------------- INCISO B --------------------------------
function maximo(v:vectorNumero; i:integer):integer;
var
    max:integer;
begin
    if (i <= dimF) then begin
        max:= maximo(v,i+1);
        if(v[i] > max) then begin
            max:= v[i];
        end;
        maximo:= max;
    end;
end;
procedure incisoB(v:vectorNumero);
begin
    writeln ('> El numero maximo valor del vector: ',maximo(v,1));
end;
//---------------------------- INCISO A --------------------------------
procedure imprimir (v:vectorNumero);
var 
    i:integer;
begin
    for i:= 1 to dimF do begin
        writeln ('- ',i ,' pos: ', v[i]);
    end;
end;
procedure incisoA (var v:vectorNumero; i:integer);
var
    num:integer;
begin
    num:= random(99)+1;
    if (i <= dimF) then begin
        v[i]:= num;                   //- Guarda el valor en el vector
        incisoA(v,i+1);               //- llamar al recursivo
    end
end;
//----------------------------------------------------------------------
var 
    v:vectorNumero;
begin
    writeln ('::::::::::::::::::::::::: DATOS DE VECTORES :::::::::::::::::::::::::');
    randomize;
    incisoA(v, 1);
    imprimir(v);
    writeln('');
    incisoB(v);
    writeln('');
    incisoC(v);
end.