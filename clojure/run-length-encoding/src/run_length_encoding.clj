(ns run-length-encoding)

(defn to-str [xform coll]
  (transduce xform
             (completing #(.append ^StringBuilder % %2) str)
             (StringBuilder.)
             coll))

(defn run-length-encode
  "Encodes a string with run-length-encoding."
  [s] (to-str (comp
               (partition-by identity)
               (mapcat (juxt count first))
               (remove #{1})) s))

(defn run-length-decode
  "Decodes a run-length-encoded string."
  [s] (to-str
       (mapcat (fn [[_ n c]] (repeat (Long/parseLong (or n "1")) c)))
       (re-seq #"(\d+)?(\D)" s)))
