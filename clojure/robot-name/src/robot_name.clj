(ns robot-name
  (:require [clojure.set :as set]))

(def active-robots
  "Global state of active robots."
  (atom #{}))

(def letters
  "A collection of all capital letters."
  (mapv char (range (int \A) (inc (int \Z)))))

(defn rand-letter
  "Returns a random capital letter between A and Z."
  [] (rand-nth letters))

(defn gen-name
  "Generate a random name in the format of two uppercase letters
  followed by three digits, such as RX837 or BC811."
  [] (->> (repeatedly 2 rand-letter)
          (into (repeatedly 3 #(rand-int 10)))
          (apply str)))

(defn unused-name
  "Given a collection of names return an unused name."
  [names]
  (let [n (gen-name)]
    (if (contains? names n)
      (recur names)
      n)))

(defn obtain-name
  "Obtain new unique name."
  [] (loop []
       (let [old @active-robots
             n (unused-name old)
             new (conj old n)]
         (if (compare-and-set! active-robots old new)
           n
           (recur)))))

(defn assign-name
  "Assign unique name to robot."
  [r]
  (let [new-name (obtain-name)
        [prev curr] (swap-vals! r #(or % new-name))]
    (when prev
      (swap! active-robots disj new-name))
    curr))

(defn robot
  "Create a new robot."
  [] (atom nil))

(defn robot-name
  "Either return aleady assigned name or
  assign new name if robot is unnamed."
  [r] (or @r (assign-name r)))

(defn reset-name
  "Reset name of provided robot."
  [r] (swap! active-robots disj
             (first (swap-vals! r (constantly nil)))))
