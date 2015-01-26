open Types

let table = Hashtbl.create 10

let init () = 
  Hashtbl.add
    table
    (Fun_type(Const_type Int_type, Const_type Int_type))
    (Abs("a", Binop(Plus, Var "a", Const (Int 1))));
  Hashtbl.add 
    table
    (Fun_type(Const_type Int_type, 
	     Fun_type(Const_type Int_type, Const_type Int_type))) 
    (Abs("x", Abs("y",Binop(Plus, Var "x", Var "y"))))

let search t = Hashtbl.find table t
