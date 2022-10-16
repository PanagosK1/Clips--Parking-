(deffacts spaces
	(sp S01 0 P)
	(sp S02 0 free)
	(sp S03 0 P)
	(sp S04 0 P)
	(sp S05 0 P)
	(sp S06 0 P)
	(sp S07 1 free)
	(sp S08 1 P)
	(sp S09 1 P)
	(sp S10 1 P)
	(sp S11 1 P)
	(sp S12 1 free)
)

(deffacts platforms
	(pl P1 S01 free)
	(pl P2 S03 free)
	(pl P3 S04 free)
	(pl P4 S05 free)
	(pl P5 S06 free)
	(pl P6 S08 free)
	(pl P7 S09 free)
	(pl P8 S10 free)
	(pl P9 S11 free)
)

(deffacts left
	(le S02 S01)
	(le S03 S02)
	(le S05 S04)
	(le S06 S05)
	(le S08 S07)
	(le S09 S08)
	(le S11 S10)
	(le S12 S11)	
	
)

(deffacts right
	(ri S01 S02)
	(ri S02 S03)
	(ri S04 S05)
	(ri S05 S06)
	(ri S07 S08)
	(ri S08 S09)
	(ri S10 S11)
	(ri S11 S12)	
)

(deffacts up
	(up S04 S01)
	(up S05 S02)
	(up S06 S03)
	(up S10 S07)
	(up S11 S08)
	(up S12 S09)	
)

(deffacts down
	(dw S01 S04)
	(dw S02 S05)
	(dw S03 S06)
	(dw S07 S10)
	(dw S08 S11)
	(dw S09 S12)	
)

(deffacts cars
	(car YXF852 W)
	(car XXX666 W)
	(car SEX375 W)
	(car SAE845 W)
	(car BAE852 W)
	(car BAS222 W)
	(parked_Cars 0)
)


(defrule begin
	(declare (salience 1000))
	(initial-fact)

=>
	(set-strategy Random)
)

(defrule move_right_P
	(declare (salience 5))
	(ri ?X ?Y)
?x<-	(sp ?X 0 free) 
?y<-	(sp ?Y 0 P)
?z<-	(pl ?P ?Y ?f)
=>
(printout t "Space" ?X " will have his platform right to space" ?Y crlf)
(retract ?x ?y ?z)
(assert (sp ?Y 0 free))
(assert (sp ?X 0 P))
(assert (pl ?P ?X ?f)))


(defrule move_left_P
	(declare (salience 5))	
	(le ?X ?Y)
?x<-	(sp ?X 0 free)
?y<-	(sp ?Y 0 P)
?z<-	(pl ?P ?Y ?f)
=>
(printout t "Space" ?X " will have his platform left to space" ?Y crlf)
(retract ?x ?y ?z)
(assert (sp ?Y 0 free))
(assert (sp ?X 0 P))
(assert (pl ?P ?X ?f)))


(defrule move_up_P
	(declare (salience 5))
	(up ?K ?L)
?k<-	(sp ?L 0 free)
?l<-	(sp ?K 0 P)
?m<-	(pl ?Q ?K ?f)
=>
(printout t "Space" ?L " will have his platform up to space" ?K crlf)
(retract ?k ?l ?m)
(assert (sp ?K 0 free))
(assert (sp ?L 0 P))
(assert (pl ?Q ?L ?f)))


(defrule move_down_P
	(declare (salience 5))
	(dw ?K ?L)
?k<-	(sp ?L 0 free)
?l<-	(sp ?K 0 P)
?m<-	(pl ?Q ?K ?f)
=>
(printout t "Space" ?L " will have his platform down to space" ?K crlf)
(retract ?k ?l ?m)
(assert (sp ?K 0 free))
(assert (sp ?L 0 P))
(assert (pl ?Q ?L ?f)))


(defrule enter_waiting_car
	(declare (salience 100))
?i<-	(car ?X W)
?p<-	(pl ?Y S02 free)
?c<-	(parked_Cars ?N)
=>
(printout t "Car :" ?X " will be parked at " ?Y crlf)
(retract ?i ?p ?c)
(assert (car ?X P))
(assert (pl ?Y S02 car))
(assert (parked_Cars (+ ?N 1))))


(defrule parking_goal 
	(declare (salience 50))
	(parked_Cars ?N)
=>
	(if(= ?N 5)
		then 
		(printout t "All car is parked in platforms" crlf)
		(halt)
	)	
)