{2- Realizar un programa que lea números hasta leer el valor 0 e imprima, 
    para cada número leído, sus dígitos en el orden en que aparecen en 
    el número. Debe implementarse un módulo recursivo que reciba el número 
    e imprima lo pedido. Ejemplo si se lee el valor 256, se debe imprimir 2 5 6.}

program ejercicio2;
//----------------------------------------------------------------------
procedure leerNum (num:integer);
var
    dig:integer;
begin
    if (num > 0) then begin
        dig:= num mod 10;
        num:= num div 10;
        leerNum (num);
        write (dig, ' ');
    end;
end;
procedure inciso ();
var
    num:integer;
begin
    write ('Escribi un numero: ');
    readln (num);
    while (num <> 0) do begin
        writeln ('Imprimir por separado un numero digito:');
        leerNum (num);
        writeln ('');
        write ('Escribi un numero: ');
        readln (num);
    end;
end;
//----------------------------------------------------------------------
begin
    writeln ('------------------> EJERCICIO 2 <------------------');
    inciso ();
end.