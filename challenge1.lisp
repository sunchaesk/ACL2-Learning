(in-package "ACL2")

(defun rev (x)
  (if (endp x)
    nil
    (append (rev (cdr x)) (list (car x)))))

(defthm rev-rev
  (implies (true-listp x)
           (equal (rev (rev x)) x)))

(defthm triple-rev
  (equal
   (rev (rev (rev x)))
   (rev x)))#|ACL2s-ToDo-Line|#
