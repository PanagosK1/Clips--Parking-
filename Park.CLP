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
	(sp S13 2 free)
	(sp S14 2 P)
	(sp S15 2 P)
	(sp S16 2 P)
	(sp S17 2 P)
	(sp S18 2 P)

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
	(pl P10 S14 free)
	(pl P11 S15 free)
	(pl P12 S16 free)
	(pl P13 S17 free)
	(pl P14 S18 free)

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
	(le S14 S13)
	(le S15 S14)
	(le S17 S16)
	(le S18 S17)		
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
	(ri S13 S14)
	(ri S14 S15)
	(ri S16 S17)
	(ri S17 S18)	
)

(deffacts up
	(up S04 S01)
	(up S05 S02)
	(up S06 S03)
	(up S10 S07)
	(up S11 S08)
	(up S12 S09)
	(up S16 S13)
	(up S17 S14)
	(up S18 S15)	
)

(deffacts down
	(dw S01 S04)
	(dw S02 S05)
	(dw S03 S06)
	(dw S07 S10)
	(dw S08 S11)
	(dw S09 S12)	
	(dw S13 S16)
	(dw S14 S17)
	(dw S15 S18)	
)

(deffacts cars
	(car YXF852 W)
	(car BAE852 W)
	(car DHM741 W)
	(car BED851 W)
	(car PNA145 W)
	(car MIX952 W)
	(parked_Cars 0)
)


(defrule begin
	(declare (salience 1000))
	(initial-fact)

=>
	(set-strategy Complexity)
)

(defrule move_right_P
	(declare (salience 5))
	(ri ?X ?Y)
?x<-	(sp ?X ?L0 free) 
?y<-	(sp ?Y ?L0 P)
?z<-	(pl ?P ?Y ?f)
=>
(printout t "Space " ?X " will have his platform right to space " ?Y crlf)
(retract ?x ?y ?z)
(assert (sp ?Y ?L0 free))
(assert (sp ?X ?L0 P))
(assert (pl ?P ?X ?f)))


(defrule move_left_P
	(declare (salience 5))	
	(le ?X ?Y)
?x<-	(sp ?X ?L0 free)
?y<-	(sp ?Y ?L0 P)
?z<-	(pl ?P ?Y ?f)
=>
(printout t "Space " ?X " will have his platform left to space " ?Y crlf)
(retract ?x ?y ?z)
(assert (sp ?Y ?L0 free))
(assert (sp ?X ?L0 P))
(assert (pl ?P ?X ?f)))


(defrule move_up_P
	(declare (salience 5))
	(up ?K ?L)
?k<-	(sp ?L ?L0 free)
?l<-	(sp ?K ?L0 P)
?m<-	(pl ?Q ?K ?f)
=>
(printout t "Space " ?L " will have his platform up to space" ?K crlf)
(retract ?k ?l ?m)
(assert (sp ?K ?L0 free))
(assert (sp ?L ?L0 P))
(assert (pl ?Q ?L ?f)))


(defrule move_down_P
	(declare (salience 5))
	(dw ?K ?L)
?k<-	(sp ?L ?L0 free)
?l<-	(sp ?K ?L0 P)
?m<-	(pl ?Q ?K ?f)
=>
(printout t "Space" ?L " will have his platform down to space" ?K crlf)
(retract ?k ?l ?m)
(assert (sp ?K ?L0 free))
(assert (sp ?L ?L0 P))
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
(assert (pl ?Y S02 ?X))
(assert (parked_Cars (+ ?N 1))))




(defrule move_floor_01
	(declare (salience 5))
?p<-	(sp S08 1 ?P)
?x<-	(sp S02 0 ?X)
?y<- 	(pl ?Y S08 ?F)
?i<- 	(pl ?L S02 ?N)
=>
(printout t "Space S08 will have his platform up/down to space S02" crlf)
(retract ?p ?x ?y ?i)
(assert (sp S08 1 ?X))
(assert (sp S02 0 ?P))
(assert (pl ?Y S02 ?F))
(assert (pl ?L S08 ?N))
)


(defrule move_floor_12
	(declare (salience 5))
?p<-	(sp S14 2 ?P)
?x<-	(sp S08 1 ?X)
?y<- 	(pl ?Y S14 ?F)
?i<- 	(pl ?L S08 ?N)
=>
(printout t "Space S14 will have his platform up/down to space S08" crlf)
(retract ?p ?x ?y ?i)
(assert (sp S14 2 ?X))
(assert (sp S08 1 ?P))
(assert (pl ?Y S08 ?F))
(assert (pl ?L S14 ?N))
)


(defrule parking_Count 
	(declare (salience 50))
	(parked_Cars ?N)
=>
	(if(= ?N 5)
		then 
		(printout t "All car is parked in platforms" crlf)
		(assert (done 1))
	)	
)



(defrule user_input
	(declare (salience 50))	
?d<-	(done ?N)
	(test (= 1 ?N))
=>
	(retract ?d)
	(printout t "Would you like to remove a car : " crlf)
	(bind ?ans (read))
	(if(eq ?ans no)
		then
		(halt)
		else 
		(printout t "Give the plate of the car : " crlf)
		(bind ?ans1 (read))
		(assert (rm ?ans1))
		(assert (done (+ 1 ?N)))
	)
)

(defrule unpark_car
	(declare (salience 100))	
?x<-	(rm ?X)
?i<-	(car ?X P)
?p<- (pl ?Y S02 ?X)
?c<-	(parked_Cars ?N)
?d<-	(done ?D)
=>
(printout t "Car : " ?X " will unparked" crlf)
(retract ?x ?i ?p ?c ?d)
(assert (car ?X Unparked))
(assert (parked_Cars (- ?N 1)))
(assert (pl ?Y S02 free))
(assert (done (- ?D 1)))
)








