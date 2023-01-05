(ns protein-translation
  (:require [clojure.string :as str]))

(defn translate-codon [s]
  (case s
    "AUG" "Methionine"
    "UGG" "Tryptophan"
    ("UUU" "UUC") "Phenylalanine"
    ("UUA" "UUG") "Leucine"
    ("UCU" "UCC" "UCA" "UCG") "Serine"
    ("UAU" "UAC") "Tyrosine"
    ("UGU" "UGC") "Cysteine"
    ("UAA" "UAG" "UGA") "STOP"))

(defn translate-rna [s]
  (into [] (comp
            (map str/join)
            (map translate-codon)
            (take-while #(not= % "STOP")))
        (partition 3 s)))
