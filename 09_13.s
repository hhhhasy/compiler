.file   "09_13.c"
.option nopic
.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0"
.attribute unaligned_access, 0
.attribute stack_align, 16
.text
.globl  AD
.type   AD, @function
AD:
        mv     a5, a0
        mv     a6, a1
        addw   a5, a5, a6
        sext.w	a5,a5
        mv     a0,a5
        jr ra
        .size	AD, .-AD
	
	

.globl  SB
.type   SB, @function
SB:
        mv     a5, a0
        mv     a6, a1
        subw   a5, a5, a6
        sext.w	a5,a5
        mv     a0,a5
        jr ra
        .size	SB, .-SB
	

.globl  ML
.type   ML, @function

ML:
        mv     a5, a0
        mv     a6, a1
        mulw    a5, a5, a6
        sext.w	a5,a5
        mv     a0,a5
        jr ra
        
        .size	ML, .-ML

.globl  DV
.type   DV, @function
DV:
        mv     a5, a0
        mv     a6, a1
        divw    a5, a5, a6
        sext.w	a5,a5
        mv     a0,a5
        jr ra
        
        .size	DV, .-DV	

.str1:
        .string "%d %d %c"
        
.str2:
        .string "%d"

.text

.globl  main
.type   main, @function

main:
        addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	addi	a3,s0,-25
	addi	a4,s0,-24
	addi	a5,s0,-20
        mv     a1,a5
        mv     a2,a4
        
        lui    a0, %hi(.str1)
        addi   a0, a0, %lo(.str1)
        call   __isoc99_scanf
        lbu    a3,-25(s0)
        li     a4, 43
        bne    a3,a4,.A
        lw     a0, -20(s0)
        lw     a1, -24(s0)
        call   AD
        mv	a5,a0
	mv	a1,a5
	lui	a5,%hi(.str2)
	addi	a0,a5,%lo(.str2)
	call	printf
	j      .end
	
        
.A:
        lbu    a3,-25(s0)
        li     a4, 45
        bne    a3,a4,.S
        lw     a0, -20(s0)
        lw     a1, -24(s0)
        call   SB
        mv	a5,a0
	mv	a1,a5
	lui	a5,%hi(.str2)
	addi	a0,a5,%lo(.str2)
	call	printf
	j      .end
	

.S:
        lbu    a3,-25(s0)
        li     a4, 42
        bne    a3,a4,.D
        lw     a0, -20(s0)
        lw     a1, -24(s0)
        call   ML
        mv	a5,a0
	mv	a1,a5
	lui	a5,%hi(.str2)
	addi	a0,a5,%lo(.str2)
	call	printf
	j      .end
.D:
        lbu    a3,-25(s0)
        li     a4, 47
        bne    a3,a4,.end
        lw     a0, -20(s0)
        lw     a1, -24(s0)
        call   DV
        mv	a5,a0
	mv	a1,a5
	lui	a5,%hi(.str2)
	addi	a0,a5,%lo(.str2)
	call	printf
	j      .end	


.end:
        li	a5,0
	mv	a0,a5
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
        
	
	
	
	
	

        	
	

        
        
	
	
	
	
	

        	
	

        
