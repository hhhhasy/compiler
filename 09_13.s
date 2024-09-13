	.file	"test.c"
	.option nopic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.globl	a
	.section	.sbss,"aw",@nobits
	.align	2
	.type	a, @object
	.size	a, 4
	.zero	4
	.globl	b
	.align	2
	.type	b, @object
	.size	b, 4
	.zero	4
        .globl  c
        .align  2
        .type   c, @object
        .size   c, 1
        .zero   1
	.text
	.align	1
	.globl	AD
	.type	AD, @function
AD:
        mv a5,a1
        mv a6,a2
        add a5,a5,a6
        sext.w a0,a5
        ret
        
        .globl	SB
	.type	SB, @function
SB:
        mv a5,a1
        mv a6,a2
        sub a5,a5,a6
        sext.w a0,a5
        ret
        
        .globl	ML
	.type	ML, @function
	
ML:
        mv a5,a1
        mv a6,a2
        mul a5,a5,a6
        sext.w a0,a5
        ret   

.str1:
        .string "%d %d %c"


        .globl	main
	.type	main, @function
	
main:
        addi sp,sp,-40
        sd   ra,32(sp)
	sd   s0,24(sp)
	sd   s1,16(sp)
	sd   s2,8(sp)
	lui  a0,%hi(.str1)
	lui  s0,%hi(a)
	lui  s1,%hi(b)
	lui  s2,%hi(c)
	addi a0,a0,%lo(.str1)
	addi a1,s0,%lo(a)
	addi a2,s1,%lo(b)
	addi a3,s2,%lo(c)
	call __isoc99_scanf
	lw   a1,%lo(a)(s0)
	lw   a2,%lo(b)(s1)
	lw   a3,%lo(c)(s2)
	beq  a3,43,A
	beq  a3,45,S
	beq  a3,42,M
	ld   ra,32(sp)
	ld   s0,24(sp)
	ld   s1,16(sp)
	ld   s2,8(sp)
	addi sp,sp,40
	jr   ra
	

A:
        call AD
        call printf
        ld   ra,32(sp)
	ld   s0,24(sp)
	ld   s1,16(sp)
	ld   s2,8(sp)
	addi sp,sp,40
	jr   ra

S:
        call SB
        call printf
        ld   ra,32(sp)
	ld   s0,24(sp)
	ld   s1,16(sp)
	ld   s2,8(sp)
	addi sp,sp,40
	jr   ra

M:
        call ML
        call printf
        ld   ra,32(sp)
	ld   s0,24(sp)
	ld   s1,16(sp)
	ld   s2,8(sp)
	addi sp,sp,40
	jr   ra
	
	
	
	
	

        
