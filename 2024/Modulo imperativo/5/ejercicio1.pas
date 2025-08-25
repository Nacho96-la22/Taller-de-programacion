{1. El administrador de un edificio de oficinas tiene la información del pago de las expensas
    de dichas oficinas. Implementar un programa con:
    
    A) Un módulo que retorne un vector, sin orden, con a lo sumo las 300 oficinas que
       administra. Se deben cargar, para cada oficina, el código de identificación, DNI del
       propietario y valor de la expensa. La lectura finaliza cuando llega el código de
       identificación 0.
    B) Un módulo que reciba el vector retornado en a) y retorne dicho vector ordenado por
       código de identificación de la oficina. Ordenar el vector aplicando uno de los métodos
       vistos en la cursada.
    C) Un módulo que realice una búsqueda dicotómica. Este módulo debe recibir el vector
       generado en b) y un código de identificación de oficina. En el caso de encontrarlo, debe
       retornar la posición del vector donde se encuentra y en caso contrario debe retornar 0.
       Luego el programa debe informar el DNI del propietario o un cartel indicando que no
       se encontró la oficina.
    D) Un módulo recursivo que retorne el monto total de las expensas.}

program ejercicio1;
const
    dimF = 30;
type

    oficina = record
        codIde:integer;
        DNI:integer;
        valor:real;
    end;

    vectorOficina = array [1..dimF] of oficina;

//-------------------[ INCISO D ]--------------------
function incisoD(v:vectorOficina; dimL:integer):real;
begin
    if (0 < dimL) then
        incisoD:= incisoD(v,dimL-1) + v[dimL].valor
    else
        incisoD:= 0
end;
//-------------------[ INCISO C ]--------------------
function incisoC (v:vectorOficina; dimL:integer; cod:integer):boolean;
var
    ok:boolean;
    pri,ult,med:integer;
begin
    ok:= false;
    pri:= 1; ult:= dimL; med:= (pri+ult) div 2;
    while (pri <= ult) and (cod <> v[med].codIde) do begin
        if (cod < v[med].codIde) then
            ult:= med-1
        else
            pri:= med+1;
        med:= (pri+ult) div 2;
        if (pri <= ult) and (cod = v[med].codIde) then
            ok:= true
    end;
    incisoC:= ok;
end;
//-------------------[ INCISO B ]--------------------
procedure imprimirOrdenada(v:vectorOficina; dimL:integer);
var
    i:integer;
begin
    for i:= 1 to dimL do begin
        writeln ('> El codigo de identificacion: ',v[i].codIde);
        writeln ('- El DNI del propietario: ',v[i].DNI);
        writeln ('- El valor de la expensa: ',v[i].valor:0:2);
        writeln ();
    end;
end;
procedure incisoB(var v:vectorOficina; dimL:integer);
var
    i,j,pos:integer;
    actual:oficina;
begin
    for i:= 1 to dimL do begin
        pos:= i;
        for j:= i+1 to dimL do 
            if (v[j].codIde < v[pos].codIde) then
                pos:= j;
        actual:= v[pos];
        v[pos]:= v[i];
        v[i]:= actual;
    end;
end;
//---------------------[ TEST ]----------------------
procedure imprimirVector(v:vectorOficina; dimL:integer);
var
    i:integer;
begin
    for i:= 1 to dimL do begin
        writeln ('> El codigo de identificacion: ',v[i].codIde);
        writeln ('- El DNI del propietario: ',v[i].DNI);
        writeln ('- El valor de la expensa: ',v[i].valor:0:2);
        writeln ();
    end;
end;
//-------------------[ INCISO A ]--------------------
procedure incisoA (var v:vectorOficina; var dimL:integer);

    procedure leer(var o:oficina);
    begin
        o.codIde:= random(100);
        if (o.codIde <> 0) then begin
            o.DNI:= random(3000-1000)+1000;
            o.valor:= random(100)*1.5;
        end;
    end;

var
    o:oficina;
begin
    leer(o);
    while (o.codIde <> 0) do begin
        dimL:= dimL + 1;
        v[dimL]:= o;
        leer(o);
    end;
end;
//---------------------------------------------------
var
    v:vectorOficina;
    dimL:integer;
    cod:integer;
begin
    dimL:= 0;
    randomize;
    incisoA(v,dimL);
    //imprimirVector(v,dimL);
    writeln('.*.*.*.*.*.*.*.*.*.*');
    incisoB(v,dimL);
    imprimirOrdenada(v,dimL);
    writeln('.*.*.*.*.*.*.*.*.*.*');
    write ('> Ingrese un codigo de identificacion: '); readln(cod);
    writeln ('- Ha encontrando este codigo de identificacion: ',incisoC (v,dimL,cod));
    writeln('.*.*.*.*.*.*.*.*.*.*');
    writeln ('> Sumando el monto total: ',incisoD(v,diml):0:2);
end.