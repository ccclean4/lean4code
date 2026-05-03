-- Algorithms: 排序

def insertion (xs : List Nat) : List Nat :=
  let rec insert (x : Nat) (ys : List Nat) : List Nat :=
    match ys with
    | [] => [x]
    | y :: rest => if x ≤ y then x :: y :: rest else y :: insert x rest
  xs.foldl (fun ys x => insert x ys) []

#eval insertion [5, 3, 8, 1, 2]

example : List Nat := insertion [3, 1, 4]