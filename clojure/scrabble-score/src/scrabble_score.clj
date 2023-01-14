(ns scrabble-score
  (:require [clojure.string :as str]))

(defn score-letter [c]
  (case (str (str/lower-case c))
    ("a" "e" "i" "o" "u" "l" "n" "r" "s" "t") 1
    ("d" "g") 2
    ("b" "c" "m" "p") 3
    ("f" "h" "v" "w" "y") 4
    "k" 5
    ("j" "x") 8
    ("q" "z") 10))

(defn score-word [s]
  (transduce (map score-letter) + 0 s))
