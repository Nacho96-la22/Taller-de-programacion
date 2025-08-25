{1) Implementar un programa que invoque a los siguientes módulos.
    a. Un módulo recursivo que retorne un vector de a lo sumo 15 números enteros “random”
       mayores a 10 y menores a 155 (incluidos ambos). La carga finaliza con el valor 20.
    b. Un módulo no recursivo que reciba el vector generado en a) e imprima el contenido del
       vector.
    c. Un módulo recursivo que reciba el vector generado en a) e imprima el contenido del vector.
    d. Un módulo recursivo que reciba el vector generado en a) y devuelva la suma de los valores
       pares contenidos en el vector.
    e. Un módulo recursivo que reciba el vector generado en a) y devuelva el máximo valor del
       vector.
    f. Un módulo recursivo que reciba el vector generado en a) y un valor y devuelva verdadero si
       dicho valor se encuentra en el vector o falso en caso contrario.
    g. Un módulo que reciba el vector generado en a) e imprima, para cada número contenido en
       el vector, sus dígitos en el orden en que aparecen en el número. Debe implementarse un
       módulo recursivo que reciba el número e imprima lo pedido. Ejemplo si se lee el valor 142, se
       debe imprimir 1 4 2.}

program ejercicio1;
const
    dimF = 15;
type
    vector = array [1..dimF] of integer;

//-------------------------[ INCISO G ]-------------------------------
procedure incisoG(v:vector; dimL:integer);

    procedure digitoEspacio (num:integer);
    var
        dig:integer;
    begin
        if (num > -1) then begin
            dig:= num mod 10;
            num:= num div 10;
            digitoEspacio (num);
            write (dig,' '); 
        end;
    end;
    procedure imprimirVectores(i:integer; v:vector; dimL:integer);
    begin
        if (i < dimL) then begin
            i:= i + 1;
            writeln ('- ', i,': ', v[i]);    
            writeln('-------------------');
            imprimirVectores(i,v,dimL);
        end;
    end;

var
    pos,num,i:integer;
begin
    i:= 0;
    pos:= 1;
    if (pos <= dimL) then begin
        num:= v[pos];
        digitoEspacio(num);
        v[pos]:= num;
        pos:= pos + 1;
        incisoG(v,dimL);
    end;
    imprimirVectores(i,v,dimL);
end;

//-------------------------[ INCISO F ]-------------------------------
procedure incisoF(v:vector; dimL:integer);

    function buscarRecursiva (v:vector; dimL:integer; pos:integer; num:integer):boolean;
    begin
        if (pos <= dimL) then begin
            if (v[pos] = num) then 
                buscarRecursiva:= true
            else
                buscarRecursiva:= buscarRecursiva(v,dimL,pos+1,num);
        end
        else
            buscarRecursiva:= false;
    end;

var
    pos,num:integer;
begin
    pos:= 1;
    write ('> Ingrese un numero: '); readln(num);
    writeln ('> Este valor se encuentra en el vector: ', buscarRecursiva(v,dimL,pos,num));
end;
//-------------------------[ INCISO E ]-------------------------------
procedure incisoE(v:vector; dimL:integer);

    function maximoRecursiva (v:vector; dimL:integer; pos:integer):integer;
    var
        max:integer;
    begin
        if (pos <= dimL) then begin
            max:= maximoRecursiva(v,dimL,pos+1); // pos+1 es para recorrer de vector
            if (max < v[pos]) then 
                max:= v[pos];
            maximoRecursiva:= max;
        end
        else
            maximoRecursiva:= -1;
    end;

var
    pos:integer;
begin
    pos:= 1;
    writeln ('> El maximo valor es ', maximoRecursiva(v,dimL,pos));
end;
//-------------------------[ INCISO D ]-------------------------------
procedure incisoD(v:vector; dimL:integer);

    function sumaRecursiva (v:vector; dimL:integer; pos:integer):integer;
    begin
        if (pos <= dimL) then
            sumaRecursiva:= sumaRecursiva(v,dimL,pos+1) + v[pos]
        else
            sumaRecursiva:= 0;
    end;

var
    pos:integer;
begin
    pos:= 1;
    writeln ('> La suma de los valores pares contenidos: ', sumaRecursiva(v,dimL,pos));
end;
//-------------------------[ INCISO C ]-------------------------------
procedure incisoC(v:vector;dimL:integer);

    procedure imprimirVectorRecursiva(i:integer; v:vector; dimL:integer);
    begin
        if (i < dimL) then begin
            i:= i + 1;
            writeln ('- ', i,': ', v[i]);    
            writeln('-------------------');
            imprimirVectorRecursiva(i,v,dimL);
        end;
    end;

var 
    i:integer;
begin
    i:= 0;
    imprimirVectorRecursiva(i,v,dimL);
end;
//-------------------------[ INCISO B ]-------------------------------
procedure incisoB(v:vector; dimL:integer);
var
    i:integer;
begin
    for i:= 1 to dimL do begin
        writeln ('- ', i,': ', v[i]);
        writeln('-------------------');
    end;
end;
//-------------------------[ INCISO A ]-------------------------------
procedure incisoA (var v:vector; var dimL:integer);
    
    procedure cargarVectorRecursivo(var v:vector; var dimL:integer);
    var
        valor:integer;
    begin
        valor:= random (155 - 10)+10;
        if (valor <> 20) and (dimL < dimF) then begin
            dimL:= dimL + 1;
            v[dimL]:= valor;
            cargarVectorRecursivo(v,dimL);
        end;
    end;

begin
    dimL:= 0;
    cargarVectorRecursivo(v,dimL);
end;
//--------------------------------------------------------------------
var
    v:vector;
    dimL:integer;
begin
    randomize;
    incisoA(v,dimL);
    writeln ('> imprimir los vectores sin recursiva:');
    incisoB(v,dimL);
    writeln ('> imprimir los vectores con recursiva:');
    incisoC(v,dimL);
    incisoD(v,dimL);
    writeln();
    incisoE(v,dimL);
    writeln();
    incisoF(v,dimL);
    writeln();
    incisoG(v,dimL);
end.