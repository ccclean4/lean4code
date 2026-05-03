# DataStructures.lean

## 數學原理

### 列表 (List)

列表是常見的抽象資料結構，在數學上相當於有限序列。

Lean 4 的 List 操作包括：
- `map`：映射
- `filter`：過濾
- `foldl`：折疊

### Option 類型

Option 類型對應數學中的「可能失敗的計算」：

$$\text{Option } \alpha \cong \alpha \cup \{ \text{None} \}$$

### Sum 類型（Either）

Sum 類型（又稱 Coproduct 或 Either）：

$$\text{Sum } \alpha \, \beta \cong \alpha + \beta$$

表示「要么是 α，要么是 β」。

## 程式意義

### 列表操作

```lean
def list_examples : List Nat :=
  let nums := [1, 2, 3, 4, 5]
  let doubled := nums.map (· * 2)
  let filtered := nums.filter (· > 2)
  let summed := nums.foldl (· + ·) 0
  nums
```

### 列表推導式

```lean
def list_comprehension : List Nat :=
  Id.run do
    let mut result := []
    for i in [1, 2, 3] do
      for j in [1, 2, 3] do
        result := result ++ [i * j]
    result
```

### Option 類型

```lean
def safeDiv (a b : Nat) : Option Nat :=
  if b == 0 then none else some (a / b)

def findFirst (xs : List Nat) (p : Nat → Bool) : Option Nat :=
  xs.find? p
```

### Sum 類型

```lean
def tryParse : String → Sum String Nat
  | "42" => .inr 42
  | s => .inl s!"無法解析: {s}"
```

### 測試函數

```lean
def main : IO Unit := do
  IO.println s!"列表: {list_examples}"
  IO.println s!"列表推導: {list_comprehension}"
  IO.println s!"safeDiv 10 2 = {safeDiv 10 2}"
  IO.println s!"safeDiv 10 0 = {safeDiv 10 0}"
  IO.println s!"findFirst [1,2,3,4] (· > 2) = {[1,2,3,4].find? (· > 2)}"
  IO.println s!"tryParse \"42\" = {tryParse "42"}"
  IO.println s!"tryParse \"hello\" = {tryParse "hello"}"
```

## 教學重點

1. 代數資料類型（ADT）的表示
2. fold 的普遍性
3. Option 類型如何優雅地處理失敗情況