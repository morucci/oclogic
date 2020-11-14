open Base

type round_d_t = { compute : Compute.t; input : Number.t }

type round_result = (round_d_t, round_d_t) Result.t

type t = round_result list

let get_note results =
  let good = results |> List.filter ~f:Result.is_ok |> List.length in
  Int.to_string good ^ "/" ^ Int.to_string (results |> List.length)

let ret_to_string r =
  let to_s round_d =
    let base = " Calcul '" ^ Compute.to_string round_d.compute ^ "' " in
    base ^ " = "
    ^ Number.to_string (Compute.interpret round_d.compute)
    ^ " ("
    ^ Number.to_string round_d.input
    ^ ")"
  in
  match r with Ok r' -> "[Bon]" ^ to_s r' | Error r' -> "[Faux]" ^ to_s r'

let to_string results =
  "Voici tes resultats:\n"
  (* ^ (results |> List.rev |> List.map Cresult.to_string |> String.concat "\n") *)
  ^ (results |> List.rev |> List.map ~f:ret_to_string |> String.concat ~sep:"\n")
  ^ "\n" ^ "Note: " ^ (results |> get_note) ^ "\n"

let create_round_d compute input = { compute; input }

let register (results : t) result = result :: results

let empty = []
