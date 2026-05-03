-- Logic: Sequent

inductive Expr : Type
  | var : String → Expr
  | not : Expr → Expr
  | and : Expr → Expr → Expr
  | or : Expr → Expr → Expr

inductive SeqRule where | init | andL | andR | orL | orR

structure Sequent where
  ant : List Expr
  suc : Expr

#check Sequent

example : Sequent := ⟨ [Expr.var "p"], Expr.var "p" ⟩