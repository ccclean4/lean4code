-- Algorithms: 搜尋樹

inductive Tree (α : Type) where
  | empty : Tree α
  | node : α → Tree α → Tree α → Tree α

namespace Tree

def insert (cmp : α → α → Ordering) (x : α) : Tree α → Tree α
  | empty => node x empty empty
  | node v l r => match cmp x v with | .lt => node v (insert cmp x l) r | .gt => node v l (insert cmp x r) | .eq => node v l r

def search (cmp : α → α → Ordering) (x : α) : Tree α → Bool
  | empty => false
  | node v l r => match cmp x v with | .lt => search cmp x l | .gt => search cmp x r | .eq => true

def toList : Tree α → List α
  | empty => []
  | node v l r => toList l ++ [v] ++ toList r

def height : Tree α → Nat
  | empty => 0
  | node _ l r => 1 + max (height l) (height r)

end Tree

#check Tree
#check Tree.insert

def cmpInt (a b : Int) : Ordering := if a < b then .lt else if a > b then .gt else .eq

example : Tree Int := Tree.insert cmpInt 5 (Tree.insert cmpInt 3 (Tree.insert cmpInt 7 Tree.empty))
example : Bool := Tree.search cmpInt 5 (Tree.insert cmpInt 5 Tree.empty)