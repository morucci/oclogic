type t

type op = ADD

val to_string : t -> string

val create : int -> t

val interpret : t -> Number.t
