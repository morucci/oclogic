type t

type op = ADD

val to_string : t -> string

val create : int -> int -> t

val interpret : t -> Number.t
