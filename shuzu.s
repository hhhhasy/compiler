.file   "shuzu.c"
.option nopic
.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0"
.attribute unaligned_access, 0
.attribute stack_align, 16
.text

.globl  main
.type   main, @function

.str1:
        .string "please inter the 10 number:\n"
        
.str2:
        .string "%d"

.str3:
        .string "result:%d\n"
        
main:
        addi	sp,sp,-64
	sd	ra,0(sp)
	sd	s0,4(sp)
	sd      s1,8(sp)
	sd      s2,12(sp)
	sd      s3,16(sp)
	addi	s0,sp,0
	lui     a0, %hi(.str1)
        addi    a0, a0, %lo(.str1)
        call	printf
        li      s1,20
        li      s2,1
        li      s3,11
.loop:
        beq     s2,s3,.cal
        lui     a0, %hi(.str2)
        addi    a0, a0, %lo(.str2)
        add     a1,s0,s1
        call   __isoc99_scanf
        addi   s1,s1,4
        addi   s2,s2,1
        j      .loop

.cal:    
        li      s1,20
        li      s2,1
        li      a0,0
        li      a6,0
        li      a5,0
        li      s3,10
        
.sum:
        beq     s2,s3,.end
        add     a6,s0,s1
        ld      a5,(a6)
        add     a1,a1,a5
        addi    s1,s1,4
        addi    s2,s2,1
        j       .sum

.end:
        lui     a0, %hi(.str3)
        addi    a0, a0, %lo(.str3)
        call	printf
        ld	ra,0(sp)
	ld	s0,4(sp)
	ld      s1,8(sp)
	ld      s2,12(sp)
	ld      s3,16(sp)
	addi	sp,sp,64
	jr	ra
        
        
 
        
        
        
