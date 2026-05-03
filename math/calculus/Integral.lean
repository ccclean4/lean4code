-- Calculus: 積分

def riemannSum (f : Float → Float) (a b : Float) (n : Nat) : Float :=
  let dx := (b - a) / n.toFloat
  let rec sum (i : Nat) (acc : Float) : Float :=
    if i >= n then acc
    else sum (i + 1) (acc + f (a + dx * i.toFloat) * dx)
  sum 0 0.0

def trapezoid (f : Float → Float) (a b : Float) (n : Nat) : Float :=
  let dx := (b - a) / n.toFloat
  let rec go (i : Nat) (acc : Float) : Float :=
    if i >= n then acc
    else
      let x := a + dx * i.toFloat
      let xNext := a + dx * (i + 1).toFloat
      go (i + 1) (acc + (f x + f xNext) / 2.0 * dx)
  go 0 0.0

def integrate (f : Float → Float) (a b : Float) : Float := trapezoid f a b 100

#eval riemannSum (fun x => x * x) 0.0 1.0 100
#eval trapezoid (fun x => x * x) 0.0 1.0 100
#eval integrate (fun x => x * x) 0.0 1.0

example : Float := riemannSum (fun x => x) 0.0 1.0 10