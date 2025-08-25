{e) Modifique el programa para que imprima numeros aleatorios en el rango (A,B)
    hasta que se genere un valor igual a F, el cual no debe imprimirse. F, A y
    B son numeros enteros que se leen por teclado.}

program ProgramaNumAleatorioE;
var
    ale, F, A, B:integer;
    ok:boolean;
begin
    randomize;
    ok:= false;
    writeln ('Ingrese un numero de A: '); readln (A);
    writeln ('Ingrese un numero de B: '); readln (B);
    writeln ('Ingrese un numero de F: '); readln (F);
    while (ok <> true) do begin
        ale:= random(B-A)+A;
        if (F <> ale) then
            writeln ('El numero aleatorio generado es: ', ale)
        else
            ok:= true;
    end;
end.