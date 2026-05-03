-- Statistics: 機率論

def expectation (f : Float → Float) (dist : List Float) : Float :=
  let w := dist.map (· / dist.sum)
  (w.zip dist).foldl (fun a (wi, xi) => a + wi * f xi) 0.0

#eval expectation id [0.1, 0.2, 0.3, 0.4]

example : Float := expectation (fun x => x) [0.5, 0.5]