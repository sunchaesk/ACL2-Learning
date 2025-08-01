(in-package "ACL2")

;; Tower of Hanoi
;; rules:
;; 1. only one disk may be moved at a time, must start and finish the move as the topmost disk on some peg
;; 2. disk can't be placed on a smaller disk


;; write the ACL2 to write a function to generate the sequence of moves to solve the Tower of Hanoi
(defun move (a b)
  (list 'move a 'to b))

(defun hanoi (a b c n)
  (if (zp n)
    nil
    (if (equal n 1)
      (list (move a c))
      (append (hanoi a c b (1- n))
              (cons (move a c)
                    (hanoi b a c (1- n)))))))

;; some observations:
;; if it takes m moves to transfer n disks, it will take (2m + 1)
;; moves for n + 1 disks

;; to move n disks we need 2^n - 1 moves.
;; summary:
;; 1. moves(n+1) = 2 x moves(n) + 1
;; 2. moves(n) = 2^n - 1 <- we wish to prove this


;; attempt to prove

;; commented out
;(defthm hanoi-moves-required-first-try
;  (equal (len (hanoi a b c n))
;         (1- (expt 2 n))))

;; can see that it's considering < 0 cases for n?
;;(IMPLIES (AND (NOT (ZIP N)) (<= N 0))
;;         (NOT (EQUAL 0 (+ -1 (EXPT 2 (+ 1 N)))))).

;(defthm hanoi-move-required
;  (implies (and (integerp n)
;                (<= 0 n)) ;; n is at least 0
;           (equal (len (hanoi a b c n))
;                  (1- (expt 2 n)))))

;; we see again that this attempt fails:
;; reading the proof tree (look into how to read these better)
;Subgoal *1/3'
;(IMPLIES (AND (NOT (ZP N))
;              (NOT (EQUAL N 1))
;              (EQUAL (LEN (HANOI A C B (+ -1 N)))
;                     (+ -1 (EXPT 2 (+ -1 N))))
;              (EQUAL (LEN (HANOI B A C (+ -1 N)))
;                     (+ -1 (EXPT 2 (+ -1 N)))))
;         (EQUAL (LEN (APPEND (HANOI A C B (+ -1 N))
;                             (CONS (LIST 'MOVE A 'TO C)
;                                   (HANOI B A C (+ -1 N)))))
;                (+ -1 (* 2 (EXPT 2 (+ -1 N))))))

;; we see of the form (LEN (APPEND ... ) and we can conjecture that
;; length of the append of the two lists should be sum of the lengths 
;; of the lists. If prover knew this could have simplified the proof

;; therefore, we need a *rewrite* rule that will suggest a simplication
;; to the prover.

(defthm len-append
  (equal (len (append x y))
         (+ (len x) (len y))))


;; try the proof again -> just copied it over

(defthm hanoi-move-require
  (implies (and (integerp n)
                (<= 0 n)) ;; n is at least 0
           (equal (len (hanoi a b c n))
                  (1- (expt 2 n)))))



;; in our *hanoi-move-require* weird way of stating that n
;; is a natural number. therefore we can define a macro for that

(defmacro naturalp (x)
  (list 'and (list 'integerp x)
        (list '<= 0 x)))



(defthm hanoi-moves-required
  (implies (naturalp n)
           (equal (len (hanoi a b c n))
                  (1- (expt 2 n)))))#|ACL2s-ToDo-Line|#


















