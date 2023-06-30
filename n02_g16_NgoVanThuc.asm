.eqv MONITOR_SCREEN 0x10010000
.eqv RED 0x00FF0000
.eqv GREEN 0x0000FF00
.eqv BLUE 0x000000FF
.eqv WHITE 0x00FFFFFF
.eqv YELLOW 0x00FFFF00
.eqv BLACK 0x00000000
.text
main:
	li $k0, MONITOR_SCREEN
	li $t1, 256
	li $t2, 256
	li $s0, 5		#vận tốc
	jal DrawCircle
	jal Left
endmain:
	li $v0, 10
	syscall
DrawCircle:
	li $t0, YELLOW
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
	for_up:
	ble $t2, 4, end_for_up
	jal DrawCircle
	li $v0, 32
	li $a0, 300
	syscall
	jal Clear
	sub $t2, $t2, $s0
	j for_up
	end_for_up:
	li $t2, 4
	jal DrawCircle
	jal Clear
	j Down
Down:
	for_down:
	bge $t2, 507, end_for_down
	jal DrawCircle
	li $v0, 32
	li $a0, 300
	syscall
	jal Clear
	add $t2, $t2, $s0
	j for_down
	end_for_down:
	li $t2, 507
	jal DrawCircle
	jal Clear
	j Up
Left:
	for_left:
	ble $t1, 4, end_for_left
	jal DrawCircle
	li $v0, 32
	li $a0, 300
	syscall
	jal Clear
	sub $t1, $t1, $s0
	j for_left
	end_for_left:
	li $t1, 4
	jal DrawCircle
	jal Clear
	j Right
Right:
	for_right:
	bge $t1, 507, end_for_right
	jal DrawCircle
	li $v0, 32
	li $a0, 300
	syscall
	jal Clear
	add $t1, $t1, $s0
	j for_right
	end_for_right:
	li $t1, 507
	jal DrawCircle
	jal Clear
	j Left
	

	
	

