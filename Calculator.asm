.data
buffer: .space 60
buffer1: .space 60
buffer2: .space 60
  
name1: .asciiz " what is your name?\n"
Hello: .asciiz " Hello Mike:\n"
brother: .asciiz " Do you have a brother?\n"
brother1: .asciiz " Thnk you! you enterd\n"

start:   .asciiz  "\n Please enter a menu from 1-3, and 4 will end the program: "
input:   .asciiz  "\n Please enter a number: "
more:    .asciiz "\n would you like continue? Enter 3 for yes -3 for no : "

list1:    .asciiz  "\n You are in menu1:  Multiplication and addtion \n"
list2:    .asciiz  "\n You are in menu2: Addion and division \n"
list3:    .asciiz  "\n You are in menu3: addtion and subtraction \n" 

answer1:  .asciiz  "\n Your answer is: "
minus:     .asciiz  "\n Your aswer is: "
multi1: 	.asciiz   "\n Your answer is: "

.text  
main:

 li $v0, 4     #this will print String
la $a0, name1
syscall 

li $v0,8            # this will read string 
la $a0, buffer
li $a1, 60
syscall 

li $v0, 4     #this will print String
la $a0, Hello
syscall 

li $v0, 4         #this will print String in the data 
la $a0, brother
syscall 
 
li $v0,8
la $a0, buffer
li $a1, 60
syscall

li $v0, 4         #this will print String
la $a0, brother1
syscall 
li $v0, 4
la $a0, buffer
syscall 


start1:  
   li     $v0, 4	             # print string,  
  la     $a0, start            # put data string in $a0
    syscall                    # execute the printed string to screen  
	
    li	$v0, 5               # read Integer          
    syscall  		        # execute reading from user , and get the first number
	move $t0, $v0
       #$v0's for menu selections  
	   
	beq   $t0, 1, menu1         # move to menue 1 if number is = 1
    beq   $t0, 2, menu2         # move  to menu 2 if number is = 2
    beq   $t0, 3, menu3         # move  to menu 3 if number is = 3



menu1: 

#loop:
li $a1, 0                  
   
    li $t0, 4 

li $v0, 4
la $a0, list1
syscall 

one:
	li 	$v0, 4			#print String
	la 	$a0, input
	syscall
	
	li $v0, 5			#read the integer 
	syscall
	move $s0, $v0

	li 	$v0, 4			# print String to enter number 
	la 	$a0, input
	syscall
	
	li $v0, 5			# integer and move to save
	syscall
	move $s1, $v0
 
		li 	$v0, 4			#print String
	la 	$a0, input
	syscall
	
	li $v0, 5			#read the integer 
	syscall
	move $s2, $v0  
	
	mult $s1, $s0		#multiply add the two numbers
	mflo $s1
	add $s1, $s1, $s2
	
	li $v0, 4			#print the answer string
	la $a0, minus
	syscall

	li $v0, 1			#print answer integer
	move $a0, $s1	
	syscall
	
li $v0, 4			# ask to continue  or not 
	la $a0, more
	syscall

	li 	$v0, 5			#reads integer for choice
	syscall

	beq $v0, 3 two
	beq $v0, -3 start1	 # return to main selection menu  
	

    bltu $t0, 4 loop
    b  next
    #bgtz $t0, loop  
	
menu2: 
li $v0, 4
la $a0, list2
syscall 

two:
#loop 
li $a1, 0                  
   
    li $t0, 4 


	li 	$v0, 4			#print String
	la 	$a0, input
	syscall
	
	li $v0, 5			#read the integer 
	syscall
	move $s0, $v0

	li 	$v0, 4			# print String to enter number 
	la 	$a0, input
	syscall
	
	li $v0, 5			# integer and move to save
	syscall
	move $s1, $v0

		li 	$v0, 4			#print String
	la 	$a0, input
	syscall
	
	li $v0, 5			#read the integer 
	syscall
	move $s2, $v0 
	
	add $s1, $s1, $s2
	div $s1, $s0		# devide the two numbers then add 
	mflo $s1
	
	
	li $v0, 4			#print the answer string
	la $a0, multi1
	syscall

	li $v0, 1			#print answer integer
	move $a0, $s1	
	syscall

li $v0, 4			# ask to continue  or not 
	la $a0, more
	syscall


	li 	$v0, 5			#reads integer for choice
	syscall

	beq $v0, 3 three
	beq $v0, -3 start1	 # return to main selection menu  
 
bltu $t0, 4 loop
    b  next
    #bgtz $t0, loop 
	
menu3: 
#loop
li $a1, 0                  
   
    li $t0, 4 

li $v0, 4
la $a0, list2
syscall 

	three:
	li 	$v0, 4			#print String
	la 	$a0, input
	syscall
	
	li $v0, 5			#read the integer 
	syscall
	move $s0, $v0

	li 	$v0, 4			# print String to enter number 
	la 	$a0, input
	syscall
	
	li $v0, 5			# integer and move to save
	syscall
	move $s1, $v0

		li 	$v0, 4			#print String
	la 	$a0, input
	syscall
	
	li $v0, 5			#read the integer 
	syscall
	move $s2, $v0  
	
	add $s1, $s1, $s0		#add the two numbers
	sub $s1, $s1, $s2
	
	li $v0, 4			#print the answer string
	la $a0, answer1
	syscall

	li $v0, 1			#print answer integer
	move $a0, $s2	
	syscall
	
li $v0, 4			# ask to continue  or not 
	la $a0, more
	syscall


	li 	$v0, 5			#reads integer for choice
	syscall

	beq $v0, 3 one
	beq $v0, -3 start1	 # return to main selection menu   

 bltu $t0, 4 loop
    b  next
    #bgtz $t0, loop 
