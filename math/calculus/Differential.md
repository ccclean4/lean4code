# Differential.lean

## 數學原理

### 導數的數值近似

函數 $f$ 在點 $x$ 處的導數定義：

$$f'(x) = \lim_{h \to 0} \frac{f(x+h) - f(x)}{h}$$

### 前向差分

$$f'(x) \approx \frac{f(x + 0.001) - f(x)}{0.001}$$

### 二階導數

$$f''(x) \approx \frac{f(x + 0.001) - 2f(x) + f(x - 0.001)}{0.001^2}$$

## 程式意義

### 導數定義

```lean
def deriv (f : Float → Float) (x : Float) : Float :=
  (f (x + 0.001) - f x) / 0.001
```

### 二階導數

```lean
def secondDeriv (f : Float → Float) (x : Float) : Float :=
  (f (x + 0.001) - 2 * f x + f (x - 0.001)) / 0.000001
```

### 導數的別名

```lean
def d_dx (f : Float → Float) (x : Float) : Float := deriv f x
```

## 範例

```lean
#eval deriv (fun x => x * x) 2.0
#eval secondDeriv (fun x => x * x * x) 1.0
#eval d_dx (fun x => Float.sin x) 0.0
#eval d_dx (fun x => Float.exp x) 1.0

example : Float := deriv (fun x => x * x * x) 1.0
```

## 教學重點

1. 導數的數值近似方法
2. 前向差分與中央差分
3. 數值微分的實現