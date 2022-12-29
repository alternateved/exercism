(ns series)

(defn slices
  "Given a string of digits, output all the contiguous substrings
  of provided length in that string in the order that they appear."
  [string length]
  (if (= length 0) [""]
      (vec (map #(apply str %)
                (partition length 1 string)))))

