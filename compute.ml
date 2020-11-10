type op = ADD

type t = { nl : Number.t; nr : Number.t; op : op }

let op_to_string op = match op with ADD -> " + "

let to_string c =
  Number.to_string c.nl ^ op_to_string c.op ^ Number.to_string c.nr

let create nl nr op = { nl; nr; op }

let resolv c = Number.from_int (Number.to_int c.nl + Number.to_int c.nr)
