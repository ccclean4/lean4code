-- Geometry: 點與線

inductive P2 where | mk : Float → Float → P2
inductive L2 where | mk : Float → Float → L2

#check P2
#check L2

example : P2 := P2.mk 1.0 2.0