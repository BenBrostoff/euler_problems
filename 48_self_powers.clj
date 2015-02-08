(solve 10 1000)

(defn raiseup [x]
  (reduce * (repeat x x)))

(defn range-over [num]
  (reduce + (map raiseup (range num))))

(defn get-last [digs num]
  (take-last digs (seq (str num))))

(defn solve [digs num]
  (println (get-last digs (range-over num))))
