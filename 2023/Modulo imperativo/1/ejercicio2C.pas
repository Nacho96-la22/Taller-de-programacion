{2. El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de
    las expensas de dichas oficinas.
    Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
    A) Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina
       se ingresa el código de identificación, DNI del propietario y valor de la expensa. La lectura
       finaliza cuando se ingresa el código de identificación -1, el cual no se procesa.
    B) Ordene el vector, aplicando el método de inserción, por código de identificación de la
       oficina.
    C) Ordene el vector aplicando el método de selección, por código de identificación de la oficina.}

program ejercicio2C;
const 
    dimF = 300;
type
    oficina = record
        codIdentificacion:integer;
        dniPropietario:integer;
        valorExpensa:real;
    end;
    vectorOficina = array [1..dimF] of oficina;

//--------------------------------------- Inciso C -------------------------------------------------
procedure ActualizarVectorOrdenadaSeleccion (v:vectorOficina; dimL:integer);
var
    i:integer;
begin
    writeln ('------------------------------------------------------------------------------------------');
    writeln ('**** ACTUALIZACION: ORDENE POR EL CODIGO DE IDENTIFICACION CON EL METODO DE SELECCION ****');
    for i:= 1 to dimL do begin
        writeln ('> posicion: ', i);
        writeln ('El codigo de identificacion: ', v[i].codIdentificacion);
        writeln ('El DNI del propietario: ', v[i].dniPropietario);
        writeln ('El valor de la expensa: ', v[i].valorExpensa:3:3);
        writeln ('------------------------------------------------------------------------------------------');
    end;
end;   
procedure ordenadaVectorCodigoIdentificacionSeleccion (var v:vectorOficina; dimL:integer); 
var
    i,j,pos:integer;
    actual:oficina;
begin
    for i:= 1 to dimL do begin
        pos:= i;
        for j:= i+1 to dimL do
            if (v[j].codIdentificacion < v[pos].codIdentificacion) then
                pos:= j;
        actual:= v[pos];
        v[pos]:= v[i];
        v[i]:= actual;
    end;
end;
//--------------------------------------- Inciso A -------------------------------------------------
procedure cargarVector (var v:vectorOficina; var dimL:integer);

    procedure leer (var o:oficina);
    begin    
        writeln ('Ingrese el codigo de identificacion:');
        readln (o.codIdentificacion);
        if (o.codIdentificacion <> -1) then begin
            o.dniPropietario:= random(1000)+1;
            o.valorExpensa:= random(100)+1;            
        end;
    end;

var
    o:oficina;
begin
    writeln ('--------------> INFORMACION DEL PAGO DE LAS EXPENSAS DE DICHAS OFICINAS <-----------------');
    leer (o);
    while ((o.codIdentificacion <> -1) and (dimL <= dimF)) do begin
        dimL:= dimL + 1;
        v[dimL]:= o;
        writeln ('------------------------------------------------------------------------------------------');
        leer (o);
    end;
end;
//-------------------------------------------------------------------------------------------------
var 
    v:vectorOficina;
    dimL:integer;
begin
    dimL:= 0;
    randomize;
    cargarVector (v, dimL);// Inciso A
    ordenadaVectorCodigoIdentificacionSeleccion (v, dimL);// Inciso C
    ActualizarVectorOrdenadaSeleccion (v,dimL);// Inciso C para mostrar
end.