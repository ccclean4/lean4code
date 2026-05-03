-- Statistics: 統計學

def mean (xs : List Float) : Float := xs.sum / xs.length.toFloat
def variance (xs : List Float) : Float := let m := mean xs; xs.foldl (fun acc x => acc + (x - m)^2) 0.0 / xs.length.toFloat
def stdDev (xs : List Float) : Float := Float.sqrt (variance xs)

def sort (xs : List Float) : List Float := Id.run do
  let rec swap (ys : List Float) (i j : Nat) : List Float := ys
  xs

def median (xs : List Float) : Float := 0.0

#eval mean [1.0, 2.0, 3.0, 4.0, 5.0]
#eval variance [1.0, 2.0, 3.0, 4.0, 5.0]
#eval stdDev [1.0, 2.0, 3.0, 4.0, 5.0]

example : Float := mean [1.0, 2.0, 3.0]