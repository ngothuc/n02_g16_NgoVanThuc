.eqv MONITOR_SCREEN 0x10010000
.eqv RED 0x00FF0000
.eqv GREEN 0x0000FF00
.eqv BLUE 0x000000FF
.eqv WHITE 0x00FFFFFF
.eqv YELLOW 0x00FFFF00
.eqv BLACK 0x00000000
.eqv KEY_CODE 0xFFFF0004 		# ASCII code from keyboard, 1 byte 
.eqv KEY_READY 0xFFFF0000 		# =1 if has a new keycode ? 
 					# Auto clear after lw 
.eqv DISPLAY_CODE 0xFFFF000C 		# ASCII code to show, 1 byte 
.eqv DISPLAY_READY 0xFFFF0008 		# =1 if the display has already to do 
 					# Auto clear after sw
.eqv MASK_CAUSE_KEYBOARD 0x0000034 	# Keyboard Cause
.text
main:
	li $k0, MONITOR_SCREEN
	li $t1, 256
	li $t2, 256
	li $s0, 10		#vận tốc
	li $t4, KEY_CODE
	li $t5, KEY_READY
loop:
	nop
WaitForKey:
	lw $t8, 0($t5)
	beq $t8, 0, WaitForKey
EndWaitKey:
MakeIntR:
	teqi $t8, 1
	j loop	
endmain:
	li $v0, 10
	syscall
	
.ktext 0x80000180
mfc0 $t9, $13
li $s7, MASK_CAUSE_KEYBOARD
Keyboard:
	and $at, $t9, $s7
	beq $at, $s7, Counter_Keyboard
	j end_process
Counter_Keyboard:
	lw $t0, 0($t4)
Encrypt:
	blt $t0, 65, TryToDoSth
	blt $t0, 91, Lower
	j TryToDoSth
	Lower:
		addi $t0, $t0, 32
TryToDoSth:
	beq $t0, 'w', To_Up
	beq $t0, 's', To_Down
	beq $t0, 'a', To_Left
	beq $t0, 'd', To_Right
	beq $t0, 'z', To_Speed_Up
	beq $t0, 'x', To_Speed_Down
	To_Up:	
		jal Up
		j end_process
	To_Down: 
		jal Down
		j end_process
	To_Left:
		jal Left
		j end_process
	To_Right:
		jal Right
		j end_process
	To_Speed_Up:
		jal SpeedUp
		j end_process
	To_Speed_Down:
		jal SpeedDown
		j end_process
	
end_process:
next_pc:
	mfc0 $at, $14 # $at <= Coproc0.$14 = Coproc0.epc 
 	addi $at, $at, 4 # $at = $at + 4 (next instruction) 
 	mtc0 $at, $14 # Coproc0.$14 = Coproc0.epc <= $at
return: 
	eret

DrawCircle:
	li $t0, YELLOW
	#Vẽ tâm
	#mul $t3, $t2, 512
	#add $t3, $t3, $t1
	#mul $t3, $t3, 4
	#add $k1, $k0, $t3
	#sw $t0, 0($k1)
	
	addi $s2, $t2, -4
	addi $s1, $t1, -2
	mul $s3, $s2, 512
	add $s3, $s3, $s1
	mul $s3, $s3, 4
	add $k1, $k0, $s3
	sw $t0, 0($k1)
	sw $t0, 4($k1)
	sw $t0, 8($k1)
	sw $t0, 12($k1)
	sw $t0, 16($k1)	
	
	addi $s2, $t2, -3
	addi $s1, $t1, -3
	mul $s3, $s2, 512
	add $s3, $s3, $s1
	mul $s3, $s3, 4
	add $k1, $k0, $s3
	sw $t0, 0($k1)
	sw $t0, 4($k1)
	sw $t0, 20($k1)
	sw $t0, 24($k1)
	
	addi $s2, $t2, -2
	addi $s1, $t1, -4
	mul $s3, $s2, 512
	add $s3, $s3, $s1
	mul $s3, $s3, 4
	add $k1, $k0, $s3
	sw $t0, 0($k1)
	sw $t0, 4($k1)
	sw $t0, 28($k1)
	sw $t0, 32($k1)
	
	
	addi $s2, $t2, -1
	addi $s1, $t1, -4
	mul $s3, $s2, 512
	add $s3, $s3, $s1
	mul $s3, $s3, 4
	add $k1, $k0, $s3
	sw $t0, 0($k1)
	sw $t0, 32($k1)
	
	addi $s2, $t2, 0
	addi $s1, $t1, -4
	mul $s3, $s2, 512
	add $s3, $s3, $s1
	mul $s3, $s3, 4
	add $k1, $k0, $s3
	sw $t0, 0($k1)
	sw $t0, 32($k1)
	
	addi $s2, $t2, 1
	addi $s1, $t1, -4
	mul $s3, $s2, 512
	add $s3, $s3, $s1
	mul $s3, $s3, 4
	add $k1, $k0, $s3
	sw $t0, 0($k1)
	sw $t0, 32($k1)
	
	addi $s2, $t2, 2
	addi $s1, $t1, -4
	mul $s3, $s2, 512
	add $s3, $s3, $s1
	mul $s3, $s3, 4
	add $k1, $k0, $s3
	sw $t0, 0($k1)
	sw $t0, 4($k1)
	sw $t0, 28($k1)
	sw $t0, 32($k1)
	
	
	addi $s2, $t2, 3
	addi $s1, $t1, -3
	mul $s3, $s2, 512
	add $s3, $s3, $s1
	mul $s3, $s3, 4
	add $k1, $k0, $s3
	sw $t0, 0($k1)
	sw $t0, 4($k1)
	sw $t0, 20($k1)
	sw $t0, 24($k1)
	
	addi $s2, $t2, 4
	addi $s1, $t1, -2
	mul $s3, $s2, 512
	add $s3, $s3, $s1
	mul $s3, $s3, 4
	add $k1, $k0, $s3
	sw $t0, 0($k1)
	sw $t0, 4($k1)
	sw $t0, 8($k1)
	sw $t0, 12($k1)
	sw $t0, 16($k1)	
	
	jr $ra
	
Clear:
	li $t0, BLACK
	#Vẽ tâm
	mul $t3, $t2, 512
	add $t3, $t3, $t1
	mul $t3, $t3, 4
	add $k1, $k0, $t3
	sw $t0, 0($k1)
	
	addi $s2, $t2, -4
	addi $s1, $t1, -2
	mul $s3, $s2, 512
	add $s3, $s3, $s1
	mul $s3, $s3, 4
	add $k1, $k0, $s3
	sw $t0, 0($k1)
	sw $t0, 4($k1)
	sw $t0, 8($k1)
	sw $t0, 12($k1)
	sw $t0, 16($k1)	
	
	addi $s2, $t2, -3
	addi $s1, $t1, -3
	mul $s3, $s2, 512
	add $s3, $s3, $s1
	mul $s3, $s3, 4
	add $k1, $k0, $s3
	sw $t0, 0($k1)
	sw $t0, 4($k1)
	sw $t0, 20($k1)
	sw $t0, 24($k1)
	
	addi $s2, $t2, -2
	addi $s1, $t1, -4
	mul $s3, $s2, 512
	add $s3, $s3, $s1
	mul $s3, $s3, 4
	add $k1, $k0, $s3
	sw $t0, 0($k1)
	sw $t0, 4($k1)
	sw $t0, 28($k1)
	sw $t0, 32($k1)
	
	
	addi $s2, $t2, -1
	addi $s1, $t1, -4
	mul $s3, $s2, 512
	add $s3, $s3, $s1
	mul $s3, $s3, 4
	add $k1, $k0, $s3
	sw $t0, 0($k1)
	sw $t0, 32($k1)
	
	addi $s2, $t2, 0
	addi $s1, $t1, -4
	mul $s3, $s2, 512
	add $s3, $s3, $s1
	mul $s3, $s3, 4
	add $k1, $k0, $s3
	sw $t0, 0($k1)
	sw $t0, 32($k1)
	
	addi $s2, $t2, 1
	addi $s1, $t1, -4
	mul $s3, $s2, 512
	add $s3, $s3, $s1
	mul $s3, $s3, 4
	add $k1, $k0, $s3
	sw $t0, 0($k1)
	sw $t0, 32($k1)
	
	addi $s2, $t2, 2
	addi $s1, $t1, -4
	mul $s3, $s2, 512
	add $s3, $s3, $s1
	mul $s3, $s3, 4
	add $k1, $k0, $s3
	sw $t0, 0($k1)
	sw $t0, 4($k1)
	sw $t0, 28($k1)
	sw $t0, 32($k1)
	
	
	addi $s2, $t2, 3
	addi $s1, $t1, -3
	mul $s3, $s2, 512
	add $s3, $s3, $s1
	mul $s3, $s3, 4
	add $k1, $k0, $s3
	sw $t0, 0($k1)
	sw $t0, 4($k1)
	sw $t0, 20($k1)
	sw $t0, 24($k1)
	
	addi $s2, $t2, 4
	addi $s1, $t1, -2
	mul $s3, $s2, 512
	add $s3, $s3, $s1
	mul $s3, $s3, 4
	add $k1, $k0, $s3
	sw $t0, 0($k1)
	sw $t0, 4($k1)
	sw $t0, 8($k1)
	sw $t0, 12($k1)
	sw $t0, 16($k1)	
	
	jr $ra
	
Up:
	jal Clear
	li $v1, 'w'
	for_up:
	ble $t2, 4, end_for_up
	jal DrawCircle
	li $v0, 32
	li $a0, 100
	syscall
	jal Clear
	sub $t2, $t2, $s0
	lw $t8, 0($t5)
	teqi $t8, 1
	j for_up
	end_for_up:
	li $t2, 4
	jal DrawCircle
	jal Clear
	j Down
	
Down:
	jal Clear
	li $v1, 's'
	for_down:
	bge $t2, 507, end_for_down
	jal DrawCircle
	li $v0, 32
	li $a0, 100
	syscall
	jal Clear
	add $t2, $t2, $s0
	lw $t8, 0($t5)
	teqi $t8, 1
	j for_down
	end_for_down:
	li $t2, 507
	jal DrawCircle
	jal Clear
	j Up
	
Left:
	jal Clear
	li $v1, 'a'
	for_left:
	ble $t1, 4, end_for_left
	jal DrawCircle
	li $v0, 32
	li $a0, 100
	syscall
	jal Clear
	sub $t1, $t1, $s0
	lw $t8, 0($t5)
	teqi $t8, 1
	j for_left
	end_for_left:
	li $t1, 4
	jal DrawCircle
	jal Clear
	j Right
Right:
	jal Clear
	li $v1, 'd'
	for_right:
	bge $t1, 507, end_for_right
	jal DrawCircle
	li $v0, 32
	li $a0, 100
	syscall
	jal Clear
	add $t1, $t1, $s0
	lw $t8, 0($t5)
	teqi $t8, 1
	j for_right
	end_for_right:
	li $t1, 507
	jal DrawCircle
	jal Clear
	j Left
	
SpeedUp:
	addi $s0, $s0, 1
	beq $v1, 'w', Up
	beq $v1, 's', Down
	beq $v1, 'a', Left
	beq $v1, 'd', Right
	#for_spu:
	#	jal DrawCircle
	#	lw $t8, 0($t5)
	#	beq $t8, 0, for_spu
	#	teqi $t8, 1
	
SpeedDown:
	addi $s0, $s0, -1
	li $s0, 0
	beq $v1, 'w', Up
	beq $v1, 's', Down
	beq $v1, 'a', Left
	beq $v1, 'd', Right
	#for_spd:
	#	jal DrawCircle
	#	lw $t8, 0($t5)
	#	beq $t8, 0, for_spd
	#	teqi $t8, 1
	

	
	

