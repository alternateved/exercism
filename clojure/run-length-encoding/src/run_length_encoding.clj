(ns run-length-encoding)

(defn run-length-encode
  "Encodes a string with run-length-encoding."
  [s] (apply str (into [] (comp
                           (partition-by identity)
                           (mapcat (juxt count first))
                           (remove #{1})) s)))

(defn run-length-decode
  "Decodes a run-length-encoded string."
  [s] (->> (re-seq #"(\d+)?(\D)" s)
           (mapcat (fn [[_ n c]] (repeat (Long/parseLong (or n "1")) c)))
           (apply str)))
