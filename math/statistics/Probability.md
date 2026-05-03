# Probability.lean

## 數學原理

### 期望值

對於離散隨機變數，期望值定義為：

$$E[X] = \sum_i p_i \cdot x_i$$

其中 $p_i$ 是權重（機率），$x_i$ 是值。

### 加權平均

給定分布權重和對應值，計算加權平均：

$$E[f(X)] = \sum_i \frac{w_i}{\sum w_j} \cdot f(x_i)$$

## 程式意義

### 期望值函數

```lean
def expectation (f : Float → Float) (dist : List Float) : Float :=
  let w := dist.map (· / dist.sum)
  (w.zip dist).foldl (fun a (wi, xi) => a + wi * f xi) 0.0
```

1. 將分布轉換為機率權重
2. 計算加權平均

## 範例

```lean
#eval expectation id [0.1, 0.2, 0.3, 0.4]

example : Float := expectation (fun x => x) [0.5, 0.5]
```

## 教學重點

1. 期望值的數值計算
2. 加權平均的實現