# SequentCalculus.lean

## 數學原理

### Sequent 的定義

 sequent 形式為 $\Gamma \vdash \Delta$，讀作「由 $\Gamma$ 推出 $\Delta$」。

### Sequent 演算

Sequent 演算是另一種證明系統，與自然演繹不同。

## 程式意義

### 命題表達式

```lean
inductive Expr : Type
  | var : String → Expr
  | not : Expr → Expr
  | and : Expr → Expr → Expr
  | or : Expr → Expr → Expr
```

### Sequent 規則

```lean
inductive SeqRule where | init | andL | andR | orL | orR
```

### Sequent 結構

```lean
structure Sequent where
  ant : List Expr
  suc : Expr
```

## 範例

```lean
#check Sequent

example : Sequent := ⟨ [Expr.var "p"], Expr.var "p" ⟩
```

## 教學重點

1. Sequent 演算的基本結構
2. 邏輯規則的表示