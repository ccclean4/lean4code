# RealAnalysis.lean

## 數學原理

### 連續性

函數 $f$ 在點 $x$ 處連續：

$$\lim_{y \to x} f(y) = f(x)$$

### 數值連續性

使用數值近似判斷連續性。

## 程式意義

### 連續性判斷

```lean
def isContinuous (f : Float → Float) (x : Float) : Bool := Float.abs (f (x + 0.0001) - f (x - 0.0001)) < 0.001
```

使用中央差分近似：若 $|f(x + h) - f(x - h)| < \varepsilon$，則近似連續。

## 範例

```lean
#eval isContinuous (fun x => x * x) 2.0

example : Bool := isContinuous (fun x => x) 0.0
```

## 教學重點

1. 連續性的數值近似
2. 數值方法的應用