(in-package "ACL2")

(defthm subsetp-cdr
  (implies (subsetp a (cdr b))
           (subsetp a b)))

(defthm subsetp-reflexive
  (subsetp x x))#|ACL2s-ToDo-Line|#
