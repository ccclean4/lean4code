-- Algebra: 環論

inductive Int' : Type
  | ofNat : Nat → Int'

namespace Int'

def add : Int' → Int' → Int'
  | ofNat a, ofNat b => ofNat (a + b)

def mul : Int' → Int' → Int'
  | ofNat a, ofNat b => ofNat (a * b)

def zero : Int' := ofNat 0
def one : Int' := ofNat 1

end Int'

#check Int'
example : Int' := Int'.one