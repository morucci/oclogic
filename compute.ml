type op = ADD

type t = Num of Number.t | Operation of { op : op; l : t; r : t }

let op_to_string op = match op with ADD -> " + "

let rec to_string c =
  match c with
  | Num n -> Number.to_string n
  | Operation o -> to_string o.l ^ op_to_string o.op ^ to_string o.r

let rec create c d =
  match c with
  | 0 ->
      Random.self_init ();
    Num (Number.from_int (Random.int (d  * 10)))
  | x -> Operation { op = ADD; l = create (x - 1) d; r = create 0 d }

let op_to_func o = match o with ADD -> ( + )

let interpret comp =
  let rec _interpret c =
    match c with
    | Num n -> Number.to_int n
    | Operation o -> (op_to_func o.op) (_interpret o.l) (_interpret o.r)
  in
  Number.from_int (_interpret comp)
