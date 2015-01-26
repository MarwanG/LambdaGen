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
  Random.self_init();
  print_string "bonjour :)";
  print_newline ();  
  let rnd_tree = generate 0.2499 in
  print_string "blop\n";
  let rnd_type =  tree_to_term_type rnd_tree in  
    print_string "blop\n";
  let exp = gen_exp rnd_type  10 in
    print_string ( string_of_type (tree_to_term_type rnd_tree));
    print_newline ();
    print_string "Size : ";
    print_int (size_tree rnd_tree);
    print_newline();
    print_string (string_of_exp exp)
    
