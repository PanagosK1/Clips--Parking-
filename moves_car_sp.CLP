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
