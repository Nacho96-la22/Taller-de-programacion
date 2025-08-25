{c) Modifique el programa para que imprima 20 numeros aleatorios.}

program ProgramaNumAleatorioC;
var
    ale,i:integer;
begin
    randomize;
    for i:= 1 to 20 do begin
        ale := random (100);
        writeln ('El numero aleatorio generado es: ', ale);
    end;
	writeln ('Presione cualquier tecla para finalizar');
    readln;
end.