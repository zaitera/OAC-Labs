.text

	li $s0,0x01010101
	la $s1,0xff000000  	#END_VGA
	li $s2,76800 		# 320x240
 	li $t1,0
 	li $t2,0
INICIO:	move $t4, $s1
 	li $t0,0
LOOP1: 	beq $t0, $s2, PULA
	sw $t1, 0($t4)
	addi $t0, $t0, 4
	add $t4, $s1, $t0
	j LOOP1

PULA:	addi $t2,$t2,1
	mul $t1,$s0,$t2
	j INICIO


