# Statistics.lean

## 數學原理

### 均值

對列表 $xs = [x_1, x_2, \ldots, x_n]$，均值定義為：

$$\bar{x} = \frac{1}{n}\sum_{i=1}^n x_i$$

### 方差

$$\sigma^2 = \frac{1}{n}\sum_{i=1}^n (x_i - \bar{x})^2$$

### 標準差

$$\sigma = \sqrt{\sigma^2}$$

## 程式意義

### 均值

```lean
def mean (xs : List Float) : Float := xs.sum / xs.length.toFloat
```

### 方差

```lean
def variance (xs : List Float) : Float := let m := mean xs; xs.foldl (fun acc x => acc + (x - m)^2) 0.0 / xs.length.toFloat
```

### 標準差

```lean
def stdDev (xs : List Float) : Float := Float.sqrt (variance xs)
```

### 排序（未實現）

```lean
def sort (xs : List Float) : List Float := Id.run do
  let rec swap (ys : List Float) (i j : Nat) : List Float := ys
  xs
```

### 中位數（未實現）

```lean
def median (xs : List Float) : Float := 0.0
```

## 範例

```lean
#eval mean [1.0, 2.0, 3.0, 4.0, 5.0]
#eval variance [1.0, 2.0, 3.0, 4.0, 5.0]
#eval stdDev [1.0, 2.0, 3.0, 4.0, 5.0]

example : Float := mean [1.0, 2.0, 3.0]
```

## 教學重點

1. 基本統計量的計算
2. 方差與標準差的關係