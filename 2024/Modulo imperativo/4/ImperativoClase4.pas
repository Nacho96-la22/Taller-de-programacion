Program ImperativoClase4;

type venta = record
               codigoVenta: integer;
               codigoProducto: integer;
               cantUnidades: integer;
               precioUnitario: real;
             end;
     productoVendido = record
                         codigo: integer;
                         cantTotalUnidades: integer;
                         montoTotal: real;
                       end;
     arbol = ^nodoArbol;
     nodoArbol = record
                    dato: productoVendido;
                    HI: arbol;
                    HD: arbol;
                 end;
     
procedure ModuloA (var a: arbol);
{ Almacene los productos vendidos en una estructura eficiente para la búsqueda por código de producto. De cada producto deben quedar almacenados la cantidad total 
de unidades vendidas y el monto total. }

  Procedure CargarVenta (var v: venta);
  begin
    v.codigoVenta:= random (51) * 100;
    If (v.codigoVenta <> 0)
    then begin
           v.codigoProducto:= random (100) + 1;
           v.cantUnidades:= random(15) + 1;
           v.precioUnitario:= (100 + random (100))/2;
         end;
  end;  
  
  Procedure InsertarElemento (var a: arbol; elem: venta);
  var p: productoVendido;
     
     Procedure ArmarProducto (var p: productoVendido; v: venta);
     begin
       p.codigo:= v.codigoProducto;
       p.cantTotalUnidades:= v.cantUnidades;
       p.montoTotal:= v.cantUnidades * v.precioUnitario;
     end;
  
  Begin
    if (a = nil) 
    then begin
           new(a);
           ArmarProducto (p, elem);
           a^.dato:= p; 
           a^.HI:= nil; 
           a^.HD:= nil;
         end
    else if (elem.codigoProducto = a^.dato.codigo)
         then begin
                a^.dato.cantTotalUnidades:= a^.dato.cantTotalUnidades + elem.cantUnidades;
                a^.dato.montoTotal:= a^.dato.montoTotal + (elem.cantUnidades * elem.precioUnitario);
              end
         else if (elem.codigoProducto < a^.dato.codigo) 
              then InsertarElemento(a^.HI, elem)
              else InsertarElemento(a^.HD, elem); 
  End;

var unaVenta: venta;  
Begin
    writeln;
    writeln ('----- Ingreso de ventas y armado de arbol de productos ----->');
    writeln;
    a:= nil;
    CargarVenta (unaVenta);
    while (unaVenta.codigoVenta <> 0) do begin
          InsertarElemento (a, unaVenta);
          CargarVenta (unaVenta);
    end;
    writeln;
    writeln ('-----------------------------------------------');
    writeln;
end;

procedure ModuloB (a: arbol);
{ Imprima el contenido del árbol ordenado por código de producto.}
  procedure ImprimirArbol (a: arbol);
  begin
    if (a <> nil)
    then begin
          if (a^.HI <> nil) then ImprimirArbol (a^.HI);
          writeln ('Codigo producto: ', a^.dato.codigo, ' cantidad unidades: ', a^.dato.cantTotalUnidades, ' monto total: ', a^.dato.montoTotal:2:2);
          if (a^.HD <> nil) then ImprimirArbol (a^.HD);
         end;
  end;

begin
  writeln;
  writeln ('----- Modulo B ----->');
  writeln;
  if ( a = nil) then writeln ('Arbol vacio')
                else ImprimirArbol (a);
  writeln;
  writeln ('-----------------------------------------------');
  writeln;
end;
var a: arbol; 
Begin
  randomize;
  ModuloA (a);
  ModuloB (a);  
End.