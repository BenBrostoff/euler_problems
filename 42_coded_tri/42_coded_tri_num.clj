(load-file "/Users/benbrostoff/Desktop/PROGRAMMING/euler_problems_brostoff/42_coded_tri/words.clj")

(require '[clojure.string :as str])


(def tri-nums
  (vec
    (map
      (fn [x] (/ (* x (+ x 1)) 2))  
      ;; not well-done -> refactor
      ;;(apply max (wordmap)) => 192 => < 20th tri
      (vec (range 1 20)))))

(defn alphamap
  [letter]
  (@alphanum letter))

(defn wordmap
  []
  (vec
    (map
     add-word 
     words)))

(defn add-word
  [word]
  (reduce 
   +
   (map-word word)))

(defn split-word
  [word]
  (vec (drop 1 (str/split word #""))))

(defn map-word
  [word]
  (vec
    (map
     alphamap
     (split-word (clojure.string/lower-case word)))))

(defn word-is-tri
  [num]
  (contains? (set tri-nums) num))

(defn tri-words
  []
  (count (vec 
    (filter
      word-is-tri
      (wordmap)))))

(println (tri-words))