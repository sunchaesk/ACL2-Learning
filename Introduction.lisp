(in-package "ACL2")#|ACL2s-ToDo-Line|#


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; INTRODUCTION-TO-THE-THEOREM-PROVER
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; method of working with ACL2
;; 1. present ACL2 with a goal to prove
;; 2. typically it fails to prove, but prints Key Checkpoints
;; 3. look at Key Checkpoints and decide what facts will help the prover
;; 4. formalize the problem domain knowledge with formulas (rules)


;;;;;;;;;;;;;;;;; INTRODUCTION-TO-REWRITE-RULES-PART-1


;;;;;;;;;;;;;;;;;; INTRODUCTION-TO-KEY-CHECKPOINTS

;; there are two kinds of key checkpoints:
;; 1. key checkpoints before an induction
;; 2. key checkpoints under a top level induction 

;; initially, it is recommended to pick one key checkpoint before
;; an induction and ask the following questions:
;; (1) do you believe this is a theorem? if not then no point trying to prove it
;; (2) can it be simplified? 
;; ---- if there is a simpler statement of the same statement, 
;; ---- prove that auxiliary theorem (equal or iff)
;; ---- equal is when they the structures of LHS and RHS are same
;; ---- iff is when they are equivalent logical statements
;; ---- NOTE: read up on this
;; (3) is the simpler fact already in the database? if yes,
;; there are 4 main reasons why this might happen:
;; (3a) it is diabled -- enable it
;; (3b) LHS doesn't match the target, generalize that rule or 
;; prove a new rule for this situation. Use *undo* to remove old
;; (3c) it is IFF and target doesn't occur propositionally
;; strengthen to equal 
;; (3d) rule hypothesis might be too strong or curren conjecture 
;; too weak (:brr ?)
;; (4) If the simpler fact is not already known, prove it
;; (5) is this formula something you need indcution to prove?
;; note that induction requires you to have a general statement
;; just because ACL2 found an induction doesn't mean the 
;; statement is ripe for you to use an inductino
;; (6) if the formula is right for induction, did ACL2 do an induction for it?
;; (7) If ACL2 did an induction, was it the right one?


;; some other notes:
;; - Start over proving your main conjecture: sometimes regenerate
;; the proof tree after adding new rules etc
;; - key checkpoints too complicated? -> some rules might be turned off


;;; *** Generalizing Key Checkpoints

;;; *** Post Induction Key Checkpoints
;; - each post indcution key checkpoint is a theorem iff the 
;; original conjecture was a theorem. 

;; if all post-induction conjectures are theorems, ask whether
;; each has the hypothesis you'd need to prove it. 


;;;;;;;;;;;;;;;;;; INTRODUCTION-TO-REWRITE-RULES-PART-2

;; rewrite rules should be designed to drive terms into some normal
;; form so that different equivalent terms are rewritten into a 
;; preferred shape

;; notion of heaviness: if a function A is defined in terms of func. B
;; then we say that function A is "heavier" than function B


;; General Principles for phrasing theorems to make a good rule:
;; 1. Strengthen the formula: fewer hypothesis, fewer free variables
;; 2. Choosing the conclusion: -> choose a LHS and RHS (yoou could negate both sides getting a different conclusion
;; -- a: put *heavy* term on LHS so simplifies more
;; -- b: conclusion includes all variables in the hypothesis
;; 3. Orienting the conclusion: LHS should match some terms in the key checkpoint
;; 4. Pay attention to free variables: free variable is a variable that is in the hyp. that is not in the pattern



































