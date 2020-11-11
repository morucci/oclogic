type t = Result.t list

let get_note results =
  let good = results |> List.filter Result.is_good |> List.length in
  string_of_int good ^ "/" ^ string_of_int (results |> List.length)

let to_string results =
  "Voici tes resultats:\n"
  ^ (results |> List.rev |> List.map Result.to_string |> String.concat "\n")
  ^ "\n" ^ "Note: " ^ (results |> get_note) ^ "\n"

let register results result = result :: results

let empty = []
