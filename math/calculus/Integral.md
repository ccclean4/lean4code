# Integral.lean

## 數學原理

### 黎曼積分

函數 $f$ 在 $[a,b]$ 上的定積分定義：

$$\int_a^b f(x)\,dx = \lim_{n \to \infty} \sum_{i=1}^n f\left(a + \frac{i}{n}(b-a)\right) \frac{b-a}{n}$$

### 黎曼和

將區間 $[a,b]$ 分成 $n$ 個子區間，用矩形近似面積。

### 梯形法

用梯形代替矩形，提高近似精度：

$$\int_a^b f(x)\,dx \approx \sum_{i=0}^{n-1} \frac{f(x_i) + f(x_{i+1})}{2} \Delta x$$

## 程式意義

### 黎曼和

```lean
def riemannSum (f : Float → Float) (a b : Float) (n : Nat) : Float :=
  let dx := (b - a) / n.toFloat
  let rec sum (i : Nat) (acc : Float) : Float :=
    if i >= n then acc
    else sum (i + 1) (acc + f (a + dx * i.toFloat) * dx)
  sum 0 0.0
```

### 梯形法

```lean
def trapezoid (f : Float → Float) (a b : Float) (n : Nat) : Float :=
  let dx := (b - a) / n.toFloat
  let rec go (i : Nat) (acc : Float) : Float :=
    if i >= n then acc
    else
      let x := a + dx * i.toFloat
      let xNext := a + dx * (i + 1).toFloat
      go (i + 1) (acc + (f x + f xNext) / 2.0 * dx)
  go 0 0.0
```

### 積分函數

```lean
def integrate (f : Float → Float) (a b : Float) : Float := trapezoid f a b 100
```

## 範例

```lean
#eval riemannSum (fun x => x * x) 0.0 1.0 100
#eval trapezoid (fun x => x * x) 0.0 1.0 100
#eval integrate (fun x => x * x) 0.0 1.0

example : Float := riemannSum (fun x => x) 0.0 1.0 10
```

## 教學重點

1. 黎曼積分的數值近似
2. 梯形法 vs 矩形法
3. 數值積分的實現