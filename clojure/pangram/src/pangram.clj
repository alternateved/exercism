(ns pangram
  (:require [clojure.string :as str]))

(def alphabet
  #{ \a \b \c \d \e \f \g \h \i \j \k \l \m
    \n \o \p \q \r \s \t \u \v \w \x \y \z })

(defn pangram?
  "Returns true if provided string is a pangram."  
  [s]
  (= alphabet
     (-> (str/lower-case s)
         (str/replace #"[^a-z]" "")
         (seq)
         (set))))

