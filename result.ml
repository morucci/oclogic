type t = { compute : Compute.t; input : Number.t; result : bool }

let create compute input result = { compute; input; result }

let to_string result =
  let base = " Calcul '" ^ Compute.to_string result.compute ^ "' " in
  let result_str =
    match result.result with true -> "[Bon]" | false -> "[Faux]"
  in
  result_str ^ base ^ " = "
  ^ Number.to_string (Compute.interpret result.compute)
  ^ " ("
  ^ Number.to_string result.input
  ^ ")"
