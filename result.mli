type t

(* Create takes the compute, the user input, and the result *)
val create : Compute.t -> Number.t -> bool -> t

val to_string : t -> string

val is_good : t -> bool
