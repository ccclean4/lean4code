# GroupTheory.lean

## 數學原理

### 皮亞諾算術系統

Lean 中的自然數 MyNat 是皮亞諾公理的實現：

```lean
inductive MyNat : Type
  | zero : MyNat
  | succ : MyNat → MyNat
```

### 加法的定義

$$a + 0 = a$$
$$a + S(b) = S(a + b)$$

```lean
def add : MyNat → MyNat → MyNat
  | a, zero => a
  | a, succ b => succ (add a b)
```

### 乘法的定義

$$a \times 0 = 0$$
$$a \times S(b) = a \times b + a$$

```lean
def mul : MyNat → MyNat → MyNat
  | _, zero => zero
  | a, succ b => add (mul a b) a
```

## 程式意義

### 皮亞諾算術定理

```lean
theorem addZero (n : MyNat) : add n zero = n := rfl
theorem addSucc (n m : MyNat) : add n (succ m) = succ (add n m) := rfl
theorem mulZero (n : MyNat) : mul n zero = zero := rfl
theorem mulSucc (n m : MyNat) : mul n (succ m) = add (mul n m) n := rfl
```

### 範例

```lean
example : MyNat := MyNat.add MyNat.zero (MyNat.succ MyNat.zero)
```

## 教學重點

1. 自然數的歸納定義
2. 運算的遞迴定義
3. 皮亞諾公理的機械化
4. 基本算術定理的證明