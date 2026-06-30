/* Fichero: ejemplo.lex */
package lexico;
import java.lang.System;
import sintactico.sym;
import java_cup.runtime.Symbol;
%%
%char
%public
%cup
%full
%type java_cup.runtime.Symbol

%{
boolean output = true;
%}

DIGITO = [0-9]
LETRA = [a-zA-Z]
LETRA_MIN = [a-z]
SIMBOLO = ({LETRA}|{DIGITO}|" "|\+|\-|\*|\/|\(|\))
SIGNO = [+-]
ENTERO = {SIGNO}?{DIGITO}+
VARIABLE  = ({LETRA_MIN}(_?{TODO}+)*)
TODO = [0-9a-zA-Z]
CADENA = (\"{SIMBOLO}*\")|('{SIMBOLO}*')
REAL = {ENTERO}\.{DIGITO}+
DOBLEBARRA = \/\/
COMMENT = {DOBLEBARRA}{SIMBOLO}+
BLANCO = (" "|\t)

%%
inicio 		{if (output) System.out.println("LEX: Palabra_reservada(inicio)"); 
			return new Symbol(sintactico.sym.inicio);}
fin 		{if (output) System.out.println("LEX: Palabra_reservada(fin)"); 
			return new Symbol(sintactico.sym.fin);}
imprime		{if (output) System.out.println("LEX: Palabra_reservada(imprime)"); 
			return new Symbol(sintactico.sym.imprime);}
;			{if (output) System.out.println("LEX: FinSentencia"); 
			return new Symbol(sintactico.sym.finSent);}
\+			{if (output) System.out.println("LEX: Mas"); 
			return new Symbol(sintactico.sym.mas);}
\-			{if (output) System.out.println("LEX: Menos"); 
			return new Symbol(sintactico.sym.menos);}
\*			{if (output) System.out.println("LEX: Por"); 
			return new Symbol(sintactico.sym.por);}
\/			{if (output) System.out.println("LEX: Entre"); 
			return new Symbol(sintactico.sym.entre);}
\(			{if (output) System.out.println("LEX: AbrePar"); 
			return new Symbol(sintactico.sym.abrePar);}
\)			{if (output) System.out.println("LEX: CierraPar"); 
			return new Symbol(sintactico.sym.cierraPar);}
\:=			{if (output) System.out.println("LEX: Asigna"); 
			return new Symbol(sintactico.sym.asigna);}
{ENTERO}	{if (output) System.out.println("LEX: Entero("+yytext()+")"); 
			return new Symbol(sintactico.sym.entero, new Double(yytext()));}
{CADENA}	{if (output) System.out.println("LEX: Cadena("+yytext()+")"); 
			return new Symbol(sintactico.sym.cadena);}
{VARIABLE}	{if (output) System.out.println("LEX: Variable("+yytext()+")"); 
			return new Symbol(sintactico.sym.variable, yytext());}			
{REAL} 		{if (output) System.out.println("LEX: Real("+yytext()+")"); 
			return new Symbol(sintactico.sym.real, new Double(yytext()));}
{COMMENT}	{if (output) System.out.println("LEX: Comentario " + yytext()); }
{BLANCO} 	{}
[\n\r]		{}
.			{System.out.print(" ERROR_Lexico");}