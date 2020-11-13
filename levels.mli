type t = LVL1 | LVL2 | LVL3

type level = { nb_expr : int; nb_depth : int; ops : Compute.op list }

val get : t -> level
