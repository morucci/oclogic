(* open Base *)
open Stdio

module Oclogic = struct
  let display_and_read c1 =
    printf "Calcule: %s = " (Compute.to_string c1);
    read_int ()

  let create_compute op =
    Random.self_init ();
    let nl = Random.int 10 in
    let nr = Random.int 10 in
    Compute.create (Number.from_int nl) (Number.from_int nr) op

  let round turn =
    printf "Tour(s): %i\n" (turn + 1);

    let c1 = create_compute Compute.ADD in
    let typed = display_and_read c1 in

    let expected = Compute.resolv c1 in
    match typed == Number.to_int expected with
    | true ->
        printf "Bravo !\n";
        Result.create c1 (Number.from_int typed) true
    | false ->
        printf "Faux !\n";
        Result.create c1 (Number.from_int typed) false

  let rec game turn turn_played results =
    let remain = turn - turn_played in
    match remain with
    | 0 ->
        printf "\nVoici tes resultats:\n%s\n"
          (results |> Results.to_string)
    | _ ->
        let ret = round turn_played in
        game turn (turn_played + 1) (Results.register results ret)
end

let () =
  let rounds = 3 in
  printf "\nBonjour ! Le Jeu commence. (%i tours)\n\n" rounds;
  Oclogic.game rounds 0 Results.empty
