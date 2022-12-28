(ns series)

(defn slices
  "Given a string of digits, output all the contiguous substrings
  of provided length in that string in the order that they appear."
  [string length]
  (loop [acc []
         s string]
    (let [s-length (count s)]
      (cond
        (= length 0) [""]        
        (= s-length 0) []
        (< s-length length) []
        (= s-length length) (conj acc (apply str s))
        :else (recur (conj acc (apply str (take length s))) (rest s))))))
