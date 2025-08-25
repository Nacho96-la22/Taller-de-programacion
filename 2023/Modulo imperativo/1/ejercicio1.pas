{1.Se desea procesar la información de las ventas de productos de un comercio (como máximo 50).
 Implementar un programa que invoque los siguientes módulos:
 A) Un módulo que retorne la información de las ventas en un vector. De cada venta se conoce el
    día de la venta, código del producto (entre 1 y 15) y cantidad vendida (como máximo 99 unidades).
    El código debe generarse automáticamente (random) y la cantidad se debe leer. El ingreso de las
    ventas finaliza con el día de venta 0 (no se procesa).
 B) Un módulo que muestre el contenido del vector resultante del punto a).
 C) Un módulo que ordene el vector de ventas por código.
 D) Un módulo que muestre el contenido del vector resultante del punto c).
 E) Un módulo que elimine, del vector ordenado, las ventas con código de producto entre dos valores
    que se ingresan como parámetros.
 F) Un módulo que muestre el contenido del vector resultante del punto e).
 G) Un módulo que retorne la información (ordenada por código de producto de menor a
    mayor) de cada código par de producto junto a la cantidad total de productos vendidos.
 h. Un módulo que muestre la información obtenida en el punto g).}


program ejercicio1;
const 
    dimF = 50;
type
    rangoProducto = 1..50;
    rangoCodigo = 1..15;
    rangoVendida = 1..99;
    venta = record
        dia:integer;
        cod:rangoCodigo;
        cantVendida:rangoVendida;
    end;

    listaPar = ^nodo;
    nodo = record
        datos:venta;
        sig:listaPar;
    end;
    vectorVenta = array [rangoProducto] of venta;

//--------------------------- Inciso H ---------------------------
procedure mostrarListas(l:listaPar);
begin
    if (l = nil) then begin
        writeln ('> No hay informacion.');
    end
    else begin
        while (l <> nil) do begin        
            writeln('El dia de la venta: ', l^.datos.dia);
            writeln('El codigo del producto: ', l^.datos.cod);
            writeln('La cantidad vendida: ', l^.datos.cantVendida);
            writeln ('----------------------------------------------------------------------------');
            l:= l^.sig;
        end;
    end;
end;
//--------------------------- Inciso G ---------------------------
procedure listaCodigoPar (vec:vectorVenta; dimL:integer; var l:listaPar);

    {procedure ordenada (v:venta; var l:listaPar);
    var
        nue,ant,act:listaPar;
    begin
        new(nue);
        nue^.datos:= v;
        act:= l; ant:= l;
        while (act <> nil) and (act^.datos.cod < v.cod) do begin
            ant:= act;
            act:= act^.sig;
        end;
        if (ant = act) then
            l:= nue
        else
            ant^.sig:= nue;
        nue^.sig:= act;
    end;}
    procedure agregarAdelante (v:venta; var l:listaPar);
    var 
        nue:listaPar;
    begin
        new(nue);
        nue^.datos:= v;
        nue^.sig:= l;
        l:= nue;
    end;
    function cumple (cod:rangoCodigo):boolean;
    var
        ok:boolean;
    begin   
        ok:= false;
        if ((cod mod 2)=0) then
            ok:= true;
        cumple:= ok;
    end;    

var
    i:integer;
begin
    for i:= 1 to dimL do begin
        if (cumple(vec[i].cod)) then
            agregarAdelante(vec[i],l);
            //ordenada(vec[i],l);// esta dudo por me pide el enunciado pero alla idea pusieron como agregarAdelante 
    end;
end;
//--------------------------- Inciso F ---------------------------
procedure mostrarVectorResultanteIncisoF (vec:vectorVenta; dimL:integer);
var
    i:integer;
begin
    writeln ('----------------------------------------------------------------------------');
    WRITELN ('-------------------------> ACTUALIZACION <----------------------------------');
    writeln ('HA ELIMINADO DOS NUMEROS CODIGOS DE INICIAL Y FINAL:');
    for i:= 1 to dimL do begin
        writeln ('> posicion: ', i);
        writeln ('El dia de la venta: ', vec[i].dia);
        writeln ('El codigo del producto: ', vec[i].cod);
        writeln ('La cantidad vendida: ', vec[i].cantVendida);
        writeln ('----------------------------------------------------------------------------');
    end;
end;
//--------------------------- Inciso E ---------------------------
procedure BorrarVectorRangoEntreDosValores (var vec:vectorVenta; num1,num2:rangoCodigo; var dimL:Integer);
var
    i,j:Integer;
begin
    i := 1;
    j := 1;    
    while i <= dimL do begin
        if ((vec[i].cod >= num1) and (vec[i].cod <= num2)) then begin // No copiar elementos dentro del rango, omitirlos
            i := i + 1;
        end
        else begin // Copiar elementos fuera del rango
            vec[j] := vec[i];
            i := i + 1;
            j := j + 1;
        end;
    end;
    dimL := j - 1;
end;

//--------------------------- Inciso D ---------------------------
procedure mostrarVectorResultanteIncisoD (vec:vectorVenta; dimL:integer);
var
    i:integer;
begin
    writeln ('----------------------------------------------------------------------------');
    WRITELN ('--------------------------> ACTUALIZACION <---------------------------------');
    writeln ('ORDENA POR EL CODIGO DEL PRODUCTO:');
    for i:= 1 to dimL do begin
        writeln ('> posicion: ', i);
        writeln ('El dia de la venta: ', vec[i].dia);
        writeln ('El codigo del producto: ', vec[i].cod);
        writeln ('La cantidad vendida: ', vec[i].cantVendida);
        writeln ('----------------------------------------------------------------------------');
    end;
end;
//--------------------------- Inciso C ---------------------------
procedure ordenadaVector (var vec:vectorVenta; dimL:integer);
var
    i, j:integer;
    codActual:integer;
begin
    for i:= 2 to dimL do begin
        codActual:= vec[i].cod;
        j:= i - 1;
        while ((j > 0) and (vec[j].cod > codActual)) do begin
            vec[j+1].cod:= vec[j].cod;
            j:= j - 1;
        end;
        vec[j+1].cod:= codActual;
    end;
end;
//--------------------------- Inciso B ---------------------------
procedure mostrarVectorResultanteIncisoB (vec:vectorVenta; dimL:integer);
var
    i:integer;
begin
    writeln ('----------------------------------------------------------------------------');
    writeln ('----------------------------------------------------------------------------');
    WRITELN ('EL CONTENIDO DEL VECTOR RESULTANTE:');
    for i:= 1 to dimL do begin
        writeln ('> posicion: ', i);
        writeln ('El dia de la venta: ', vec[i].dia);
        writeln ('El codigo del producto: ', vec[i].cod);
        writeln ('La cantidad vendida: ', vec[i].cantVendida);
        writeln ('----------------------------------------------------------------------------');
    end;
end;
//--------------------------- Inciso A ---------------------------
procedure leerVenta (var v:venta; var vec:vectorVenta;var dimL:integer);
begin
    writeln ('--------> INFORMACION DE LAS VENTAS DE PRODUCTOS DE UN COMERCIO <-----------');
    writeln ('> Ingrese un dia');
    readln (v.dia);
    while (v.dia <> 0) and (dimL <= 50) do begin
        dimL:= dimL + 1;
        v.cod:= random(15) + 1;
        writeln ('> Ingrese la cantidad vendida: ');
        readln (v.cantVendida);
        vec[dimL]:= v;
        writeln ('----------------------------------------------------------------------------');
        writeln ('> Ingrese un dia');
        readln (v.dia);
    end;
end;
//------------------- Inicializar el vector ---------------------------
procedure inicializarVector (var vec:vectorVenta);
var
    i:integer;
begin
    for i:= 1 to dimF do begin
        vec[i].dia:= 0;
    end;
end;
//----------------------------------------------------------------------------------- 
var
    vec:vectorVenta;
    v:venta;
    l:listaPar;
    dimL:integer;
    num1, num2:rangoCodigo;
begin
    randomize;
    dimL:= 0;
    l:= nil;
    inicializarVector (vec);
    leerVenta (v, vec, dimL);// Inciso A 
    mostrarVectorResultanteIncisoB (vec, dimL);// Inciso B
    ordenadaVector(vec, dimL);// Inciso C
    mostrarVectorResultanteIncisoD (vec, dimL);// Inciso D
    writeln ('---------------------------------------------------------------------');
    writeln ('-------------> Elimina dos numeros inicial y final <-----------------');
    writeln ('> Ingrese un numero del codigo inicial:');
    readln (num1);
    writeln ('> Ingrese un numero del codigo final:');
    readln (num2);
    BorrarVectorRangoEntreDosValores (vec, num1, num2, dimL);// Inciso E
    mostrarVectorResultanteIncisoF (vec, dimL); // Inciso F
    writeln ('---------------------------------------------------------------------');
    writeln ('-----------> Ha cargado los codigos par de productos <---------------');    
    listaCodigoPar(vec,dimL,l); // Inciso G
    mostrarListas(l); // Inciso H
end.