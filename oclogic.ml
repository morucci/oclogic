(* open Base *)
open Stdio

module Oclogic = struct
  let display_and_read c1 =
    printf "Calcule: %s = " (Compute.display c1);
    read_int ()

  let round =
    let create_compute op nl nr =
      Compute.create (Number.from_int nl) (Number.from_int nr) op
    in

    let c1 = create_compute Compute.ADD 1 3 in
    let typed = display_and_read c1 in

    let expected = Compute.resolv c1 in
    match (typed == expected) with
      | true -> printf "Bravo !\n"
      | false -> printf "Faux, essaie encore\n"
end

let () = Oclogic.round
