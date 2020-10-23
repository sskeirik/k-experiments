module LIST-SIZER-SYNTAX
  imports INT-SYNTAX
  syntax MyList ::= List{Int, ""}
endmodule

module LIST-SIZER
  imports LIST-SIZER-SYNTAX
  imports INT
  imports LIST

  syntax List ::= toList(MyList) [function, functional]
  // --------------------------------------------------
  rule toList(I L:MyList) => ListItem(I) toList(L)
  rule toList(   .MyList) => .List

  configuration <k> toList($PGM:MyList) </k>
                <size> 0 </size>

  rule <k> .List => .K </k>

  rule <k> ListItem(_E) L:List => L:List </k>
       <size> N => N +Int 1 </size>
endmodule
