(defun partial (f &rest args)
  (lambda (&rest args2)
    (apply f (append args args2))))

(defun compose (f g)
  (lambda (&rest args)
    (apply g (list (apply f args)))))

(defun beta (f &rest args)
  (apply f args))

(defun foldr (f init seq)
  "Reduce, only initial value is positional.
   This makes for easier passing around in HOFs."
  (reduce f seq :initial-value init))

(defun foldl (f x xs)
  (if (null xs)
      x
      (foldl f (beta f x xs) (rest xs))))

(defun foldr (f x xs)
  (if (null xs)
      x
      (beta f (first xs) (foldr f x (rest xs)))))

(defun foldt ()
  ())

(defun pairs (f xs)
  (let ((id (mempty (first xs))))
    (labels ((_pairs (f xs i) 
                     (if (null xs)
                         i
                         (beta f (first xs) (first (rest xs)) 
                                 (_pairs f (rest (rest xs)) id)))))
      (_pairs f xs id))
    ))

(defun zip (f xs ys)
  "Implementation of zip."
  ())
