# EuclideanGeometry.lean

## 數學原理

### 歐氏平面幾何

歐氏幾何是研究平面上的點、直線、角度等幾何物件的學科。

### 基本元素

- **點**：平面上的位置
- **直線**：無限延伸的直線

## 程式意義

### 點的歸納類型

```lean
inductive Point where | mk : Float → Float → Point
```

### 直線的歸納類型

```lean
inductive Line where | mk : Float → Float → Float → Line
```

直線由三個係數定義：$ax + by + c = 0$。

## 範例

```lean
#check Point
#check Line

example : Point := Point.mk 1.0 2.0
```

## 教學重點

1. 歐氏幾何的基本表示
2. 使用歸納類型建構幾何物件