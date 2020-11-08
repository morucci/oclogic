(* open Base *)
open Stdio


let display_and_read c1 = 
  printf "Calcule: %s = " (Compute.display c1);
  read_int ()

let round = 
  let create_compute op nl nr =
    Compute.create (Number.from_int nl) (Number.from_int nr) op in

  let c1 = create_compute "+" 1 3 in
  let typed = display_and_read c1 in

  let expected = Compute.resolv c1 in
  typed == expected


let () = 
  let result = round in
  printf "The result is %b\n" result
