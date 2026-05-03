# TacticBasics.lean

## 數學原理

### 策略（tactic）的意義

Tactic 是 Lean 4 證明引擎的核心概念，但本檔案使用函數式風格撰寫證明。

每個定理代表一個推理步驟，等價於自然演繹系統中的一條規則。

## 程式意義

### 基本定理

```lean
theorem ex1 (p : Prop) : p → p := fun hp => hp
```

恆等函數，對應假言推理。

```lean
theorem ex2 (p q : Prop) : p ∧ q → p := fun h => h.left
```

從合取提取左分量。

```lean
theorem ex3 (p q : Prop) : p → p ∨ q := fun hp => Or.inl hp
```

從左側引入析取。

```lean
theorem ex4 (p q r : Prop) : (p → q) → (q → r) → (p → r) := fun h1 h2 hp => h2 (h1 hp)
```

蘊含詞的傳遞性。

```lean
theorem ex5 (p q : Prop) : p ∧ q → q ∧ p := fun h => And.intro h.right h.left
```

合取的交換律。

## 範例

```lean
#check ex1
#check ex2
#check ex3
#check ex4
#check ex5

example (p : Prop) : p → p := ex1 p
```

## 教學重點

1. 定理作為函數
2. 命題邏輯的基本推理規則