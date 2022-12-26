(ns acronym
  (:require [clojure.string :as str]))

(defn acronym
  "Converts phrase to its acronym."
  [phrase]
  (if (empty? phrase) ""
      (apply str
             (into [] (comp
                       (filter #(not (empty? %)))
                       (map first)
                       (map str/upper-case))
                   (str/split phrase #"(?<=[a-z])(?=[A-Z])| |-")))))
