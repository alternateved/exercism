(ns pig-latin
  (:require [clojure.string :as str]))

(def vowels
  #{\a \e \i \o \u})

(def consonants
  #{\b \c \d \f \g \h \j \k \l \m \n
    \p \q \r \s \t \v \w \x \y \z })

(defn y?
  "Return true if c is y character."
  [c]
  (= c \y))

(defn translate-word
  "Translate provided word into Pig Latin."
  [s]
  (cond
    ;; Rule 1
    (or (contains? vowels (first s))
        (or (= (take 2 s) '(\x \r))
            (= (take 2 s) '(\y \t))))
    (str s "ay")

    ;; Rule 3
    (= (take 2 s) '(\q \u))
    (apply str (concat (drop 2 s)
                       (take 2 s)
                       "ay"))
    
    (and (contains? consonants (first s))
         (= (take 2 (rest s)) '(\q \u)))
    (apply str (concat (drop 3 s)
                       (take 3 s)
                       "ay"))

    ;; ;; Rule 4
    (and (not (y? (first s)))
         (y? (first (drop-while #(and (not (y? %)) (contains? consonants %)) s))))
    (apply str (concat (drop-while #(not (y? %)) s)
                       (take-while #(not (y? %)) s)
                       "ay"))
    
    ;; Rule 2
    (contains? consonants (first s))
    (apply str (concat (drop-while #(contains? consonants %) s)
                       (take-while #(contains? consonants %) s)
                       "ay"))))

(defn translate
  "Translate provided string into Pig Latin."
  [s]
  (str/join " " (map translate-word (str/split s #" "))))
