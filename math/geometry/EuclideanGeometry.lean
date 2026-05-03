-- Geometry: 歐氏幾何

inductive Point where | mk : Float → Float → Point

inductive Line where | mk : Float → Float → Float → Line

#check Point
#check Line

example : Point := Point.mk 1.0 2.0