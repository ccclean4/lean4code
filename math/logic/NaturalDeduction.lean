-- Logic: 自然演繹

inductive Expr : Type
  | var : String → Expr
  | not : Expr → Expr
  | and : Expr → Expr → Expr
  | or : Expr → Expr → Expr
  | imp : Expr → Expr → Expr

#check Expr

example : Expr := Expr.var "p"