(* open Base *)
open Stdio

module Number : sig
  type t

  val to_string : t -> string

  val from_int : int -> t

  val to_int : t -> int
end = struct
  type t = int

  let to_string n = Int.to_string n

  let from_int n = n

  let to_int n = n
end

module Compute : sig
  type t

  val display : t -> string

  val create : Number.t -> Number.t -> string -> t

  val resolv : t -> Int.t
end = struct
  type t = { nl : Number.t; nr : Number.t; op : string }

  let display c =
    Number.to_string c.nl ^ " " ^ c.op ^ " " ^ Number.to_string c.nr

  let create nl nr op = { nl; nr; op }

  let resolv c = Number.to_int c.nl + Number.to_int c.nr
end

let display_and_read c1 = 
  printf "Calcule: %s = " (Compute.display c1);
  read_int ()

let round = 
  let create_compute op nl nr =
    Compute.create (Number.from_int nl) (Number.from_int nr) op in

  let c1 = create_compute "+" 1 3 in
  let typed = display_and_read c1 in

  let expected = Compute.resolv c1 in
  typed == expected


let () = 
  let result = round in
  printf "The result is %b\n" result
