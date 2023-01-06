(ns hamming)

(defn distance [s1 s2]
  (when (= (count s1)
           (count s2))
    (->> (map #(= %1 %2) s1 s2)
         (filter false?)
         (count))))
