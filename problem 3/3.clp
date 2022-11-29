
(
    deftemplate person
    (slot name)
    (slot course-1)
    (slot course-2)
    (slot course-3)
    (slot course-4)
)


(
    defrule read-input
    =>
    (open "input.txt" input "r")
    (bind ?line (readline input))
    (
        while (neq ?line EOF)
            (bind ?response (explode$ ?line))
            (assert(person-input ?response))
            (bind ?line (readline input))
    )
    (close input)
)

(
    defrule person-input-to-person
    ?f <- (person-input ?name ?c1 ?c2 ?c3 ?c4)
    =>
    (
        assert(
            person 
                (name ?name) 
                (course-1 ?c1) 
                (course-2 ?c2) 
                (course-3 ?c3) 
                (course-4 ?c4)
        )
    )
)

(
    defrule caluclate-gpa
    ?f <- (
        person 
        (name ?name) 
                (course-1 ?c1) 
                (course-2 ?c2) 
                (course-3 ?c3) 
                (course-4 ?c4)
        )
    =>
    (bind ?gpa (/ (+ (+ (+ ?c4 ?c3) ?c2) ?c1) 4.0))
    (
        assert(gpa-output ?name ?c1 ?c2 ?c3 ?c4 ?gpa)
    )
)

(
    defrule write-output
    ?f <- (gpa-output ?name ?c1 ?c2 ?c3 ?c4 ?gpa)
    =>
    (open "output.txt" res "a")
    (printout res 
        (format nil "%s (%d %d %d %d) %f" ?name ?c1 ?c2 ?c3 ?c4 ?gpa)
        crlf
    )
    (retract ?f)
    (close res)
)