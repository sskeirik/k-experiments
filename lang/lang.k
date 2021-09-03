module LANG-SYNTAX
  imports INT-SYNTAX
  imports BOOL-SYNTAX

  syntax Type ::= "int"
                | "pair" Type TypeList

  syntax TypeList ::= Type
                    > Type TypeList

  syntax Data ::= Int
                | "Pair" Data DataList

  syntax DataList ::= Data
                    | Data DataList

  syntax Type ::= "(" Type ")"
  syntax Data ::= "(" Data ")"

  syntax Input ::= Type Data
endmodule

module LANG
  imports LANG-SYNTAX

  configuration <k> $PGM:Input </k>
endmodule
