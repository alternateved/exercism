(ns log-levels
  (:require [clojure.string :as str]))

(defn parse-log
  "Takes a string representing a log line
  and returns a seq with trimmed level and log."
  [s]
  (->> s
       (re-find #"\[(.+)\]: (.+)")
       (rest)
       (map str/trim)))

(defn message
  "Takes a string representing a log line
   and returns its message with whitespace trimmed."
  [s]
  (last (parse-log s)))

(defn log-level
  "Takes a string representing a log line
   and returns its level in lower-case."
  [s]
  (str/lower-case (first (parse-log s))))

(defn reformat
  "Takes a string representing a log line and formats it
   with the message first and the log level in parentheses."
  [s]
  (str (message s) " (" (log-level s) ")"))
