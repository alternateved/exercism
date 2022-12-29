(ns series
  (:require [clojure.string :as str]))

(defn slices
  "Given a string of digits, output all the contiguous substrings
  of provided length in that string in the order that they appear."
  [s n]
  (if (zero? n) [""]
      (mapv str/join
            (partition n 1 s))))
