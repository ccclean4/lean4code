# PropositionalLogic.lean

## 數學原理

### 命題邏輯的語法

命題邏輯的 BNF 語法：

$$\varphi ::= p \mid \neg\varphi \mid \varphi \land \varphi \mid \varphi \lor \varphi \mid \varphi \to \varphi$$

其中 $p$ 是命題變元。

### 語義（布爾賦值）

| 建構子 | 語義 |
|--------|------|
| `var x` | 賦值 $v(x)$ |
| `not e` | $\neg \text{eval}(e)$ |
| `and e1 e2` | $\text{eval}(e_1) \land \text{eval}(e_2)$ |
| `or e1 e2` | $\text{eval}(e_1) \lor \text{eval}(e_2)$ |
| `imp e1 e2` | $\neg \text{eval}(e_1) \lor \text{eval}(e_2)$ |

### 重要概念

| 概念 | 定義 |
|------|------|
| 可滿足（sat） | 存在賦值使公式為真 |
| 重言式（valid） | 所有賦值都使公式為真 |
| 矛盾式（unsat） | 沒有賦值使公式為真 |

## 程式意義

### Expr 歸納類型

```lean
inductive Expr : Type
  | var : String → Expr
  | not : Expr → Expr
  | and : Expr → Expr → Expr
  | or : Expr → Expr → Expr
  | imp : Expr → Expr → Expr
```

這是命題邏輯公式的抽象語法樹（AST）。

### 語義評估

```lean
def eval (v : String → Bool) : Expr → Bool
  | var x => v x
  | not e => Bool.not (eval v e)
  | and e1 e2 => (eval v e1) && (eval v e2)
  | or e1 e2 => (eval v e1) || (eval v e2)
  | imp e1 e2 => Bool.not (eval v e1) || eval v e2
```

賦值是從命題變元到布爾值的函數。

### 範例

```lean
example : Expr := Expr.and (Expr.var "p") (Expr.var "q")
example : Bool := Expr.eval (fun s => false) (Expr.var "p")
```

## 教學重點

1. 命題邏輯的形式語法（歸納類型）
2. 布爾賦值與語義
3. 蘊含詞的語義：$\varphi \to \psi$ 為假當且僅當 $\varphi$ 為真且 $\psi$ 為假
4. 遞迴評估演算法