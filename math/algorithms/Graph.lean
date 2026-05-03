-- Algorithms: 圖論

inductive Graphα (α : Type) where
  | empty : Graphα α
  | addV : α → Graphα α → Graphα α
  | addE : α × α → Graphα α → Graphα α

namespace Graphα

def vertices {α} : Graphα α → List α
  | empty => []
  | addV v g => v :: vertices g
  | addE _ g => vertices g

def edges {α} : Graphα α → List (α × α)
  | empty => []
  | addV _ g => edges g
  | addE e g => e :: edges g

end Graphα

#check Graphα

example : Graphα Nat := Graphα.addE (1, 2) (Graphα.addV 2 (Graphα.addV 1 Graphα.empty))