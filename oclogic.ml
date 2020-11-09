(* open Base *)
open Stdio

module Oclogic = struct
  let display_and_read c1 =
    printf "Calcule: %s = " (Compute.display c1);
    read_int ()

  let create_compute op =
    Random.self_init ();
    let nl = Random.int 10 in
    let nr = Random.int 10 in
    Compute.create (Number.from_int nl) (Number.from_int nr) op

  let round turn =
    printf "Running turn %i\n" turn;
    let c1 = create_compute Compute.ADD in
    let typed = display_and_read c1 in

    let expected = Compute.resolv c1 in
    match typed == expected with
    | true ->
        printf "Bravo !\n";
        true
    | false ->
        printf "Faux !\n";
        false

  let rec game turn turn_played =
    printf "Running game with %i turns\n" turn;
    printf "Turn played %i\n" turn_played;

    let remain = turn - turn_played in
    match remain with
    | 0 -> ()
    | _ ->
        let _ = round turn_played in
        game turn (turn_played + 1)
end

let () =
  printf "Start game !\n";
  Oclogic.game 3 0
