/* Fichero: ejemplo.lex */
package lexico;
import java.io.InputStreamReader;
import java.lang.System;
%%
%char
%public
%standalone
%full

LETRA = [a-zA-ZñÑ]
DIGITO = [0-9]
SIGNO = [+-]
REAL = {SIGNO}?{DIGITO}+\.{DIGITO}+
ENTERO = {SIGNO}?{DIGITO}+
LETRAMIN = [a-zñ]
ALFANUM = {DIGITO}|{LETRA}
VARIABLE = {LETRAMIN}(\_?{ALFANUM})*
SIMBOLOS = (\+|\-|\*|\/|\(|\))
BLANCO = (" "|\t)
CADENATEXTO = \"({ALFANUM}|{BLANCO}|{SIMBOLOS})+\"|\'({ALFANUM}|{BLANCO}|{SIMBOLOS})+\'
DOBLEBARRA = \/\/
COMENTARIOS = {DOBLEBARRA}({ALFANUM}|{SIMBOLOS}|{BLANCO})+

%%
imprime {System.out.print(" Palabra_reservada(imprime)");}
inicio {System.out.print(" Palabra_reservada(inicio)");}
fin {System.out.print(" Palabra_reservada(fin)");}

{COMENTARIOS} {System.out.print(" Comentarios("+yytext()+")");}
{CADENATEXTO} {System.out.print(" Cadena("+yytext()+")");}
{VARIABLE} {System.out.print(" Variable("+yytext()+")");}
{REAL} {System.out.print(" Real("+yytext()+")");}
{ENTERO} {System.out.print(" Entero("+yytext()+")");}
; {System.out.print(" FinSentencia");}
\:= {System.out.print(" Asigna");}
\( {System.out.print(" Abre-Par");}
\) {System.out.print(" Cierra-Par");}
\/ {System.out.print(" Entre");}
\* {System.out.print(" Por");}
\+ {System.out.print(" Mas");}
\- {System.out.print(" Menos");}
{BLANCO} {System.out.print(yytext());}
\n {System.out.print(yytext());}
. {System.out.print(" ERROR_Lexico");}
