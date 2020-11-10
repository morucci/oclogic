type t

val to_string: t -> string

val register: t -> Result.t -> t

val empty: t
