(ns triangle)

(defn is-valid? [a b c]
  (and (every? #(> % 0) [a b c])
       (>= (+ a b) c)
       (>= (+ a c) b)
       (>= (+ b c) a)))

(defn equilateral? [a b c]
  (and (is-valid? a b c)
       (= a b c)))

(defn isosceles? [a b c]
  (and (is-valid? a b c)
       (or (= a b)
           (= a c)
           (= b c))))

(defn scalene? [a b c] 
  (and (is-valid? a b c)
       (= 3 (count (hash-set a b c)))))
