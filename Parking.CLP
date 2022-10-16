(deffacts spaces
	(sp S01 0 P)
	(sp S02 0 free)
	(sp S03 0 P)
	(sp S04 0 P)
	(sp S05 0 P)
	(sp S06 0 P)
)

(deffacts platforms
	(pl P1 S01 free)
	(pl P2 S03 free)
	(pl P3 S04 free)
	(pl P4 S05 free)
	(pl P5 S06 free)
)

(deffacts left
	(le S02 S01)
	(le S03 S02)
	(le S05 S04)
	(le S06 S05)	
)

(deffacts right
	(ri S01 S02)
	(ri S02 S03)
	(ri S04 S05)
	(ri S05 S06)	
)

(deffacts up
	(up S04 S01)
	(up S05 S02)
	(up S06 S03)	
)

(deffacts down
	(dw S01 S04)
	(dw S02 S05)
	(dw S03 S06)	
)

(deffacts cars
	(car YXF852 W)
	(car XXX666 W)
)

(defrule move_left_P
		(declare (salience 5))	
		(le ?X ?Y)
?x<-	(sp ?X 0 free)
?y<-	(sp ?Y 0 P)
?z<-	(pl ?P ?Y free)
=>
(printout t "Space" ?X " will have his platform left to space" ?Y crlf)
(retract ?x ?y ?z)
(assert (sp ?Y 0 free))
(assert (sp ?X 0 P))
(assert (pl ?P ?X free)))

(defrule move_left_P_C
		(declare (salience 5))	
		(le ?X ?Y)
?x<-	(sp ?X 0 free)
?y<-	(sp ?Y 0 P)
?z<-	(pl ?P ?Y car)
=>
(printout t "Space" ?X " will have his platform left to space" ?Y crlf)
(retract ?x ?y ?z)
(assert (sp ?Y 0 free))
(assert (sp ?X 0 P))
(assert (pl ?P ?X car)))






(defrule move_right_P
		(declare (salience 5))
		(ri ?X ?Y)
?x<-	(sp ?X 0 free) 
?y<-	(sp ?Y 0 P)
?z<-	(pl ?P ?Y free)
=>
(printout t "Space" ?X " will have his platform right to space" ?Y crlf)
(retract ?x ?y ?z)
(assert (sp ?Y 0 free))
(assert (sp ?X 0 P))
(assert (pl ?P ?X free)))

(defrule move_right_P_C
		(declare (salience 5))
		(ri ?X ?Y)
?x<-	(sp ?X 0 free) 
?y<-	(sp ?Y 0 P)
?z<-	(pl ?P ?Y car)
=>
(printout t "Space" ?X " will have his platform right to space" ?Y crlf)
(retract ?x ?y ?z)
(assert (sp ?Y 0 free))
(assert (sp ?X 0 P))
(assert (pl ?P ?X car)))






(defrule move_up_P
		(declare (salience 5))
		(up ?K ?L)
?k<-	(sp ?L 0 free)
?l<-	(sp ?K 0 P)
?m<-	(pl ?Q ?K free)
=>
(printout t "Space" ?L " will have his platform up to space" ?K crlf)
(retract ?k ?l ?m)
(assert (sp ?K 0 free))
(assert (sp ?L 0 P))
(assert (pl ?Q ?L free)))

(defrule move_up_P_C
		(declare (salience 5))
		(up ?K ?L)
?k<-	(sp ?L 0 free)
?l<-	(sp ?K 0 P)
?m<-	(pl ?Q ?K car)
=>
(printout t "Space" ?L " will have his platform up to space" ?K crlf)
(retract ?k ?l ?m)
(assert (sp ?K 0 free))
(assert (sp ?L 0 P))
(assert (pl ?Q ?L car)))





(defrule move_down_P
		(declare (salience 5))
		(dw ?K ?L)
?k<-	(sp ?L 0 free)
?l<-	(sp ?K 0 P)
?m<-	(pl ?Q ?K free)
=>
(printout t "Space" ?L " will have his platform down to space" ?K crlf)
(retract ?k ?l ?m)
(assert (sp ?K 0 free))
(assert (sp ?L 0 P))
(assert (pl ?Q ?L free)))


(defrule move_down_P_C
		(declare (salience 5))
		(dw ?K ?L)
?k<-	(sp ?L 0 free)
?l<-	(sp ?K 0 P)
?m<-	(pl ?Q ?K car)
=>
(printout t "Space" ?L " will have his platform down to space" ?K crlf)
(retract ?k ?l ?m)
(assert (sp ?K 0 free))
(assert (sp ?L 0 P))
(assert (pl ?Q ?L car)))






(defrule enter_waiting_car
		(declare (salience 100))
?i<-	(car ?X W)
?p<-	(pl ?Y S02 free)
=>
(printout t "Car :" ?X " will be parked at " ?Y crlf)
(retract ?i ?p)
(assert (car ?X P))
(assert (pl ?Y S02 car)))

