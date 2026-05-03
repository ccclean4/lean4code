# SearchTrees.lean

## 數學原理

### 二元搜尋樹的定義

二元搜尋樹（BST）是滿足以下條件的二元樹：

對所有節點 $v$，若左子樹存在，則左子樹所有節點 $< v$；若右子樹存在，則右子樹所有節點 $> v$。

### BST 的數學性質

搜尋樹的中序遍歷產生有序序列。

### 高度與節點關係

對於高度為 $h$ 的 BST：
- 最小節點數：$h + 1$（完全樹）
- 最大節點數：$2^{h+1} - 1$

### 搜索複雜度

搜索時間為 $O(h)$，平衡樹為 $O(\log n)$。

## 程式意義

### BST 歸納類型

```lean
inductive Tree (α : Type) where
  | empty : Tree α
  | node : α → Tree α → Tree α → Tree α
```

### 插入

```lean
def insert (cmp : α → α → Ordering) (x : α) : Tree α → Tree α
  | empty => node x empty empty
  | node v l r => match cmp x v with | .lt => node v (insert cmp x l) r | .gt => node v l (insert cmp x r) | .eq => node v l r
```

### 搜尋

```lean
def search (cmp : α → α → Ordering) (x : α) : Tree α → Bool
  | empty => false
  | node v l r => match cmp x v with | .lt => search cmp x l | .gt => search cmp x r | .eq => true
```

### 中序遍歷

```lean
def toList : Tree α → List α
  | empty => []
  | node v l r => toList l ++ [v] ++ toList r
```

### 高度

```lean
def height : Tree α → Nat
  | empty => 0
  | node _ l r => 1 + max (height l) (height r)
```

### 比較函數

```lean
def cmpInt (a b : Int) : Ordering := if a < b then .lt else if a > b then .gt else .eq
```

## 範例

```lean
#check Tree
#check Tree.insert

def cmpInt (a b : Int) : Ordering := if a < b then .lt else if a > b then .gt else .eq

example : Tree Int := Tree.insert cmpInt 5 (Tree.insert cmpInt 3 (Tree.insert cmpInt 7 Tree.empty))
example : Bool := Tree.search cmpInt 5 (Tree.insert cmpInt 5 Tree.empty)
```

## 教學重點

1. BST 的遞迴定義
2. 搜尋與插入的邏輯
3. 中序遍歷的性質