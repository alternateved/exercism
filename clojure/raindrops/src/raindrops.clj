(ns raindrops)

(defn pling [n]
  (when (== 0 (mod n 3)) "Pling"))

(defn plang [n]
  (when (== 0 (mod n 5)) "Plang"))

(defn plong [n]
  (when (== 0 (mod n 7)) "Plong"))

(defn convert [n]
  (let [result (str (pling n) (plang n) (plong n))]
    (if (empty? result)
      (str n)
      result)))
