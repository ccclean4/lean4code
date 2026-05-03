-- Calculus: 實分析

def isContinuous (f : Float → Float) (x : Float) : Bool := Float.abs (f (x + 0.0001) - f (x - 0.0001)) < 0.001

#eval isContinuous (fun x => x * x) 2.0

example : Bool := isContinuous (fun x => x) 0.0