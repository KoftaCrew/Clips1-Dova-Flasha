(defrule read-input
    =>
    (open "input.txt" input "r")
    (bind ?line (read-line input))
    (while (neq ?line EOF)
        (bind ?response (explode $?line))
        (assert (calculate-gpa ?response))
        (bind ?line (readline input))
    )
    (close input)

)

(defrule calculate-gpa
    (calculate-gpa ?response $?gpa)
    =>
    (bind ?gpa (calculate-gpa ?response))
    (printout t "GPA: " ?gpa crlf)
    (retract (calculate-gpa ?response))
)
