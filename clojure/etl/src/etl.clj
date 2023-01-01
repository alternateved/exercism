(ns etl
  (:require [clojure.string :as str]))

(defn transform
  "From each key/value pair extract elements nested in value
  and construct new map with key/element pair."
  [m]
  (into {} (for [[k v] m
                 e v]
             [(str/lower-case e) k])))
