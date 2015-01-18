(* les differents types possibles *)
type consttype = 
  Int_type
and term_type = 
| Const_type of consttype
| Fun_type of term_type * term_type

(* les differents termes possible *)
type term_expr = 
|  Const of term_const                          (* 1,2 ..., 10 *)
|  Var of string                                (* x, y ... *)
|  Unop of unop  * term_expr
|  Binop of binop  * term_expr * term_expr      (* +, -*)
|  App of term_expr * term_expr                 (* M N *)
|  Abs of string * term_expr                    (* fun x -> M *)

and term_const = Int of int

and unop = Moins

and binop = Plus
