-- Modal: 模態邏輯

inductive Modal : Type
  | var : String → Modal
  | not : Modal → Modal
  | and : Modal → Modal → Modal
  | or : Modal → Modal → Modal
  | box : Modal → Modal
  | diamond : Modal → Modal

namespace Modal

def dual : Modal → Modal
  | box φ => diamond (not φ)
  | diamond φ => box (not φ)
  | not φ => not (dual φ)
  | and φ ψ => and (dual φ) (dual ψ)
  | or φ ψ => or (dual φ) (dual ψ)
  | φ => φ

end Modal

#check Modal
#check Modal.dual

example : Modal := Modal.box (Modal.var "p")
example : Modal := Modal.diamond (Modal.var "q")