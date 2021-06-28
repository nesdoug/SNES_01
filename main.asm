; example 1 SNES code

.p816
.smart


.include "regs.asm"
.include "variables.asm"
.include "macros.asm"
.include "init.asm"




.segment "CODE"

; enters here in forced blank
Main:
.a16 ; the setting from init code
.i16
	phk
	plb
	
	A8
	stz CGADD ; $2121 set color address to 0
	lda #$1f	 ; palette low byte gggrrrrr
				 ; 1f = all the red bits
	sta CGDATA ; $2122 - write twice
	lda #$00	 ; palette high byte -bbbbbgg
	sta CGDATA ; $2122
	
; -bbbbbgg gggrrrrr
; black = $0000
; red = $001f
; green = $03e0
; blue = $7c00
; white = $7fff

; turn the screen on (end forced blank)
	lda #FULL_BRIGHT ; $0f
	sta INIDISP ; $2100

; note, nothing is active on the main screen,
; so only the main background color will show.
; $212c is the main screen register	



Infinite_Loop:	
	A8
	XY16
	jsr Wait_NMI
	
	;code goes here

	jmp Infinite_Loop
	
	
	
Wait_NMI:
.a8
.i16
;should work fine regardless of size of A
	lda in_nmi ;load A register with previous in_nmi
@check_again:	
	WAI ;wait for an interrupt
	cmp in_nmi	;compare A to current in_nmi
				;wait for it to change
				;make sure it was an nmi interrupt
	beq @check_again
	rts
	
	



	
.include "header.asm"	








