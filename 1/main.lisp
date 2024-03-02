(defpackage coin-toss
  (:use :cl))
(in-package :coin-toss)

(defun toss-coin ()
  "Generates a random 'heads' or 'tails'."
  (let ((number (random 2 (make-random-state t))))
    (if (= number 0)
        "heads"
        "tails")))

(defun prompt ()
  "Gets user input, loops if it's not 'heads' or 'tails'."
  (format t "Please enter heads or tails: ")
  (force-output)
  (let ((guess (string-downcase (read-line))))
    (if (or (string= guess "heads")
            (string= guess "tails"))
        guess
        (prompt))))

(defun game ()
  "Runs the actual game."
  (if (string= (prompt)
               (toss-coin))
      (format t "You win!~%")
      (format t "You lose!~%")))
