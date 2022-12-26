(ns bob
  (:require [clojure.string :as str]))

(defn question?
  "Returns true if provided string ends with a question mark."
  [s]
  (str/ends-with? s "?"))

(defn upper-case?
  "Returns true if provided string has words in upper-case."
  [s]
  (not (nil? (re-find #"(?=.*[A-Z]+.*)(?=^[^a-z]+$)" s))))

(defn response-for
  "Returns Bob's answers for provided sentences."
  [s]
  (let [message (str/trim s)]
    (cond
      (and (upper-case? message) (question? message)) "Calm down, I know what I'm doing!"
      (upper-case? message) "Whoa, chill out!"
      (question? message) "Sure."
      (empty? message) "Fine. Be that way!"
      :else "Whatever.")))
