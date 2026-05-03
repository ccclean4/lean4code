-- Transformations: 幾何變換

inductive Pt where | mk : Float → Float → Pt
inductive Vc where | mk : Float → Float → Vc
inductive Transf where | mk : Float → Float → Float → Float → Float → Float → Transf

#check Pt
#check Transf

example : Pt := Pt.mk 1.0 2.0