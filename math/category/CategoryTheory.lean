-- Category: 範疇論

class Cat (obj : Type u) where
  hom : obj → obj → Type v
  id : ∀ (a : obj), hom a a

#check Cat

example (α : Type) : Cat α where
  hom := fun _ _ => Unit
  id := fun _ => Unit.unit