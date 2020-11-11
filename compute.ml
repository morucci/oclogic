type op = ADD | SUB

type t = Num of Number.t | Operation of { op : op; l : t; r : t }

let op_to_string op = match op with ADD -> " + " | SUB -> " - "

let rec to_string c =
  match c with
  | Num n -> Number.to_string n
  | Operation o -> to_string o.l ^ op_to_string o.op ^ to_string o.r

let get_random_op ops = List.nth ops (Random.int (List.length ops))

let rec create c d ops =
  match c with
  | 0 ->
      Random.self_init ();
      Num (Number.from_int (Random.int (d * 10)))
  | x ->
      Operation
        { op = get_random_op ops; l = create (x - 1) d ops; r = create 0 d ops }

let op_to_func o = match o with ADD -> ( + ) | SUB -> ( - )

let interpret comp =
  let rec _interpret c =
    match c with
    | Num n -> Number.to_int n
    | Operation o -> (op_to_func o.op) (_interpret o.l) (_interpret o.r)
  in
  Number.from_int (_interpret comp)
