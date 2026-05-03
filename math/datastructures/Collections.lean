-- DataStructures: 資料結構

inductive Stackα (α : Type) where | empty | push : α → Stackα α → Stackα α
namespace Stackα
def push' (s : Stackα α) (x : α) : Stackα α := push x s
def pop : Stackα α → Option (α × Stackα α) | empty => none | push x r => some (x, r)
def top : Stackα α → Option α | empty => none | push x _ => some x
def isEmpty : Stackα α → Bool | empty => true | _ => false
def size : Stackα α → Nat | empty => 0 | push _ s => 1 + size s
end Stackα

inductive Queueα (α : Type) where | empty | enq : α → Queueα α → Queueα α
namespace Queueα
def enq' (q : Queueα α) (x : α) : Queueα α := enq x q
def front : Queueα α → Option α | empty => none | enq x _ => some x
def isEmpty : Queueα α → Bool | empty => true | _ => false
end Queueα

inductive Treeα (α : Type) where | leaf : α → Treeα α | node : Treeα α → Treeα α → Treeα α
namespace Treeα
def size : Treeα α → Nat | leaf _ => 1 | node l r => size l + size r
def height : Treeα α → Nat | leaf _ => 0 | node l r => 1 + max (height l) (height r)
def inorder : Treeα α → List α | leaf x => [x] | node l r => inorder l ++ inorder r
end Treeα

#check Stackα
#eval Stackα.size (Stackα.push 1 (Stackα.push 2 Stackα.empty))
#eval Treeα.size (Treeα.node (Treeα.leaf 1) (Treeα.leaf 2))

example : Stackα Nat := Stackα.push 1 (Stackα.push 2 Stackα.empty)