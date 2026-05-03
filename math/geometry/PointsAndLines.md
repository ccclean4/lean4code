# PointsAndLines.lean

## 數學原理

### 平面點

平面上的點 $(x, y)$ 是二維歐氏空間 $\mathbb{R}^2$ 的元素：

$$P = (x, y) \in \mathbb{R}^2$$

### 平面直線

歐氏平面上的直線可以用不同的方式表示。

## 程式意義

### 點的歸納類型

```lean
inductive P2 where | mk : Float → Float → P2
```

### 直線的歸納類型

```lean
inductive L2 where | mk : Float → Float → L2
```

## 範例

```lean
#check P2
#check L2

example : P2 := P2.mk 1.0 2.0
```

## 教學重點

1. 歸納類型表示幾何物件
2. 基礎的點與線定義