# HigherOrder.lean

## 數學原理

### 函數作為一級公民

在數學中，函數是集合之間的映射。在 Lean 4 中，函數也是值。

### 高階函數

高階函數以其他函數為輸入或輸出：
- `map : (α → β) → (List α → List β)`
- `filter : (α → Bool) → (List α → List α)`
- `fold : (β → α → β) → β → List α → β`

### Kleisli 合成

`compose (f : β → γ) (g : α → β) (x : α) : γ` 等同於數學中的函數合成：

$$(f \circ g)(x) = f(g(x))$$

### Currying

Currying 將多元函數轉換為一系列單參數函數：

$$\alpha \times \beta \to \gamma \cong \alpha \to (\beta \to \gamma)$$

## 程式意義

### 基本函數

```lean
def double := fun x : Nat => x * 2

def isEven (n : Nat) : Bool := n % 2 == 0

def isOdd (n : Nat) : Bool := n % 2 == 1
```

### fold（折疊）

```lean
def sum (xs : List Nat) : Nat := xs.foldl (· + ·) 0

def product (xs : List Nat) : Nat := xs.foldl (· * ·) 1
```

### zipWith

```lean
def zipWith {α β γ : Type} (f : α → β → γ) (xs : List α) (ys : List β) : List γ :=
  match xs, ys with
  | [], _ => []
  | _, [] => []
  | x :: xs', y :: ys' => f x y :: zipWith f xs' ys'
```

### unzip

```lean
def unzip {α β : Type} (xys : List (α × β)) : List α × List β :=
  xys.foldr (fun (x, y) (xs, ys) => (x :: xs, y :: ys)) ([], [])
```

### compose

```lean
def compose (f : β → γ) (g : α → β) (x : α) : γ := f (g x)
```

### curry / uncurry

```lean
def curry (f : α × β → γ) (a : α) (b : β) : γ := f (a, b)

def uncurry (f : α → β → γ) (ab : α × β) : γ := f ab.1 ab.2
```

## 範例

```lean
#eval [1, 2, 3, 4, 5].map double
#eval [1, 2, 3, 4, 5].filter isEven
#eval sum [1, 2, 3, 4, 5]
#eval product [1, 2, 3, 4, 5]
#eval zipWith (· + ·) [1, 2, 3] [10, 20, 30]
#eval unzip [(1, 'a'), (2, 'b'), (3, 'c')]
```

## 教學重點

1. 函數式思維：資料變換而非狀態修改
2. `·` 語法（anonymous function syntax）
3. fold 的普遍性