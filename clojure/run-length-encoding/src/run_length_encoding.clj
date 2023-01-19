(ns run-length-encoding
  (:require [clojure.string :as str]))

(defn run-length-encode
  "Encodes a string with run-length-encoding."
  [s] (->> (partition-by identity s)
           (mapcat (juxt count first))
           (remove #{1})
           (str/join)))

(defn decode-single
  "Decodes a single pair of number and character or character."
  [[_ n c]] (if-not n c (repeat (Long/parseLong n) c)))

(defn run-length-decode
  "Decodes a run-length-encoded string."
  [s] (->> (re-seq #"(\d+)?(\w|\s)" s)
           (mapcat decode-single)
           (str/join)))
