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
boolean output = false;
%}

DIGITO = [0-9]
LETRA = [a-zA-Z]
SIMBOLO = {LETRA}|{DIGITO}|" "|\+|\-|\*|\/|\(|\)
LINEA = {SIMBOLO}+
SIGNO = [+-]
ENTERO = {SIGNO}?{DIGITO}+
CADENA = (\"{LINEA}?\")|('{LINEA}?')
REAL = {ENTERO}\.{DIGITO}+
DOBLEBARRA = \/\/
COMMENT = {DOBLEBARRA}{LINEA}
BLANCO = [" "\t]

LETRAMIN = [a-zñ]
ALFANUM = {DIGITO}|{LETRA}
VARIABLE = {LETRAMIN}(\_?{ALFANUM})*

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
\:=			{if (output) System.out.println("LEX: Asigna"); 
			return new Symbol(sintactico.sym.asigna);}
\(			{if (output) System.out.println("LEX: ParAbierto"); 
			return new Symbol(sintactico.sym.parAbierto);}
\)			{if (output) System.out.println("LEX: ParCerrado"); 
			return new Symbol(sintactico.sym.parCerrado);}
\<			{if (output) System.out.println("LEX: MenorQue"); 
			return new Symbol(sintactico.sym.menorQue);}
\>			{if (output) System.out.println("LEX: MayorQue"); 
			return new Symbol(sintactico.sym.mayorQue);}
\==			{if (output) System.out.println("LEX: IgualQue"); 
			return new Symbol(sintactico.sym.igualQue);}
\&			{if (output) System.out.println("LEX: Elevado"); 
			return new Symbol(sintactico.sym.elevado);}
{ENTERO}	{if (output) System.out.println("LEX: Entero("+yytext()+")"); 
			return new Symbol(sintactico.sym.entero, new Double(yytext()));}
{VARIABLE}  {if (output) System.out.println("LEX: Variable("+yytext()+")");
			return new Symbol(sintactico.sym.variable, yytext());}
{CADENA}	{if (output) System.out.println("LEX: Cadena("+yytext()+")"); 
			return new Symbol(sintactico.sym.cadena, yytext());}
{REAL} 		{if (output) System.out.println("LEX: Real("+yytext()+")"); 
			return new Symbol(sintactico.sym.real, new Double (yytext()));}
{COMMENT}	{if (output) System.out.println("LEX: Comentario " + yytext()); }
{BLANCO} 	{}
[\n\r]		{}
.			{System.out.print(" ERROR_Lexico");}
