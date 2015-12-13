; DISEASE Diagnosis System (Using Certainty Factor)
;---------------------------------------------------------

(defrule SetThresh
   (declare (salience 200))
   =>
   (set-threshold 0.1))

;----------------------------------------------------------

(defrule flu
(declare (cf 0.5))
(fever yes) 
(cough yes)
=>
(assert (diagnosis Flu)))


(defrule yellow-fever
(declare (cf 0.8))
(yellow-skin yes) 
(fever yes)
=>
(assert (diagnosis Yellow-Fever)))


(defrule jaundice
(declare (cf 0.6))
(yellow-eyes yes) 
(fever yes)
=>
(assert (diagnosis Jaundice)))


(defrule cholera
(declare (cf 0.7))
(dirrhoea yes) 
(leg-cramps yes)
(fever yes)
=>
(assert (diagnosis Cholera)))


(defrule malaria
(declare (cf 0.8))
(chills yes) 
(fever yes)
=>
(assert (diagnosis Malaria)))


(defrule Ebola
(declare (cf 0.9))
(Raised-Rash yes) 
(Bleeding yes)
(dirrhoea yes)
=>
(assert (diagnosis Ebola)))

;-----------------------------------------------------------

(defrule fever
   (declare (salience 100))
   =>
(printout t " " crlf)
   (printout t "Enter confidence that if the patient has a Fever (0 to 1): ")
   (bind ?cf (read))
   (assert (fever yes) CF ?cf))

(defrule cough
   (declare (salience 100))
   =>
(printout t " " crlf)
   (printout t "Enter confidence that if the patient has a Cough (0 to 1): ")
   (bind ?cf (read))
   (assert (cough yes) CF ?cf))

(defrule yellow-skin
   (declare (salience 100))
   =>
(printout t " " crlf)
   (printout t "Enter confidence that if the patient has a Yellow Skin (0 to 1): ")
   (bind ?cf (read))
   (assert (yellow-skin yes) CF ?cf))

(defrule yellow-eyes
   (declare (salience 100))
   =>
(printout t " " crlf)
   (printout t "Enter confidence that if the patient has a Yellow Eyes (0 to 1): ")
   (bind ?cf (read))
   (assert (yellow-eyes yes) CF ?cf))

(defrule dirrhoea
   (declare (salience 100))
   =>
(printout t " " crlf)
   (printout t "Enter confidence that if the patient has a Dirrhoea (0 to 1): ")
   (bind ?cf (read))
   (assert (dirrhoea yes) CF ?cf))

(defrule leg-cramps
   (declare (salience 100))
   =>
(printout t " " crlf)
   (printout t "Enter confidence that if the patient has a Leg-Cramps (0 to 1): ")
   (bind ?cf (read))
   (assert (leg-cramps yes) CF ?cf))

(defrule chills
   (declare (salience 100))
   =>
(printout t " " crlf)
   (printout t "Enter confidence that if the patient has a Chills (0 to 1): ")
   (bind ?cf (read))
   (assert (chills yes) CF ?cf))

(defrule Raised-Rash
   (declare (salience 100))
   =>
(printout t " " crlf)
   (printout t "Enter confidence that if the patient has a Raised Rash (0 to 1): ")
   (bind ?cf (read))
   (assert (Raised-Rash yes) CF ?cf))

(defrule Bleeding
   (declare (salience 100))
   =>
(printout t " " crlf)
   (printout t "Enter confidence that if the patient has a Bleeding (0 to 1): ")
   (bind ?cf (read))
   (assert (Bleeding yes) CF ?cf))
;-------------------------------------------------------------------

(defrule ShowResults
   (declare (salience -100))
   ?f <- (diagnosis ?d)
   =>
   (printout t " " crlf)
   (printout t " " crlf)
   (printout t " Patient is Diagnosed with Certainty of " (get-cf ?f) " Please Do Medical Tests For " ?d crlf))
  

