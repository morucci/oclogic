
  type t = LVL1 | LVL2 | LVL3

  type level

  val get : t -> level
  val get_nb_expr : level -> int
  val get_nb_depth : level -> int
  val get_ops : level -> Compute.op list
