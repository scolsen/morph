(defpackage morph.base
  (:use :cl))

(defun const (x)
  (lambda (y)
    (declare (ignore y))
    x))

(defun flip (f) 
  (lambda (x y) 
    (funcall f y x)))

(defun partial (f &rest args)
  (lambda (&rest args2)
    (apply f (append args args2))))

(defun partiar (f &rest args)
  (partial (flip f) args))

(defun compose (f g)
  (lambda (&rest args)
    (apply g (list (apply f args)))))

(defun foldl (f x xs)
  (if (null xs)
      x
      (foldl f (funcall f x xs) (rest xs))))

(defun foldr (f x xs)
  (if (null xs)
      x
      (funcall f (first xs) (foldr f x (rest xs)))))

(defun zip (f xs ys)
  "Implementation of zip."
  (cond ((null xs) nil)
        ((null ys) nil)
        (t (cons (funcall f (first xs) (first ys)) (zip f (rest xs) (rest ys))))))
