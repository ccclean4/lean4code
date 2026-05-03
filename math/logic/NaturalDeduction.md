# NaturalDeduction.lean

## 數學原理

### 自然演繹系統

自然演繹是一種從前提推出結論的證明系統，使用推論規則。

### 命題邏輯的建構子

```lean
inductive Expr : Type
  | var : String → Expr
  | not : Expr → Expr
  | and : Expr → Expr → Expr
  | or : Expr → Expr → Expr
  | imp : Expr → Expr → Expr
```

這是命題邏輯公式的抽象語法樹（AST）。

## 程式意義

### 範例

```lean
example : Expr := Expr.var "p"
```

## 教學重點

1. 命題邏輯的歸納類型
2. 基本邏輯連接詞
3. 形式化邏輯系統的建構