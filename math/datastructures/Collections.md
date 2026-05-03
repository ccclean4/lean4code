# Collections.lean

## 數學原理

### 資料結構

本檔案展示三種基本資料結構：Stack（棧）、Queue（佇列）、Tree（元樹）。

### 棧（Stack）

棧是 LIFO（後進先出）資料結構。

### 佇列（Queue）

佇列是 FIFO（先進先出）資料結構。

### 樹（Tree）

二元樹的遞迴定義。

## 程式意義

### 棧

```lean
inductive Stackα (α : Type) where | empty | push : α → Stackα α → Stackα α
namespace Stackα
def push' (s : Stackα α) (x : α) : Stackα α := push x s
def pop : Stackα α → Option (α × Stackα α) | empty => none | push x r => some (x, r)
def top : Stackα α → Option α | empty => none | push x _ => some x
def isEmpty : Stackα α → Bool | empty => true | _ => false
def size : Stackα α → Nat | empty => 0 | push _ s => 1 + size s
end Stackα
```

### 佇列

```lean
inductive Queueα (α : Type) where | empty | enq : α → Queueα α → Queueα α
namespace Queueα
def enq' (q : Queueα α) (x : α) : Queueα α := enq x q
def front : Queueα α → Option α | empty => none | enq x _ => some x
def isEmpty : Queueα α → Bool | empty => true | _ => false
end Queueα
```

### 樹

```lean
inductive Treeα (α : Type) where | leaf : α → Treeα α | node : Treeα α → Treeα α → Treeα α
namespace Treeα
def size : Treeα α → Nat | leaf _ => 1 | node l r => size l + size r
def height : Treeα α → Nat | leaf _ => 0 | node l r => 1 + max (height l) (height r)
def inorder : Treeα α → List α | leaf x => [x] | node l r => inorder l ++ inorder r
end Treeα
```

## 範例

```lean
#check Stackα
#eval Stackα.size (Stackα.push 1 (Stackα.push 2 Stackα.empty))
#eval Treeα.size (Treeα.node (Treeα.leaf 1) (Treeα.leaf 2))

example : Stackα Nat := Stackα.push 1 (Stackα.push 2 Stackα.empty)
```

## 教學重點

1. 代數資料類型（ADT）的設計
2. 資料結構的基本操作