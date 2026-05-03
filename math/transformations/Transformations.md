# Transformations.lean

## 數學原理

### 平面幾何變換

平面變換是 $\mathbb{R}^2$ 到自身的映射。

### 基本幾何元素

- **點**：平面上的位置 $(x, y)$
- **向量**：有方向和大小的量
- **變換**：從平面到平面的映射

## 程式意義

### 點的歸納類型

```lean
inductive Pt where | mk : Float → Float → Pt
```

### 向量的歸納類型

```lean
inductive Vc where | mk : Float → Float → Vc
```

### 變換的歸納類型

```lean
inductive Transf where | mk : Float → Float → Float → Float → Float → Float → Transf
```

變換由 6 個參數定義：$a, b, c, d, e, f$，表示仿射變換 $T(x, y) = (ax + by + e, cx + dy + f)$。

## 範例

```lean
#check Pt
#check Transf

example : Pt := Pt.mk 1.0 2.0
```

## 教學重點

1. 平面幾何的基本表示
2. 使用歸納類型建構幾何變換