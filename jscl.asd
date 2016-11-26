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
  :components ((:file "jscl"))
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
