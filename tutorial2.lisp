(in-package "ACL2")

;; eights problem

;; we wish to prove the following:
;; for all n > 7, exists natural numbers i j s.t. n = 3i + 5j

;; we will start with a constructive approach
;; assume a function split(n) -> (i j) then we would have the following
;; theorem:

#|
  (defthm split-splits
    (let ((i (car (split n)))
          (j (cdr (split n))))
      (implies (and (integerp n)
                    (< 7 n))
               (and (integerp i)
                    (<= 0 i)
                    (integerp j)
                    (<= 0 j)
                    (equal (+ (* 3 i) (* 5 j)) 
                           n)))))

|#

  (defun bump-i (x)
    ;; Bump the i component of the pair
    ;; (i . j) by 1.
    (cons (1+ (car x)) (cdr x)))



  (defun split (n)
    ;; Find a pair (i . j) such that 
    ;; n = 3i + 5j.
    (if (or (zp n) (< n 8))
        nil ;; any value is really reasonable here
      (if (equal n 8)
          (cons 1 1)
        (if (equal n 9)
            (cons 3 0)
          (if (equal n 10)
              (cons 0 2)
            (bump-i (split (- n 3))))))))
  
  
;; for completeness, we note that we can prove a quantified version
;; of this theorem
  
  

  (defun-sk split-able (n)
    (exists (i j)
            (equal n (+ (* 3 i) (* 5 j)))))#|ACL2s-ToDo-Line|#

  
  
    (defthm split-splits2 
    (implies (and (integerp n)
                  (< 7 n))
             (split-able n))
    :hints (("Goal" :use (:instance split-able-suff 
                                    (i (car (split n)))
                                    (j (cdr (split n)))))))
    
    
   ;; have to return to tutorial 4 for understanding defun-sk
  