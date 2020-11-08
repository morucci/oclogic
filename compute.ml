
  type t = { nl : Number.t; nr : Number.t; op : string }

  let display c =
    Number.to_string c.nl ^ " " ^ c.op ^ " " ^ Number.to_string c.nr

  let create nl nr op = { nl; nr; op }

  let resolv c = Number.to_int c.nl + Number.to_int c.nr
