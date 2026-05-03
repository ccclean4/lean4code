-- Tactics: 結構化證明

theorem andComm (p q : Prop) : p ∧ q → q ∧ p := fun h => And.intro h.right h.left
theorem orComm (p q : Prop) : p ∨ q → q ∨ p := fun h => Or.elim h Or.inr Or.inl
theorem impliesTrans (p q r : Prop) : (p → q) → (q → r) → (p → r) := fun h1 h2 hp => h2 (h1 hp)
theorem contrapositive (p q : Prop) : (p → q) → (¬q → ¬p) := fun h hnq hp => hnq (h hp)
theorem deMorgan1 (p q : Prop) : ¬(p ∨ q) → ¬p ∧ ¬q := fun h => And.intro (fun hp => h (Or.inl hp)) (fun hq => h (Or.inr hq))

#check andComm
#check orComm
#check impliesTrans
#check contrapositive
#check deMorgan1

example : p ∧ q → q ∧ p := andComm p q
example : p ∨ q → q ∨ p := orComm p q