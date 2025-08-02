(in-package "ACL2")

;; phone book

;;we model the electronic phone book as follows:
;; 1. phone book stores the numbers of a city
;; 2. must be posssible to retrieve a phone number given a name
;; 3. must be possible to add and delete entries

(include-book "data-structures/alist-defthms" :dir :system)#|ACL2s-ToDo-Line|#
 ;; import theorems

;; you can look up function definitions with *:pe*

;;
