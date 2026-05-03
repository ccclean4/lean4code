-- Algebra: 向量空間

structure Vec2 where
  x : Float
  y : Float

namespace Vec2

def add (v1 v2 : Vec2) : Vec2 :=
  ⟨ v1.x + v2.x, v1.y + v2.y ⟩

def scale (v : Vec2) (k : Float) : Vec2 :=
  ⟨ k * v.x, k * v.y ⟩

def neg (v : Vec2) : Vec2 :=
  ⟨ -v.x, -v.y ⟩

def zero : Vec2 := ⟨ 0.0, 0.0 ⟩

def dot (v1 v2 : Vec2) : Float :=
  v1.x * v2.x + v1.y * v2.y

def length (v : Vec2) : Float :=
  Float.sqrt (v.x^2 + v.y^2)

end Vec2

#check Vec2
#check Vec2.add
#check Vec2.scale

#eval Vec2.add ⟨1.0, 2.0⟩ ⟨3.0, 4.0⟩
#eval Vec2.scale ⟨1.0, 2.0⟩ 3.0

example : Vec2 := Vec2.add Vec2.zero (Vec2.scale ⟨1.0, 1.0⟩ 2.0)
