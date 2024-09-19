	.file	"print.c"
	.option nopic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.section	.rodata
	
.str1:
	.string	"please inter the 10 numbers:\n"
	
.str2:
	.string	"%d"
	
.str3:
	.string	"result is:%d\n"
	
	


.text
.globl  main
.type   main, @function       

main:
        addi	sp,sp,-64
	sd	ra,56(sp)
	sd	s0,48(sp)
	sw	zero,44(sp)
	sw	zero,40(sp)
	addi	s0,sp,64
	lui     a0, %hi(.str1)
        addi    a0, a0, %lo(.str1)
        call	printf
        j       .A

.B:
        addi	a4,s0,-64
	lw	a5,-24(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	mv	a1,a5
        lui     a0, %hi(.str2)
        addi    a0, a0, %lo(.str2)
        call   __isoc99_scanf
        addi	a4,s0,-64
        lw      a5,-24(s0)
        slli    a5,a5,2
        add    a5,a4,a5
        lw      a2,(a5)
        sext.w    a1,a2
        lw      a5,-20(s0)
        addw    a5,a5,a1
        sw      a5,-20(s0)
        lw      a5,-24(s0)
        addiw   a5,a5,1
        sw      a5,-24(s0)
        j       .A
        
.A:
        lw      a5,-24(s0)
        sext.w	a4,a5
        li      a5,9
        ble     a4,a5,.B
        lw      a5,-20(s0)
        mv	a1,a5
        lui     a0, %hi(.str3)
        addi    a0, a0, %lo(.str3)
        call    printf
        li      a5,0
        mv      a0,a5
        ld	ra,56(sp)
	ld	s0,48(sp)
	addi    sp,sp,64
	jr      ra
	.size	main, .-main
  
        
        
 
        
        
        
