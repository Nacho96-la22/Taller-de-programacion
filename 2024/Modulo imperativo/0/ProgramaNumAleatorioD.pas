{d) Modifique el programa para que imprima N numeros aleatorios en el rango (A,B),
    donde N, A y B son numeros enteros que se leen por teclado.}

program ProgramaNumAleatorioD;
var
    ale, cant, N, A, B:integer;
begin
    randomize;
    writeln ('Ingrese un numero de A: '); readln (A);
    writeln ('Ingrese un numero de B: '); readln (B);
    writeln ('Ingrese un numero de N: '); readln (N);
    cant:= 0;
    while (cant <> N) do begin
        ale:= random(B-A)+A;
        writeln ('El numero aleatorio generado es: ', ale);
        cant:= cant + 1;
    end;
end.