#|
  This file is a part of jscl project.
|#

(in-package :cl-user)
(defpackage jscl-asd
  (:use :cl :asdf))
(in-package :jscl-asd)

(defsystem jscl
  :version "0.5.1"
  :author "js-project"
  :license "GPL-3.0"
  :components ((:module "src"
                :components
                ((:file "array")
                 (:file "backquote")
                 (:file "boot")
                 (:file "char")
                 (:file "compat")
                 (:file "conditions")
                 (:file "defstruct")
                 (:file "documentation")
                 (:file "ffi")
                 (:file "hash-table")
                 (:file "lambda-list")
                 (:file "list")
                 (:file "misc")
                 (:file "numbers")
                 (:file "package")
                 (:file "prelu")
                 (:file "print")
                 (:file "read")
                 (:file "sequence")
                 (:file "setf")
                 (:file "stream")
                 (:file "string")
                 (:file "symbol")
                 (:file "toplevel")
                 (:file "utils"))
               (:module "repl-node"
                :components
                ((:file "repl")))
               (:module "repl-web"
                :components
                ((:file "repl")))
               (:file "jscl"))
  :description "A Common Lisp implementation for Javascript"
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.md"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq))))
