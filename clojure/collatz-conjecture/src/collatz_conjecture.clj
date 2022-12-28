(ns collatz-conjecture)

(defn collatz
  "Given a num, return the number of steps required to reach 1
  after transforming it repeatedly."
  [num]
  (if (>= 0 num)
    (throw (AssertionError. "Provided number is equal or lower than zero."))
    (transduce (comp
                (take-while #(> % 1))
                (map (constantly 1)))
               + 0 (iterate (fn [n] (if (even? n) (/ n 2) (+ (* n 3) 1))) num))))
