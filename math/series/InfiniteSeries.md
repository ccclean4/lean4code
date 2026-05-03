# InfiniteSeries.lean

## 數學原理

### 無限級數

序列 $(a_n)$ 的無窮級數：

$$\sum_{n=0}^{\infty} a_n = \lim_{N \to \infty} \sum_{n=0}^{N} a_n$$

### 收斂性

級數的收斂性判斷是數學分析的重要課題。

## 程式意義

### 幾何級數（未實現）

```lean
def geom (r : Float) (n : Nat) : Float := n.toFloat
```

### 收斂判斷（未實現）

```lean
def conv (a : Nat → Float) : Bool := true
```

### 絕對收斂

```lean
def absConv (a : Nat → Float) : Bool := conv a
```

注意：這些函數目前是 stub 实现。

## 範例

```lean
#eval geom 0.5 10
#eval conv (fun n => 1.0)

example : Float := geom 0.5 10
```

## 教學重點

1. 級數收斂的基本概念
2. 極限的計算