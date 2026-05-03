# CategoryTheory.lean

## 數學原理

### 範疇的定義

範疇 $\mathcal{C}$ 由以下組成：
- **對象**（Objects）：$\text{Ob}(\mathcal{C})$
- **態射**（Morphisms）：$f : A \to B$
- **複合**：$g \circ f$
- **單位態射**：$\text{id}_A$

滿足：
1. **結合律**：$(f \circ g) \circ h = f \circ (g \circ h)$
2. **單位律**：$\text{id} \circ f = f = f \circ \text{id}$

## 程式意義

### 範疇類別

```lean
class Cat (obj : Type u) where
  hom : obj → obj → Type v
  id : ∀ (a : obj), hom a a
```

- `obj`：對象的類型
- `hom`：態射的類型建構器
- `id`：單位態射

## 範例

```lean
#check Cat

example (α : Type) : Cat α where
  hom := fun _ _ => Unit
  id := fun _ => Unit.unit
```

## 教學重點

1. 範疇的類別定義
2. 態射的表示
3. 單位態射的實現