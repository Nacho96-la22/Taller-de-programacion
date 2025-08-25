{Una empresa de gastronomia procesar las entregas de comida realizadas a sus clientes durante el año 2022.

 A) Implementar un modulo que lea compras de comidas. De cada compra se lee codigo de comida, codigo de cliente
    y categoria de la entrega ('Full','Super','Media','Normal','Basica'). La lectura finaliza con el codigo de 
    cliente 0. Se sugiere utilizar el modulo leerEntrega(). Se deben retornar 2 estructuras de datos:
    
    i.  Un arbol binario de busqueda ordenado por codigo de comida. Para cada codigo de comida debe almacenarse
        la cantidad de entregas realizas a ese codigo entre todos los clientes.
    ii. Un vector que almacene en cada posicion el nombre de la categoria y la cantidad de entregas realizadas 
        para esa categoria.
        
 B) Implementar un modulo que reciba el arbol generado en A) y un codigo de comida. El modulo debe retornar la
    cantidad de entregas realizadas al codigo de comida ingresado.
    
 C) Implementar un modulo que reciba el vector generado en A), lo ordene por cantidad de entregas de menor a 
    mayor y retorne la categoria con mayor cantidad de entregas.}

program parcialGastronomia;
type
    rangoCategoria = 1..5;

    compra = record
        codComida:integer;
        codCliente:integer;
        catEntrega:rangoCategoria;
    end;

    comida = record
        codComida:integer;
        cantotal:integer;
    end;

    arbol = ^nodoA;
    nodoA = record
        dato:comida;
        hi:arbol;
        hd:arbol;
    end;

    categoria = record
        cat:String;
        cant:integer;
    end;

    vectorCategoria = array [rangoCategoria] of categoria;

//---------------------------------------------------------
procedure incisoCii(v:vectorCategoria; var cantMax:integer; var cateMax:String);
var
    i:integer;
begin
    for i:= 1 to 5 do begin
        if (cantMax < v[i].cant) then begin
            cantMax:= v[i].cant;
            cateMax:= v[i].cat;
        end;
    end;
end;
procedure imprimirVector(v:vectorCategoria);
var
    i:integer;
begin
    for i:= 1 to 5 do begin
        writeln ('> La categoria ',v[i].cat, ': ',v[i].cant);
    end;
end;
procedure incisoCi(var v:vectorCategoria);
var
    i,j,pos:integer;
    actual:categoria;
begin
    for i:= 1 to 5 do begin
        pos:= i;
        for j:= i+1 to 5 do 
            if (v[j].cant < v[pos].cant) then
                pos:= j;
        actual:= v[pos];
        v[pos]:= v[i];
        v[i]:= actual;
    end;
end;
//---------------------------------------------------------
procedure incisoB(a:arbol; cod:integer; var cant:integer);
begin
    if (a <> nil) then begin
        if (cod = a^.dato.codComida) then
            cant:= a^.dato.cantotal
        else if (cod < a^.dato.codComida) then
                incisoB(a^.hi,cod,cant)
            else
                incisoB(a^.hd,cod,cant);
    end;
end;
procedure imprimirArbol(a:arbol);
begin
    if (a <> nil) then begin
        imprimirArbol(a^.hi);
        writeln ('> El codigo de comida: ',a^.dato.codComida,' tiene la cantidad de entregas: ',a^.dato.cantotal);
        imprimirArbol(a^.hd);
    end;
end;
//---------------------------------------------------------
procedure incisoA(var a:arbol; var v:vectorCategoria);

    procedure cargarArbol (var a:arbol; c:compra);
    begin
        if (a = nil) then begin
            new(a);
            a^.dato.codComida:= c.codComida;
            a^.dato.cantotal:= 1;
            a^.hi:= nil;
            a^.hd:= nil;
        end
        else if (c.codComida = a^.dato.codComida) then
                a^.dato.cantotal:= a^.dato.cantotal + 1
            else if (c.codComida < a^.dato.codComida) then
                    cargarArbol(a^.hi,c)
                else
                    cargarArbol(a^.hd,c);
    end;
    procedure leer(var c:compra);
    begin
        c.codCliente:= random(20);
        if (c.codCliente <> 0) then begin
            c.codComida:= random(10)+1;
            c.catEntrega:= random(5)+1;
        end;
    end;

var
    c:compra;
begin
    leer(c);
    while (c.codCliente <> 0) do begin
        cargarArbol(a,c);
        v[c.catEntrega].cant:= v[c.catEntrega].cant + 1;
        leer(c);
    end;
    
end;
procedure inicializarVector(var v:vectorCategoria);
var
    i:integer;
    n:array[rangoCategoria] of String= ('Full','Super','Media','Normal','Basica');
begin
    for i:= 1 to 5 do begin
        v[i].cat:= n[i];
        v[i].cant:= 0;
    end;
end;
//---------------------------------------------------------
var
    a:arbol;
    v:vectorCategoria;
    cod,cant:integer;
    cateMax:String; cantMax:integer;
begin
    randomize;
    a:= nil;
    inicializarVector(v);
    incisoA(a,v);
    imprimirArbol(a);
    cant:= 0;
    write ('> Ingrese el codigo de comida: '); readln (cod);
    incisoB(a,cod,cant);
    writeln ('- La cantidad de entregadas realizadas es ',cant);
    writeln;
    cateMax:= ''; cantMax:= -1;
    incisoCi(v);
    imprimirVector(v);
    incisoCii(v,cantMax,cateMax);
    writeln ('- El mayor cantidad de entrgada es la categoria ',cateMax,' y tiene cantidad ',cantMax);
end.