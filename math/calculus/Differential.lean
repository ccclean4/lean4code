-- Calculus: 微分

def deriv (f : Float → Float) (x : Float) : Float :=
  (f (x + 0.001) - f x) / 0.001

def secondDeriv (f : Float → Float) (x : Float) : Float :=
  (f (x + 0.001) - 2 * f x + f (x - 0.001)) / 0.000001

def d_dx (f : Float → Float) (x : Float) : Float := deriv f x

#eval deriv (fun x => x * x) 2.0
#eval secondDeriv (fun x => x * x * x) 1.0
#eval d_dx (fun x => Float.sin x) 0.0
#eval d_dx (fun x => Float.exp x) 1.0

example : Float := deriv (fun x => x * x * x) 1.0