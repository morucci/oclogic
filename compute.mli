type t

type op = ADD

val to_string : t -> string

val create : Number.t -> Number.t -> op -> t

val resolv : t -> Number.t
