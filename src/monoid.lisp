(defpackage morph.monoid
  (:use :cl :morph.semigroup)
  (:export :mempty
           :mappend
           :mconcat))

(in-package :morph.monoid)

(defgeneric mempty (x)
            (:method ((x number))0)
            (:method ((x list) nil))
            (:method ((x string)) ""))

(defgeneric mappend (x y)
            (:method ((x)(y))
                     (<> x y)))

(defgeneric mconcat (x)
            (:method (x list)
                     (foldr #'<> x)))
