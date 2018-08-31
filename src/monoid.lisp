(defpackage monoid
  (:use cl))

;;; There's no especially elegant way to assert semigroup
;;; So we simply redefine it on Monoid.

(defgeneric mempty (x)
            (:method ((x number))0)
            (:method ((x list) nil))
            (:method ((x string)) ""))

(defgeneric mappend (x y)
            (:method ((x)(y))
                     (<> x y)))

(defgeneric <> (x y)
            (:method ((x number)(y number))
                     (+ x y))
            (:method ((x list)(y list))
                     (append x y))
            (:method ((x string)(y string))
                     (concatenate 'string x y)))

(defgeneric mconcat (x)
            (:method (x list)
                     (foldr #'<> x)))

(setf mconcat (partial #'foldr #'<> (apply #'mempty)))
