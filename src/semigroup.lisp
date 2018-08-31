;;;; Implementation of Semigroups

(defpackage semigroup
  (:use cl)
  (:export <>))

(defgeneric <> (x y)
            (:documentation "Associative binary operation.")
            (:method ((x number)(y number))
                     (+ x y))
            (:method ((x list)(y list))
                     (append x y))
            (:method ((x string)(y string))
                     (concatenate 'string x y))
            (:method ((f function)(g function))
                     (lambda (&rest args) 
                       (<> (apply f args) (apply g args)))))

