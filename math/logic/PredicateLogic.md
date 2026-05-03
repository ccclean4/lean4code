# PredicateLogic.lean

## 數學原理

### 一階謂詞邏輯的語法

項（Term）：

```lean
inductive Term : Type
  | var : String → Term
  | const : String → Term
```

公式（Formula）：

```lean
inductive Formula : Type
  | eq : Term → Term → Formula
  | rel : String → List Term → Formula
  | not : Formula → Formula
  | and : Formula → Formula → Formula
  | or : Formula → Formula → Formula
  | all : String → Formula → Formula
  | ex : String → Formula → Formula
  | false : Formula
```

### 自由變數

- **自由變數**：不在任何量詞作用域內的變元
- **約束變數**：被量詞綁定的變元

## 程式意義

### 自由變數計算

```lean
def freeVars : Formula → List String
  | eq _ _ => []
  | rel _ args => []
  | not f => freeVars f
  | and f1 f2 => freeVars f1 ++ freeVars f2
  | or f1 f2 => freeVars f1 ++ freeVars f2
  | all x f => freeVars f |>.filter (x != ·)
  | ex x f => freeVars f |>.filter (x != ·)
  | false => []
```

量詞約束的變數從自由變數集合中移除。

## 範例

```lean
#check Formula.all "x" (Formula.rel "P" [Term.var "x"])
#eval Formula.freeVars (Formula.all "x" (Formula.rel "P" [Term.var "x"]))
```

## 教學重點

1. 一階邏輯的語法層次（Term 和 Formula）
2. 自由變數與約束變數的區別
3. 量詞的作用範圍