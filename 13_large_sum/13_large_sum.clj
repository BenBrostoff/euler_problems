(def x (atom 0))

(with-open [rdr (reader "/Users/benbrostoff/Desktop/PROGRAMMING/euler_problems_brostoff/13_large_sum/13_large_sum.txt")]
  (doseq [line (line-seq rdr)]
    (swap! x + (read-string line))))

(defn get-first [digs num]
  (take digs (seq (str num))))

(defn solve [digs num]
  (println (get-first digs num)))

(solve 10 @x)
