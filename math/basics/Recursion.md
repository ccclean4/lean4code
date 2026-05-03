# Recursion.lean

## 數學原理

### 遞迴與數學歸納法

遞迴程式的正確性與數學歸納法密切相關。

費波那契數列：

$$f(0) = 0, \quad f(1) = 1, \quad f(n+2) = f(n) + f(n+1)$$

## 程式意義

### 費波那契數列

```lean
def fib (n : Nat) : Nat :=
  match n with
  | 0 => 0
  | 1 => 1
  | n + 2 => fib n + fib (n + 1)
```

### 尾遞迴版本

```lean
def fibTail (n : Nat) : Nat :=
  let rec go (a b : Nat) : Nat → Nat
    | 0 => a
    | 1 => b
    | n + 2 => go b (a + b) n
  go 0 1 n
```

### 樹的定義

```lean
inductive Tree (α : Type) where
  | leaf : α → Tree α
  | node : Tree α → Tree α → Tree α
```

### 樹狀遞迴

```lean
def treeSize {α : Type} (t : Tree α) : Nat :=
  match t with
  | Tree.leaf _ => 1
  | Tree.node l r => 1 + treeSize l + treeSize r

def treeMax (t : Tree Nat) : Nat :=
  match t with
  | Tree.leaf x => x
  | Tree.node l r => max (treeMax l) (treeMax r)
```

### 插入排序

```lean
def insertSort (xs : List Nat) : List Nat :=
  let rec insert (x : Nat) (ys : List Nat) : List Nat :=
    match ys with
    | [] => [x]
    | y :: ys' => if x ≤ y then x :: y :: ys' else y :: insert x ys'
  match xs with
  | [] => []
  | x :: xs' => insert x (insertSort xs')
```

### 互遞迴：奇偶判斷

```lean
mutual
  def isEven (n : Nat) : Bool :=
    match n with
    | 0 => true
    | n + 1 => isOdd n

  def isOdd (n : Nat) : Bool :=
    match n with
    | 0 => false
    | n + 1 => isEven n
end
```

## 範例

```lean
#eval fib 10
#eval fibTail 10
#eval insertSort [3, 1, 4, 1, 5, 9, 2, 6]
#eval isEven 42
#eval isOdd 42
```

## 教學重點

1. 結構遞迴原則
2. 尾遞迴的執行效率優勢
3. 互遞迴的應用