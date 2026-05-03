# Graph.lean

## 數學原理

### 圖的定義

圖 $G = (V, E)$ 由頂點集 $V$ 和邊集 $E \subseteq V \times V$ 組成。

### 圖的表示

使用歸納類型表示圖：
- 空圖
- 添加頂點
- 添加邊

## 程式意義

### 圖的歸納類型

```lean
inductive Graphα (α : Type) where
  | empty : Graphα α
  | addV : α → Graphα α → Graphα α
  | addE : α × α → Graphα α → Graphα α
```

### 獲取頂點列表

```lean
def vertices {α} : Graphα α → List α
  | empty => []
  | addV v g => v :: vertices g
  | addE _ g => vertices g
```

### 獲取邊列表

```lean
def edges {α} : Graphα α → List (α × α)
  | empty => []
  | addV _ g => edges g
  | addE e g => e :: edges g
```

## 範例

```lean
#check Graphα

example : Graphα Nat := Graphα.addE (1, 2) (Graphα.addV 2 (Graphα.addV 1 Graphα.empty))
```

## 教學重點

1. 圖的函數式表示
2. 歸納類型建構圖結構
3. 遞迴存取頂點和邊