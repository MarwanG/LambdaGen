open Boltzmann_type
open Types

let rec sum_size i total =
  match i with
    | 0 -> total
    | _ -> let size = size_tree (generate 0.2499) in
	       sum_size (i-1)(total +size)

let average i =
  (sum_size i 0) / i

let _ =
  Environnement.init();
  Random.self_init();
  let rnd_tree = generate 0.2499 in
  let rnd_type =  tree_to_term_type rnd_tree in  
  let exp = gen_exp rnd_type  10 in
    print_string ("generation of a term of type: "^(string_of_type (tree_to_term_type rnd_tree)));
    (*print_newline ();
    print_string "Size : ";
    print_int (size_tree rnd_tree);*)
    print_newline();
    print_string (string_of_exp exp);
    print_newline()   
