(ns robot-name
  (:require [clojure.set :as set]))

(def active-robots
  "Global state of active robots."
  (atom #{}))

(defn rand-letter 
  "Returns a random capital letter between A and Z."
  [] (rand-nth (map char (range (int \A) (inc (int \Z))))))

(defn gen-name
  "Generate a random name in the format of two uppercase letters
  followed by three digits, such as RX837 or BC811."
  [] (->> (repeatedly 2 rand-letter)
          (into (repeatedly 3 #(rand-int 10)))
          (apply str)))

(defn possible-names
  "Given a collection of names return a collection with added unique name."
  [coll]
  (let [n (gen-name)]
    (if (contains? coll n) (recur coll)
        (conj coll n))))

(defn assign-name
  "Assign unique name to robot."
  [r]
  (loop [[old new] (reset-vals! active-robots (possible-names @active-robots))]
    (let [diff (set/difference new old)]
      (if (or (empty? diff) (> (count diff) 1))
        (recur (reset-vals! active-robots (possible-names @active-robots)))
        (reset! r (first diff))))))

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
