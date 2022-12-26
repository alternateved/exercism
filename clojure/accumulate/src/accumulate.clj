(ns accumulate)

(defn accumulate
  [f initial]
  (loop [coll initial
         acc []]
    (if (empty? coll) acc
        (recur  (rest coll) (conj acc (f (first coll)))))))

