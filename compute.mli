
  type t

  val display : t -> string

  val create : Number.t -> Number.t -> string -> t

  val resolv : t -> Int.t
