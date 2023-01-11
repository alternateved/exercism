(ns all-your-base)

(defn to-digits
  "Convert a number to its digit representation in provided base."
  [n b]
  (into '() (comp
             (take-while #(> % 0))
             (map #(mod % b)))
        (iterate #(quot % b) n)))

(defn from-digits
  "Compute the number given by digits in provided base."
  [digits b] (reduce #(+ %2 (* b %1)) 0 digits))

(defn convert
  "Convert the digits representation of a number from base a to base a."
  [a digits b]
  (cond
    (empty? digits) nil
    (some neg? digits) nil
    (or (>= 1 a) (>= 1 b)) nil
    (every? zero? digits) '(0)
    (some #(>= % a) digits) nil
    :else (to-digits (from-digits digits a) b)))
