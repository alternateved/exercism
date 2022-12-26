(ns anagram
  (:require [clojure.string :as str]))

(defn anagrams-for
  "Given a word and a collection of words, return a collection
  where every word is an anagram of provided word."
  [word prospect-list]
  (let [lowercased-word (str/lower-case word)
        freq (frequencies lowercased-word)]
    (into [] (comp
              (filter #(not (= (str/lower-case %) lowercased-word)))
              (map #(assoc {} :freq (frequencies (str/lower-case %)) :word %))
              (filter #(= (:freq %) freq))
              (map :word))
          prospect-list)))
