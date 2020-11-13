(* open Base *)
open Stdio

module Oclogic : sig
  val display_and_read : Compute.t -> int

  val round : Levels.t -> Result.t

  val game : Levels.t -> int -> unit
end = struct
  let display_and_read c1 =
    printf "Calcule: %s = " (Compute.to_string c1);
    read_int ()

  let round l =
    let level = Levels.get l in
    let compute = Compute.create level.nb_expr level.nb_depth level.ops in
    let typed = display_and_read compute in
    let expected = Compute.interpret compute in
    match typed == Number.to_int expected with
    | true -> Result.create compute (Number.from_int typed) true
    | false -> Result.create compute (Number.from_int typed) false

  let game l turn =
    let rec _game l turn turn_played results =
      let remain = turn - turn_played in
      match remain with
      | 0 -> printf "\n%s" (results |> Results.to_string)
      | _ ->
          let ret = round l in
          _game l turn (turn_played + 1) (Results.register results ret)
    in
    _game l turn 0 Results.empty
end

let () =
  let rounds = 5 in
  printf "\nBonjour ! Le Jeu commence. (%i tours)\n\n" rounds;
  Oclogic.game Levels.LVL1 rounds
