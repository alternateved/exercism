(ns rna-transcription
  (:require [clojure.string :as str]))

(defn transcribe-nucleotide
  "Given a nucleotide return its complement."
  [n]
  (case n
    "G" "C"
    "C" "G"
    "T" "A"
    "A" "U"
    (throw (AssertionError. "Provided invalid DNA strand."))))

(defn to-rna
  "Given a DNA strand, return its RNA complement."
  [dna]
  (apply str (map transcribe-nucleotide (str/split dna #""))))
