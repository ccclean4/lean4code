# StructuredProofs.lean

## 數學原理

### 結構化證明

結構化證明允許以數學風格撰寫證明，而不是使用傳統的 tactic 腳本。

### 命題邏輯定理

基本的命題邏輯定理：

1. **交換律**
2. **蘊含詞傳遞**
3. **對換句**
4. **迪摩根定律**

## 程式意義

### And 交換律

```lean
theorem andComm (p q : Prop) : p ∧ q → q ∧ p := fun h => And.intro h.right h.left
```

### Or 交換律

```lean
theorem orComm (p q : Prop) : p ∨ q → q ∨ p := fun h => Or.elim h Or.inr Or.inl
```

### 蘊含詞傳遞

```lean
theorem impliesTrans (p q r : Prop) : (p → q) → (q → r) → (p → r) := fun h1 h2 hp => h2 (h1 hp)
```

### 對換句

```lean
theorem contrapositive (p q : Prop) : (p → q) → (¬q → ¬p) := fun h hnq hp => hnq (h hp)
```

### 迪摩根定律

```lean
theorem deMorgan1 (p q : Prop) : ¬(p ∨ q) → ¬p ∧ ¬q := fun h => And.intro (fun hp => h (Or.inl hp)) (fun hq => h (Or.inr hq))
```

## 範例

```lean
#check andComm
#check orComm
#check impliesTrans
#check contrapositive
#check deMorgan1

example : p ∧ q → q ∧ p := andComm p q
example : p ∨ q → q ∨ p := orComm p q
```

## 教學重點

1. 命題邏輯定理的證明
2. 使用函數抽象撰寫證明
3. 結構化證明的風格