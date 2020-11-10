type t = Result.t list

let to_string results = 
    results |> List.rev |> List.map Result.to_string |> String.concat "\n"

let register results result = result :: results

let empty = []
