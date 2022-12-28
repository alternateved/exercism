(ns word-count
  (:require [clojure.string :as str]))

(defn word-count
  "Given a string, return the count of each word's occurence."
  [words]
  (as-> (str/lower-case words) s
    (str/replace s #"[^a-z\s\d]" "")
    (str/split s #" ")
    (remove empty? s)
    (frequencies s)))
