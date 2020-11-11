type t

type op = ADD | SUB

val to_string : t -> string

val create : int -> int -> op list -> t

val interpret : t -> Number.t
