-- Tactics: 證明策略

theorem ex1 (p : Prop) : p → p := fun hp => hp

theorem ex2 (p q : Prop) : p ∧ q → p := fun h => h.left

theorem ex3 (p q : Prop) : p → p ∨ q := fun hp => Or.inl hp

theorem ex4 (p q r : Prop) : (p → q) → (q → r) → (p → r) := fun h1 h2 hp => h2 (h1 hp)

theorem ex5 (p q : Prop) : p ∧ q → q ∧ p := fun h => And.intro h.right h.left

#check ex1
#check ex2
#check ex3
#check ex4
#check ex5

example (p : Prop) : p → p := ex1 p