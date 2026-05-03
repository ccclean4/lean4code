# VectorSpace.lean

## 數學原理

### 2D 向量空間

二維向量空間 $Vec2$ 是基本的歐氏平面向量：

$$v = (x, y) \in \mathbb{R}^2$$

### 向量加法

$$v_1 + v_2 = (x_1 + x_2, y_1 + y_2)$$

### 純量乘法

$$k \cdot v = (k \cdot x, k \cdot y)$$

### 點積

$$v_1 \cdot v_2 = x_1 x_2 + y_1 y_2$$

### 向量長度

$$|v| = \sqrt{x^2 + y^2}$$

## 程式意義

### Vec2 結構

```lean
structure Vec2 where
  x : Float
  y : Float
```

### 向量加法

```lean
def add (v1 v2 : Vec2) : Vec2 :=
  ⟨ v1.x + v2.x, v1.y + v2.y ⟩
```

### 純量乘法

```lean
def scale (v : Vec2) (k : Float) : Vec2 :=
  ⟨ k * v.x, k * v.y ⟩
```

### 向量取反

```lean
def neg (v : Vec2) : Vec2 :=
  ⟨ -v.x, -v.y ⟩
```

### 零向量

```lean
def zero : Vec2 := ⟨ 0.0, 0.0 ⟩
```

### 點積

```lean
def dot (v1 v2 : Vec2) : Float :=
  v1.x * v2.x + v1.y * v2.y
```

### 向量長度

```lean
def length (v : Vec2) : Float :=
  Float.sqrt (v.x^2 + v.y^2)
```

## 範例

```lean
#eval Vec2.add ⟨1.0, 2.0⟩ ⟨3.0, 4.0⟩
#eval Vec2.scale ⟨1.0, 2.0⟩ 3.0

example : Vec2 := Vec2.add Vec2.zero (Vec2.scale ⟨1.0, 1.0⟩ 2.0)
```

## 教學重點

1. 結構（structure）的定義
2. 基本的向量運算
3. 歐氏空間的計算