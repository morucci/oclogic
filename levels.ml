open Base

type t = LVL1 | LVL2 | LVL3

type level = { nb_expr : int; nb_depth : int; ops : Compute.op list }

let get lvl =
  match lvl with
  | LVL1 -> { nb_expr = 1; nb_depth = 1; ops = [ Compute.ADD ] }
  | LVL2 -> { nb_expr = 1; nb_depth = 2; ops = [ Compute.ADD ] }
  | LVL3 -> { nb_expr = 1; nb_depth = 1; ops = [ Compute.ADD; Compute.SUB ] }
