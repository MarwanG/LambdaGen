(* les differents types possibles *)
type consttype = 
  Int_type
| List_type of term_type
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

and term_const = Int of int | List of term_expr list

and unop = Moins

and binop = Plus

let rec string_of_type t =
  match t with 
    | Const_type c -> "int"
    | Fun_type (t1,t2) -> "("^(string_of_type t1)^"->"^(string_of_type t2)^")"

let rec string_of_exp t =
  match t with 
    | Const (Int i) -> string_of_int i
    | Const (List l) -> 
      let rec aux l = 
	match l with 
	  [] -> ""
	| h::[] -> (string_of_exp h)
	| h::tl -> ((string_of_exp h)^"; "^(aux tl))
      in ("["^(aux l)^"]")
    | Var s -> s            
    | App (t1,t2) ->  "("^(string_of_exp t1)^") ("^(string_of_exp t2)^")"          
    | Abs (s,t) ->  "(fun "^s^" -> "^(string_of_exp t)^")" 
    | Binop (_,t1,t2) ->(string_of_exp t1)^" + "^(string_of_exp t2)
    | Unop (_,t1) ->("- "^(string_of_exp t1) )   

