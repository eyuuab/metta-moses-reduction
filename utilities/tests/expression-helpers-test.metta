! (register-module! ../../../metta-moses-reduction)
! (import! &self metta-moses-reduction:utilities:expression-helpers)

;; !(checkTreeDepth (AND (OR x1 x2) (AND x3 x4)))

;; !(getChildren (AND (OR x1 x2) (AND x3 x4)) Nil)

;; !(getGuardSet (AND (OR x1 x2) (AND x3 x4)))
 
;; !(nAryOr (Cons False (Cons True (Cons False (Cons True Nil)))))
