-- Logic: 命題邏輯

inductive Expr : Type
  | var : String → Expr
  | not : Expr → Expr
  | and : Expr → Expr → Expr
  | or : Expr → Expr → Expr
  | imp : Expr → Expr → Expr

namespace Expr

def eval (v : String → Bool) : Expr → Bool
  | var x => v x
  | not e => Bool.not (eval v e)
  | and e1 e2 => (eval v e1) && (eval v e2)
  | or e1 e2 => (eval v e1) || (eval v e2)
  | imp e1 e2 => Bool.not (eval v e1) || eval v e2

end Expr

#check Expr.var

example : Expr := Expr.and (Expr.var "p") (Expr.var "q")
example : Bool := Expr.eval (fun s => false) (Expr.var "p")