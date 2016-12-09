   1              		.syntax unified
   2              		.arch armv6-m
   3              		.fpu softvfp
   4              		.eabi_attribute 20, 1
   5              		.eabi_attribute 21, 1
   6              		.eabi_attribute 23, 3
   7              		.eabi_attribute 24, 1
   8              		.eabi_attribute 25, 1
   9              		.eabi_attribute 26, 1
  10              		.eabi_attribute 30, 6
  11              		.eabi_attribute 34, 0
  12              		.eabi_attribute 18, 4
  13              		.thumb
  14              		.syntax unified
  15              		.file	"startup.c"
  16              		.text
  17              	.Ltext0:
  18              		.cfi_sections	.debug_frame
  19              		.section	.start_section,"ax",%progbits
  20              		.align	2
  21              		.global	startup
  22              		.code	16
  23              		.thumb_func
  25              	startup:
  26              	.LFB0:
  27              		.file 1 "/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c"
   1:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** /*
   2:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c ****  * 	startup.c
   3:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c ****  *
   4:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c ****  */
   5:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** #include <logic.h>
   6:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** #include <keypad.h>
   7:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 
   8:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   9:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 
  10:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** void startup ( void )
  11:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** {
  28              		.loc 1 11 0
  29              		.cfi_startproc
  30              		@ Naked Function: prologue and epilogue provided by programmer.
  31              		@ args = 0, pretend = 0, frame = 0
  32              		@ frame_needed = 1, uses_anonymous_args = 0
  12:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** __asm volatile(
  33              		.loc 1 12 0
  34              		.syntax divided
  35              	@ 12 "/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c" 1
  36 0000 0248     		 LDR R0,=0x2001C000
  37 0002 8546     	 MOV SP,R0
  38 0004 FFF7FEFF 	 BL main
  39 0008 FEE7     	.L1: B .L1
  40              	
  41              	@ 0 "" 2
  13:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  14:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 	" MOV SP,R0\n"
  15:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 	" BL main\n"				/* call main */
  16:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 	".L1: B .L1\n"				/* never return */
  17:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 	) ;
  18:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** }
  42              		.loc 1 18 0
  43              		.thumb
  44              		.syntax unified
  45 000a C046     		nop
  46              		.cfi_endproc
  47              	.LFE0:
  49              		.text
  50              		.align	2
  51              		.global	updateDir
  52              		.code	16
  53              		.thumb_func
  55              	updateDir:
  56              	.LFB1:
  19:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 
  20:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** void updateDir(PSNAKE o){
  57              		.loc 1 20 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 16
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 90B5     		push	{r4, r7, lr}
  62              		.cfi_def_cfa_offset 12
  63              		.cfi_offset 4, -12
  64              		.cfi_offset 7, -8
  65              		.cfi_offset 14, -4
  66 0002 85B0     		sub	sp, sp, #20
  67              		.cfi_def_cfa_offset 32
  68 0004 00AF     		add	r7, sp, #0
  69              		.cfi_def_cfa_register 7
  70 0006 7860     		str	r0, [r7, #4]
  21:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 	unsigned char key = keyb();
  71              		.loc 1 21 0
  72 0008 0F23     		movs	r3, #15
  73 000a FC18     		adds	r4, r7, r3
  74 000c FFF7FEFF 		bl	keyb
  75 0010 0300     		movs	r3, r0
  76 0012 2370     		strb	r3, [r4]
  22:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 	
  23:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 	switch (key){
  77              		.loc 1 23 0
  78 0014 0F23     		movs	r3, #15
  79 0016 FB18     		adds	r3, r7, r3
  80 0018 1B78     		ldrb	r3, [r3]
  81 001a 042B     		cmp	r3, #4
  82 001c 10D0     		beq	.L4
  83 001e 02DC     		bgt	.L5
  84 0020 022B     		cmp	r3, #2
  85 0022 05D0     		beq	.L6
  24:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 		case 2:
  25:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 			o->set_speed(o, 0, -1);
  26:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 			break;
  27:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 		
  28:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 		case 4:
  29:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 			o->set_speed(o, -1, 0);
  30:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 			break;
  31:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 			
  32:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 		case 6:
  33:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 			o->set_speed(o, 1, 0);
  34:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 			break;
  35:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 			
  36:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 		case 8:
  37:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 			o->set_speed(o, 0, 1);
  38:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 			break;
  39:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 	}
  40:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** }
  86              		.loc 1 40 0
  87 0024 22E0     		b	.L9
  88              	.L5:
  23:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 		case 2:
  89              		.loc 1 23 0
  90 0026 062B     		cmp	r3, #6
  91 0028 12D0     		beq	.L7
  92 002a 082B     		cmp	r3, #8
  93 002c 17D0     		beq	.L8
  94              		.loc 1 40 0
  95 002e 1DE0     		b	.L9
  96              	.L6:
  25:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 			break;
  97              		.loc 1 25 0
  98 0030 7B68     		ldr	r3, [r7, #4]
  99 0032 DB69     		ldr	r3, [r3, #28]
 100 0034 0122     		movs	r2, #1
 101 0036 5242     		rsbs	r2, r2, #0
 102 0038 7868     		ldr	r0, [r7, #4]
 103 003a 0021     		movs	r1, #0
 104 003c 9847     		blx	r3
  26:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 		
 105              		.loc 1 26 0
 106 003e 15E0     		b	.L3
 107              	.L4:
  29:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 			break;
 108              		.loc 1 29 0
 109 0040 7B68     		ldr	r3, [r7, #4]
 110 0042 DB69     		ldr	r3, [r3, #28]
 111 0044 0122     		movs	r2, #1
 112 0046 5142     		rsbs	r1, r2, #0
 113 0048 7868     		ldr	r0, [r7, #4]
 114 004a 0022     		movs	r2, #0
 115 004c 9847     		blx	r3
  30:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 			
 116              		.loc 1 30 0
 117 004e 0DE0     		b	.L3
 118              	.L7:
  33:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 			break;
 119              		.loc 1 33 0
 120 0050 7B68     		ldr	r3, [r7, #4]
 121 0052 DB69     		ldr	r3, [r3, #28]
 122 0054 7868     		ldr	r0, [r7, #4]
 123 0056 0022     		movs	r2, #0
 124 0058 0121     		movs	r1, #1
 125 005a 9847     		blx	r3
  34:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 			
 126              		.loc 1 34 0
 127 005c 06E0     		b	.L3
 128              	.L8:
  37:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 			break;
 129              		.loc 1 37 0
 130 005e 7B68     		ldr	r3, [r7, #4]
 131 0060 DB69     		ldr	r3, [r3, #28]
 132 0062 7868     		ldr	r0, [r7, #4]
 133 0064 0122     		movs	r2, #1
 134 0066 0021     		movs	r1, #0
 135 0068 9847     		blx	r3
  38:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 	}
 136              		.loc 1 38 0
 137 006a C046     		nop
 138              	.L3:
 139              	.L9:
 140              		.loc 1 40 0
 141 006c C046     		nop
 142 006e BD46     		mov	sp, r7
 143 0070 05B0     		add	sp, sp, #20
 144              		@ sp needed
 145 0072 90BD     		pop	{r4, r7, pc}
 146              		.cfi_endproc
 147              	.LFE1:
 149              		.section	.rodata
 150              		.align	2
 151              	.LC0:
 152 0000 04000000 		.word	4
 153 0004 02000000 		.word	2
 154 0008 02000000 		.word	2
 155 000c 00       		.byte	0
 156 000d 00       		.byte	0
 157 000e 00       		.byte	0
 158 000f 01       		.byte	1
 159 0010 01       		.byte	1
 160 0011 00       		.byte	0
 161 0012 01       		.byte	1
 162 0013 01       		.byte	1
 163              		.text
 164              		.align	2
 165              		.global	main
 166              		.code	16
 167              		.thumb_func
 169              	main:
 170              	.LFB2:
  41:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 
  42:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** void main(void){
 171              		.loc 1 42 0
 172              		.cfi_startproc
 173              		@ args = 0, pretend = 0, frame = 104
 174              		@ frame_needed = 1, uses_anonymous_args = 0
 175 0074 90B5     		push	{r4, r7, lr}
 176              		.cfi_def_cfa_offset 12
 177              		.cfi_offset 4, -12
 178              		.cfi_offset 7, -8
 179              		.cfi_offset 14, -4
 180 0076 9BB0     		sub	sp, sp, #108
 181              		.cfi_def_cfa_offset 120
 182 0078 00AF     		add	r7, sp, #0
 183              		.cfi_def_cfa_register 7
  43:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 	
  44:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 	graphic_IO_init();
 184              		.loc 1 44 0
 185 007a FFF7FEFF 		bl	graphic_IO_init
  45:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 	
  46:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 	graphic_initalize();
 186              		.loc 1 46 0
 187 007e FFF7FEFF 		bl	graphic_initalize
  47:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 	
  48:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 	#ifndef SIMULATOR
  49:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 		graphic_clearScreen();
 188              		.loc 1 49 0
 189 0082 FFF7FEFF 		bl	graphic_clearScreen
  50:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 	#endif
  51:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 	
  52:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 	keypad_init();
 190              		.loc 1 52 0
 191 0086 FFF7FEFF 		bl	keypad_init
  53:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 	
  54:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 	GEOMETRY dot_geometry = {
 192              		.loc 1 54 0
 193 008a 5423     		movs	r3, #84
 194 008c FB18     		adds	r3, r7, r3
 195 008e 2A4A     		ldr	r2, .L12
 196 0090 13CA     		ldmia	r2!, {r0, r1, r4}
 197 0092 13C3     		stmia	r3!, {r0, r1, r4}
 198 0094 03CA     		ldmia	r2!, {r0, r1}
 199 0096 03C3     		stmia	r3!, {r0, r1}
  55:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 		4,
  56:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 		2,2,
  57:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 		{
  58:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 			{0,0}, {0,1}, {1,0}, {1,1}
  59:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 		}
  60:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 	};
  61:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 	
  62:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 	BODY body = {
 200              		.loc 1 62 0
 201 0098 2423     		movs	r3, #36
 202 009a FB18     		adds	r3, r7, r3
 203 009c 1800     		movs	r0, r3
 204 009e 3023     		movs	r3, #48
 205 00a0 1A00     		movs	r2, r3
 206 00a2 0021     		movs	r1, #0
 207 00a4 FFF7FEFF 		bl	memset
 208 00a8 2423     		movs	r3, #36
 209 00aa FB18     		adds	r3, r7, r3
 210 00ac 5422     		movs	r2, #84
 211 00ae BA18     		adds	r2, r7, r2
 212 00b0 1A60     		str	r2, [r3]
 213 00b2 2423     		movs	r3, #36
 214 00b4 FB18     		adds	r3, r7, r3
 215 00b6 0222     		movs	r2, #2
 216 00b8 5A60     		str	r2, [r3, #4]
 217 00ba 2423     		movs	r3, #36
 218 00bc FB18     		adds	r3, r7, r3
 219 00be 0522     		movs	r2, #5
 220 00c0 1A72     		strb	r2, [r3, #8]
 221 00c2 2423     		movs	r3, #36
 222 00c4 FB18     		adds	r3, r7, r3
 223 00c6 0522     		movs	r2, #5
 224 00c8 5A72     		strb	r2, [r3, #9]
 225 00ca 2423     		movs	r3, #36
 226 00cc FB18     		adds	r3, r7, r3
 227 00ce 0522     		movs	r2, #5
 228 00d0 9A72     		strb	r2, [r3, #10]
 229 00d2 2423     		movs	r3, #36
 230 00d4 FB18     		adds	r3, r7, r3
 231 00d6 0422     		movs	r2, #4
 232 00d8 DA72     		strb	r2, [r3, #11]
  63:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 		&dot_geometry,		// Geometry for ball
  64:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 		2,					// Initial body size
  65:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 		{{5,5},{5,4}}		// Initital body pos
  66:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 	};
  67:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 
  68:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 	SNAKE snake = {
 233              		.loc 1 68 0
 234 00da 3B1D     		adds	r3, r7, #4
 235 00dc 0022     		movs	r2, #0
 236 00de 1A60     		str	r2, [r3]
 237 00e0 3B1D     		adds	r3, r7, #4
 238 00e2 0122     		movs	r2, #1
 239 00e4 5A60     		str	r2, [r3, #4]
 240 00e6 3B1D     		adds	r3, r7, #4
 241 00e8 2422     		movs	r2, #36
 242 00ea BA18     		adds	r2, r7, r2
 243 00ec 9A60     		str	r2, [r3, #8]
 244 00ee 3B1D     		adds	r3, r7, #4
 245 00f0 0122     		movs	r2, #1
 246 00f2 1A73     		strb	r2, [r3, #12]
 247 00f4 3B1D     		adds	r3, r7, #4
 248 00f6 114A     		ldr	r2, .L12+4
 249 00f8 1A61     		str	r2, [r3, #16]
 250 00fa 3B1D     		adds	r3, r7, #4
 251 00fc 104A     		ldr	r2, .L12+8
 252 00fe 5A61     		str	r2, [r3, #20]
 253 0100 3B1D     		adds	r3, r7, #4
 254 0102 104A     		ldr	r2, .L12+12
 255 0104 9A61     		str	r2, [r3, #24]
 256 0106 3B1D     		adds	r3, r7, #4
 257 0108 0F4A     		ldr	r2, .L12+16
 258 010a DA61     		str	r2, [r3, #28]
  69:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 		0,1,				// Initial direction
  70:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 		&body, 				// Snake body
  71:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 		true,				// Snake is alive
  72:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 		draw_object,
  73:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 		clear_object,
  74:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 		move_object,
  75:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 		set_object_speed
  76:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 	};
  77:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 	
  78:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 	// Draw initial snake
  79:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 	snake.draw(&snake);
 259              		.loc 1 79 0
 260 010c 3B1D     		adds	r3, r7, #4
 261 010e 1B69     		ldr	r3, [r3, #16]
 262 0110 3A1D     		adds	r2, r7, #4
 263 0112 1000     		movs	r0, r2
 264 0114 9847     		blx	r3
 265              	.L11:
  80:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 	
  81:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 	// Gameloop
  82:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 	while(1){
  83:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 		updateDir(&snake);
 266              		.loc 1 83 0 discriminator 1
 267 0116 3B1D     		adds	r3, r7, #4
 268 0118 1800     		movs	r0, r3
 269 011a FFF7FEFF 		bl	updateDir
  84:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 		snake.move(&snake);
 270              		.loc 1 84 0 discriminator 1
 271 011e 3B1D     		adds	r3, r7, #4
 272 0120 9B69     		ldr	r3, [r3, #24]
 273 0122 3A1D     		adds	r2, r7, #4
 274 0124 1000     		movs	r0, r2
 275 0126 9847     		blx	r3
  85:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 		snake.body->body_size += 1;
 276              		.loc 1 85 0 discriminator 1
 277 0128 3B1D     		adds	r3, r7, #4
 278 012a 9B68     		ldr	r3, [r3, #8]
 279 012c 3A1D     		adds	r2, r7, #4
 280 012e 9268     		ldr	r2, [r2, #8]
 281 0130 5268     		ldr	r2, [r2, #4]
 282 0132 0132     		adds	r2, r2, #1
 283 0134 5A60     		str	r2, [r3, #4]
  86:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/startup.c **** 	}
 284              		.loc 1 86 0 discriminator 1
 285 0136 EEE7     		b	.L11
 286              	.L13:
 287              		.align	2
 288              	.L12:
 289 0138 00000000 		.word	.LC0
 290 013c 00000000 		.word	draw_object
 291 0140 00000000 		.word	clear_object
 292 0144 00000000 		.word	move_object
 293 0148 00000000 		.word	set_object_speed
 294              		.cfi_endproc
 295              	.LFE2:
 297              	.Letext0:
 298              		.file 2 "./logic.h"
