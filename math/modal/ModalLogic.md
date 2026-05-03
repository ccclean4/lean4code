# ModalLogic.lean

## 數學原理

### 模態邏輯的語法

在命題邏輯基礎上添加兩個模態算子：
- $\square \varphi$：必然 $\varphi$
- $\diamond \varphi$：可能 $\varphi$

對偶關係：
- $\square \varphi \iff \neg \diamond \neg \varphi$
- $\diamond \varphi \iff \neg \square \neg \varphi$

## 程式意義

### 模態邏輯公式

```lean
inductive Modal : Type
  | var : String → Modal
  | not : Modal → Modal
  | and : Modal → Modal → Modal
  | or : Modal → Modal → Modal
  | box : Modal → Modal
  | diamond : Modal → Modal
```

### 對偶函數

```lean
def dual : Modal → Modal
  | box φ => diamond (not φ)
  | diamond φ => box (not φ)
  | not φ => not (dual φ)
  | and φ ψ => and (dual φ) (dual ψ)
  | or φ ψ => or (dual φ) (dual ψ)
  | φ => φ
```

## 範例

```lean
#check Modal
#check Modal.dual

example : Modal := Modal.box (Modal.var "p")
example : Modal := Modal.diamond (Modal.var "q")
```

## 教學重點

1. 模態算子的表示
2. 對偶性的實現
3. 模態邏輯的基本語法