type t

type op = ADD

val display : t -> string

val create : Number.t -> Number.t -> op -> t

val resolv : t -> Int.t
