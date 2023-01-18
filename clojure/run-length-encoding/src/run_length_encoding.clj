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
       (str/join)))

(defn decode-single
  "Decodes a single pair of number and character or character."
  [s]
  (if (= 1 (count s))
    s
    (let [n (Integer. (re-find #"\d+" s))
          c (re-find #"[a-zA-Z ]" s)]
      (str/join (repeat n c)))))

(defn run-length-decode
  "Decodes a run-length-encoded string."
  [s]
  (->> (re-seq #"(\d+[a-zA-Z ]{1})|(?<=[a-zA-Z ]{1})[a-zA-Z ]{1}|(^[a-zA-Z ]{1})" s)
       (map first)
       (map decode-single)
       (str/join)))
