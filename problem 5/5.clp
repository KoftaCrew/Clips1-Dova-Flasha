(
    deftemplate square 
    (slot id) 
    (slot side-length)
)


(
    deftemplate rectangle 
    (slot id) 
    (slot width) 
    (slot length)
)


(
    deftemplate circle 
    (slot id) 
    (slot radius)
)

(
    defrule square-area
    (square (id ?id) (side-length ?s))
    =>
    (assert(area (* ?s ?s)))
    (printout t "Square area: " ?id " " (* ?s ?s) crlf)
)

(
    defrule circle-area
    (circle (id ?id) (radius ?r))
    =>
    (assert(area (* 3.14 (* ?r ?r))))
    (printout t "Circle area: " ?id " " (* 3.14 (* ?r ?r)) crlf)
)

(
    defrule rectangle-area
    (rectangle (id ?id) (width ?w) (length ?l))
    =>
    (assert(area (* ?w ?l)))
    (printout t "Rectangle area: " ?id " " (* ?w ?l) crlf)
)

(defglobal ?*sum-area* = 0)

(
    defrule a-sum
    (area ?x)
    =>
    (bind ?*sum-area* (+ ?*sum-area* ?x))
    ;(printout t "Sum area: " ?*sum-area* crlf)
)

(defrule print-sum-area
    (declare (salience -1))
    =>
    (printout t "Sum area: " ?*sum-area* crlf)
)

(
    defrule square-perimeter
    (square (id ?id) (side-length ?s))
    =>
    (assert(perimeter (* 4 ?s)))
    (printout t "Square perimeter: " ?id " " (* 4 ?s) crlf)
)

(
    defrule circle-perimeter
    (circle (id ?id) (radius ?r))
    =>
    (assert(perimeter (* 3.14 (* 2 ?r))))
    (printout t "Circle perimeter: " ?id " " (* 3.14 (* 2 ?r)) crlf)
)

(
    defrule rectangle-perimeter
    (rectangle (id ?id) (width ?w) (length ?l))
    =>
    (assert(perimeter (* (+ ?w ?l) 2)))
    (printout t "Rectangle perimeter: " ?id " " (* (+ ?w ?l) 2) crlf)
)

(defglobal ?*sum-perimeter* = 0)

(
    defrule p-sum
    (perimeter ?x)
    =>
    (bind ?*sum-perimeter* (+ ?*sum-perimeter* ?x))
    ;(printout t "Sum perimeter: " ?*sum-perimeter* crlf)
)

(defrule print-sum-perimeter 
    (declare (salience -1))
    =>
    (printout t "Sum perimeter: " ?*sum-perimeter* crlf)
)



(
    deffacts test-case
    (square (id A) (side-length 3))
    (square (id B) (side-length 5))
    (rectangle (id C) (width 2) (length 5))
    (circle (id D) (radius 2))
    (circle (id E) (radius 6))
)
