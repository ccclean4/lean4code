-- Logic: 謂詞邏輯

inductive Term : Type
  | var : String → Term
  | const : String → Term

inductive Formula : Type
  | eq : Term → Term → Formula
  | rel : String → List Term → Formula
  | not : Formula → Formula
  | and : Formula → Formula → Formula
  | or : Formula → Formula → Formula
  | all : String → Formula → Formula
  | ex : String → Formula → Formula
  | false : Formula

namespace Formula

def freeVars : Formula → List String
  | eq _ _ => []
  | rel _ args => []
  | not f => freeVars f
  | and f1 f2 => freeVars f1 ++ freeVars f2
  | or f1 f2 => freeVars f1 ++ freeVars f2
  | all x f => freeVars f |>.filter (x != ·)
  | ex x f => freeVars f |>.filter (x != ·)
  | false => []

end Formula

#check Formula.all "x" (Formula.rel "P" [Term.var "x"])
#eval Formula.freeVars (Formula.all "x" (Formula.rel "P" [Term.var "x"]))