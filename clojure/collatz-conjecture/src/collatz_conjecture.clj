(ns collatz-conjecture)

(defn collatz
  [num]
  (loop [n num
         step 0]
    (cond
      (>= 0 n) (throw (AssertionError. "Provided number is equal or lower than zero."))
      (= 1 n) step
      (even? n) (recur (/ n 2) (inc step))
      (odd? n) (recur (+ (* n 3) 1) (inc step)))))
