{1. El administrador de un edificio de oficinas, cuenta en papel, con la información
    del pago de las expensas de dichas oficinas. Implementar un programa con:
    A) Un módulo que retorne un vector, sin orden, con a lo sumo las 300 oficinas que
       administra. Se debe leer, para cada oficina, el código de identificación, DNI del
       propietario y valor de la expensa. La lectura finaliza cuando llega el código de
       identificación -1.
    B) Un módulo que reciba el vector retornado en a) y retorne dicho vector ordenado por
       código de identificación de la oficina. Ordenar el vector aplicando uno de los 
       métodos vistos en la cursada.
    C) Un módulo que realice una búsqueda dicotómica. Este módulo debe recibir el vector
       generado en b) y un código de identificación de oficina. En el caso de encontrarlo, 
       debe retornar la posición del vector donde se encuentra y en caso contrario debe 
       retornar 0. Luego el programa debe informar el DNI del propietario o un cartel 
       indicando que no se encontró la oficina.
    D) Un módulo recursivo que retorne el monto total de las expensas.}

program ejercicio1;
const
    dimF = 300;
type
    rangoDNI = 10000000..99000000;
    oficina = record
        cod:integer;
        dniPropietario:rangoDNI;
        valor:real;
    end;

    vectorOficina = array [1..dimF] of oficina;
//-----------------------------------------------------------------------------------------
//------------------------------------------> INCISO C <-----------------------------------
function buscarUnCodigoVector (num, pos:integer; v:vectorOficina; dimL:integer):integer;
var
    medio, pos, ult:integer;
begin
    pos:= 1;
    ult:= dimL;
    medio:= (pos + ult) div 2;
    while (pos <= ult) and (num <> v[medio]) do begin
        if (num < v[medio]) then
            ult:= ult - 1
        else 
            pos:= pos + 1;
    end;
end;
procedure incisoC (v:vectorOficina; dimL:integer);
var
    num:integer;
begin
    
    writeln ('Ingrese un numero de codigo de identificacion: ');
    readln (num);
    if (buscarUnCodigoVector (num, pos, v, dimL)) then
        

end;
//------------------------------------------> INCISO B <-----------------------------------
procedure imprimirIncisoB (v:vectorOficina; dimL:integer);
var
    i:integer;
begin
    writeln ('-------------------> IMPRIMIENDO LOS DATOS DE OFICINAS <-----------------------');
    writeln ('---------> ACTUALIZACION, ORDENADA POR EL CODIGO DE IDENTIFICACION <-----------');
    for i:= 1 to dimL do begin
        writeln ('El codigo de identificacion: ', v[i].cod);
        WriteLn ('El DNI del propietario: ', v[i].dniPropietario);
        writeln ('El valor de la expensa: ', v[i].valor:5:2);
        writeln ('-------------------------------------------------');
    end;
end;
procedure incisoB (var v:vectorOficina; dimL:integer);
var
    i, j:integer;
    actualCod:integer;
begin
    for i:= 1 to dimL do begin
        actualCod:= v[i].cod;
        j:= i - 1;
        while ((j > 0) and (actualCod < v[j].cod)) do begin
            v[j+1].cod:= v[j].cod;
            j:= j - 1;
        end;
        v[j+1].cod:= actualCod;
    end;
end;
//------------------------------------------> INCISO A <-----------------------------------
procedure imprimirIncisoA (v:vectorOficina; dimL:integer);
var
    i:integer;
begin
    writeln ('---------------> IMPRIMIENDO LOS DATOS DE OFICINAS <---------------');
    for i:= 1 to dimL do begin
        writeln ('El codigo de identificacion: ', v[i].cod);
        WriteLn ('El DNI del propietario: ', v[i].dniPropietario);
        writeln ('El valor de la expensa: ', v[i].valor:5:2);
        writeln ('-------------------------------------------------');
    end;
end;
procedure leer (var o:oficina; var v:vectorOficina; var dimL:integer);
begin
    writeln ('Ingrese el codigo de identificacion:');
    readln (o.cod);
    while (o.cod <> -1) and (dimL <= dimF) do begin
        dimL:= dimL + 1;
        //writeln ('Ingrese DNI del propietario:');
        o.dniPropietario:= random(99000000);
        writeln ('Ingrese valor de la expensa:');
        readln (o.valor);
        v[dimL]:= o;
        writeln ();
        writeln ('Ingrese el codigo de identificacion:');
        readln (o.cod);
    end;
end;
//-----------------------------------------------------------------------------------------
var
    v:vectorOficina;
    o:oficina;
    dimL:integer;
begin
    randomize;
    dimL:= 0;
    writeln ('------------> LA INFORMACION DEL PAGO DE LAS EXPENSAS <------------');
    // Inciso A
    leer (o, v, dimL);
    imprimirIncisoA (v, dimL);
    // Inciso B
    incisoB (v, dimL); 
    imprimirIncisoB (V, dimL);
    // Inciso C 
    incisoC (v, dimL);

end.