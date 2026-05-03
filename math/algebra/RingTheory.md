# RingTheory.lean

## 數學原理

### 整數的建構

Lean  中的整數 Int' 是基於 Nat 建構的包裝：

```lean
inductive Int' : Type
  | ofNat : Nat → Int'
```

這是整數的一種簡單實現，只表示非負整數。

### 加法的定義

```lean
def add : Int' → Int' → Int'
  | ofNat a, ofNat b => ofNat (a + b)
```

### 乘法的定義

```lean
def mul : Int' → Int' → Int'
  | ofNat a, ofNat b => ofNat (a * b)
```

### 單位元

```lean
def zero : Int' := ofNat 0
def one : Int' := ofNat 1
```

## 程式意義

### 範例

```lean
example : Int' := Int'.one
```

這展示了如何使用 Int' 類型。

## 教學重點

1. 歸納類型的包裝模式
2. 從Nat建構整數
3. 基本運算的遞迴定義