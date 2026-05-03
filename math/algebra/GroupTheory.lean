-- Algebra: 群論

inductive MyNat : Type
  | zero : MyNat
  | succ : MyNat → MyNat

namespace MyNat

def add : MyNat → MyNat → MyNat
  | a, zero => a
  | a, succ b => succ (add a b)

def mul : MyNat → MyNat → MyNat
  | _, zero => zero
  | a, succ b => add (mul a b) a

theorem addZero (n : MyNat) : add n zero = n := rfl
theorem addSucc (n m : MyNat) : add n (succ m) = succ (add n m) := rfl
theorem mulZero (n : MyNat) : mul n zero = zero := rfl
theorem mulSucc (n m : MyNat) : mul n (succ m) = add (mul n m) n := rfl

end MyNat

#check MyNat
#check MyNat.add
#check MyNat.mul

example : MyNat := MyNat.add MyNat.zero (MyNat.succ MyNat.zero)