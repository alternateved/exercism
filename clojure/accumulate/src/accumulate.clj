(ns accumulate)

(defn accumulate
  ([f coll]
   (if (empty? coll)
     '()
     (accumulate f '() coll)))
  ([f accum [head & tail]]
   (if (empty? tail)
     (reverse (conj accum (f head)))
     (recur f (conj accum (f head)) tail))))
