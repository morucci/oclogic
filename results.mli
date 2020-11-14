type t

type round_d_t = { compute : Compute.t; input : Number.t }

type round_result = (round_d_t, round_d_t) Result.t

val get_note : t -> string

val to_string : t -> string

val create_round_d : Compute.t -> Number.t -> round_d_t

val register : t -> round_result -> t

val empty : t
