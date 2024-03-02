(defpackage rps
  (:use :cl))
(in-package :rps)

(defun get-player-choice (o)
  (format t "Please enter either -> ~{\"~A\"~^, ~}: " options)
  (force-output)
  (if (member (string-downcase (read-line)) options)
      (format t "It exists!~%")
      (format t "It doesn't exist!~%"))
  (first options))

(defun game ()
  (let* ((options '("rock" "paper" "scissors"))
         (cpu-choice (nth (random (length options) (make-random-state t)) options))
         (player-choice (get-player-choice options)))
    (format nil "Player: ~a, CPU: ~a~%" player-choice cpu-choice)))
