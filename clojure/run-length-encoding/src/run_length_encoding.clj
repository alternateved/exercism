(ns run-length-encoding
  (:require [clojure.string :as str]))

(defn run-length-encode
  "Encodes a string with run-length-encoding."
  [s]
  (->> (for [l (partition-by identity s)
             :let [n (count l)]]
         (conj [n] (first l)))
       (map (fn [[x & rest :as elem]]
              (if (= 1 x) rest elem)))       
       (map str/join)
       (apply str)))

(defn run-length-decode
  "Decodes a run-length-encoded string."
  [cipher-text])
