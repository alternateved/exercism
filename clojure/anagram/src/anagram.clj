(ns anagram
  (:require [clojure.string :as str]))

(defn anagrams-for
  "Given a word and a collection of words, return a collection
  where every word is an anagram of provided word."
  [word prospect-list]
  (let [lowercased-word (str/lower-case word)
        sorted-word (sort lowercased-word)]
    (into [] (comp
              (filter #(not (= (str/lower-case %) lowercased-word)))
              (map #(assoc {} :sorted (sort (str/lower-case %)) :word %))
              (filter #(= (:sorted %) sorted-word))
              (map :word))
          prospect-list)))
