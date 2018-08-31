(defpackage morph.asd
  (:use :cl :asdf))

(defsystem morph
  :version "0.0.1"
  :author "Scott Olsen"
  :license "MIT"
  :components ((:module "src"
                :components i
                  ((:file "base")
                   (:file "semigroup")
                   (:file "monoid")))))
