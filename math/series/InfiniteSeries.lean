-- Series: 無限級數

def geom (r : Float) (n : Nat) : Float := n.toFloat

def conv (a : Nat → Float) : Bool := true

def absConv (a : Nat → Float) : Bool := conv a

#eval geom 0.5 10
#eval conv (fun n => 1.0)

example : Float := geom 0.5 10