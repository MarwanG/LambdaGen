open Types

type type_tree = Node of type_tree * type_tree | Leaf

let b x = (1. -. sqrt (1. -. 4. *. x)) /. 2.

let rec size_tree tree =
  match tree with 
    | Node (a,b) -> size_tree a + size_tree b
    | _ -> 1

let generate z =
  if z < 0.25 && z >= 0. then  
    let node_proba = z /. (b z) in 
    let rec aux () =
      let x = Random.float 1. in
      if x < node_proba then Leaf else Node (aux (),aux ())
    in aux ()
  else 
    failwith "z must be in [0;0.25["

let rec tree_to_term_type tree = 
  match tree with
  | Node (a,b) -> Fun_type (tree_to_term_type a, tree_to_term_type b)
  | _ ->
    let x = Random.float 1. in
    if x < 0.7 then Const_type Int_type 
    else Const_type (List_type (tree_to_term_type (generate 0.22)))

let gen_type z =
  tree_to_term_type (generate z)

let rec improvise t =
  match t with
  | Const_type Int_type -> 
    Const (Int (Random.int 10))
      
  | Const_type (List_type(a))-> 
     Const (List [improvise a; improvise a;improvise a])
  | Fun_type (t1,t2) -> 
    try Environnement.search t
    with 
    | _ -> Abs("x", improvise t2)

let rec gen_exp typ taille = 
  if taille < 2 then 
    improvise typ
  else
    let rnd_tree = generate 0.2499 in
    let rnd_type =  tree_to_term_type rnd_tree in 
    let size_rnd = size_tree rnd_tree in
      if size_rnd > taille then
	App(Abs("x",gen_exp typ 0), gen_exp rnd_type 0)
      else
	App(Abs("x",gen_exp typ (taille - size_rnd)), gen_exp rnd_type size_rnd)
    
