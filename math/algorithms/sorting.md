# sorting.lean

## 數學原理

### 排序的數學定義

對列表 $xs$ 排序得到 $ys$，需滿足：
1. $ys$ 是 $xs$ 的排列（permutation）
2. $ys$ 是遞增的（ordered）

### 插入排序

插入排序的數學描述：

對列表 $xs = [x_1, x_2, \ldots, x_n]$：
$$\text{insertionSort}(xs) = \text{insert}(x_1, \text{insert}(x_2, \ldots \text{insert}(x_n, [])\ldots))$$

其中 `insert` 將元素插入已排序列表的正確位置。

## 程式意義

### 插入排序

```lean
def insertion (xs : List Nat) : List Nat :=
  let rec insert (x : Nat) (ys : List Nat) : List Nat :=
    match ys with
    | [] => [x]
    | y :: rest => if x ≤ y then x :: y :: rest else y :: insert x rest
  xs.foldl (fun ys x => insert x ys) []
```

1. 對每個元素，使用 `foldl` 逐一處理
2. `insert` 函數將元素插入已排序列表的正確位置

## 範例

```lean
#eval insertion [5, 3, 8, 1, 2]

example : List Nat := insertion [3, 1, 4]
```

## 教學重點

1. 排序的兩個條件：排列 + 有序
2. 結構遞迴原則的應用
3. 插入排序的實現