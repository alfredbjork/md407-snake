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
  15              		.file	"keypad.c"
  16              		.text
  17              	.Ltext0:
  18              		.cfi_sections	.debug_frame
  19              		.align	2
  20              		.global	keypad_init
  21              		.code	16
  22              		.thumb_func
  24              	keypad_init:
  25              	.LFB0:
  26              		.file 1 "Z:/Moplabb2/snake/keypad.c"
   1:Z:/Moplabb2/snake\keypad.c **** #define GPIO_D_BASE 0x40020C00
   2:Z:/Moplabb2/snake\keypad.c **** 
   3:Z:/Moplabb2/snake\keypad.c **** void keypad_init(void){
  27              		.loc 1 3 0
  28              		.cfi_startproc
  29 0000 80B5     		push	{r7, lr}
  30              		.cfi_def_cfa_offset 8
  31              		.cfi_offset 7, -8
  32              		.cfi_offset 14, -4
  33 0002 82B0     		sub	sp, sp, #8
  34              		.cfi_def_cfa_offset 16
  35 0004 00AF     		add	r7, sp, #0
  36              		.cfi_def_cfa_register 7
   4:Z:/Moplabb2/snake\keypad.c **** 	unsigned int *base_addr = GPIO_D_BASE;
  37              		.loc 1 4 0
  38 0006 0F4B     		ldr	r3, .L2
  39 0008 7B60     		str	r3, [r7, #4]
   5:Z:/Moplabb2/snake\keypad.c **** 	
   6:Z:/Moplabb2/snake\keypad.c **** 	// Setup GPIO D
   7:Z:/Moplabb2/snake\keypad.c **** 	// GPIO_MODER
   8:Z:/Moplabb2/snake\keypad.c **** 	*base_addr = 0x55005555 | (*base_addr & 0x00000000);
  40              		.loc 1 8 0
  41 000a 7B68     		ldr	r3, [r7, #4]
  42 000c 0E4A     		ldr	r2, .L2+4
  43 000e 1A60     		str	r2, [r3]
   9:Z:/Moplabb2/snake\keypad.c **** 	
  10:Z:/Moplabb2/snake\keypad.c **** 	// GPIO_OTYPER
  11:Z:/Moplabb2/snake\keypad.c **** 	*(base_addr + 1) = 0x00000F00 | (*(base_addr + 1) & 0x000000FF);
  44              		.loc 1 11 0
  45 0010 7B68     		ldr	r3, [r7, #4]
  46 0012 0433     		adds	r3, r3, #4
  47 0014 7A68     		ldr	r2, [r7, #4]
  48 0016 0432     		adds	r2, r2, #4
  49 0018 1268     		ldr	r2, [r2]
  50 001a FF21     		movs	r1, #255
  51 001c 0A40     		ands	r2, r1
  52 001e F021     		movs	r1, #240
  53 0020 0901     		lsls	r1, r1, #4
  54 0022 0A43     		orrs	r2, r1
  55 0024 1A60     		str	r2, [r3]
  12:Z:/Moplabb2/snake\keypad.c **** 	
  13:Z:/Moplabb2/snake\keypad.c **** 	// GPIO_PUPDR
  14:Z:/Moplabb2/snake\keypad.c **** 	*(base_addr + 3) = 0x00AA0000 | (*(base_addr + 3) & 0x0000FFFF);
  56              		.loc 1 14 0
  57 0026 7B68     		ldr	r3, [r7, #4]
  58 0028 0C33     		adds	r3, r3, #12
  59 002a 7A68     		ldr	r2, [r7, #4]
  60 002c 0C32     		adds	r2, r2, #12
  61 002e 1268     		ldr	r2, [r2]
  62 0030 1204     		lsls	r2, r2, #16
  63 0032 120C     		lsrs	r2, r2, #16
  64 0034 AA21     		movs	r1, #170
  65 0036 0904     		lsls	r1, r1, #16
  66 0038 0A43     		orrs	r2, r1
  67 003a 1A60     		str	r2, [r3]
  15:Z:/Moplabb2/snake\keypad.c **** }
  68              		.loc 1 15 0
  69 003c C046     		nop
  70 003e BD46     		mov	sp, r7
  71 0040 02B0     		add	sp, sp, #8
  72              		@ sp needed
  73 0042 80BD     		pop	{r7, pc}
  74              	.L3:
  75              		.align	2
  76              	.L2:
  77 0044 000C0240 		.word	1073875968
  78 0048 55550055 		.word	1426085205
  79              		.cfi_endproc
  80              	.LFE0:
  82              		.align	2
  83              		.global	activateRow
  84              		.code	16
  85              		.thumb_func
  87              	activateRow:
  88              	.LFB1:
  16:Z:/Moplabb2/snake\keypad.c **** 
  17:Z:/Moplabb2/snake\keypad.c **** void activateRow ( int row ){
  89              		.loc 1 17 0
  90              		.cfi_startproc
  91 004c 80B5     		push	{r7, lr}
  92              		.cfi_def_cfa_offset 8
  93              		.cfi_offset 7, -8
  94              		.cfi_offset 14, -4
  95 004e 84B0     		sub	sp, sp, #16
  96              		.cfi_def_cfa_offset 24
  97 0050 00AF     		add	r7, sp, #0
  98              		.cfi_def_cfa_register 7
  99 0052 7860     		str	r0, [r7, #4]
  18:Z:/Moplabb2/snake\keypad.c **** 	
  19:Z:/Moplabb2/snake\keypad.c **** 	// Outport
  20:Z:/Moplabb2/snake\keypad.c **** 	unsigned char *keyb_out = GPIO_D_BASE;
 100              		.loc 1 20 0
 101 0054 124B     		ldr	r3, .L12
 102 0056 FB60     		str	r3, [r7, #12]
  21:Z:/Moplabb2/snake\keypad.c **** 	keyb_out += 21;
 103              		.loc 1 21 0
 104 0058 FB68     		ldr	r3, [r7, #12]
 105 005a 1533     		adds	r3, r3, #21
 106 005c FB60     		str	r3, [r7, #12]
  22:Z:/Moplabb2/snake\keypad.c **** 	
  23:Z:/Moplabb2/snake\keypad.c **** 	switch (row + 1){
 107              		.loc 1 23 0
 108 005e 7B68     		ldr	r3, [r7, #4]
 109 0060 0133     		adds	r3, r3, #1
 110 0062 022B     		cmp	r3, #2
 111 0064 0CD0     		beq	.L6
 112 0066 02DC     		bgt	.L7
 113 0068 012B     		cmp	r3, #1
 114 006a 05D0     		beq	.L8
  24:Z:/Moplabb2/snake\keypad.c **** 		case 1:
  25:Z:/Moplabb2/snake\keypad.c **** 			*keyb_out = 0x10;
  26:Z:/Moplabb2/snake\keypad.c **** 			break;
  27:Z:/Moplabb2/snake\keypad.c **** 		
  28:Z:/Moplabb2/snake\keypad.c **** 		case 2:
  29:Z:/Moplabb2/snake\keypad.c **** 			*keyb_out = 0x20;
  30:Z:/Moplabb2/snake\keypad.c **** 			break;
  31:Z:/Moplabb2/snake\keypad.c **** 			
  32:Z:/Moplabb2/snake\keypad.c **** 		case 3:
  33:Z:/Moplabb2/snake\keypad.c **** 			*keyb_out = 0x40;
  34:Z:/Moplabb2/snake\keypad.c **** 			break;
  35:Z:/Moplabb2/snake\keypad.c **** 		
  36:Z:/Moplabb2/snake\keypad.c **** 		case 4:
  37:Z:/Moplabb2/snake\keypad.c **** 			*keyb_out = 0x80;
  38:Z:/Moplabb2/snake\keypad.c **** 			break;
  39:Z:/Moplabb2/snake\keypad.c **** 			
  40:Z:/Moplabb2/snake\keypad.c **** 		default:
  41:Z:/Moplabb2/snake\keypad.c **** 			break;
 115              		.loc 1 41 0
 116 006c 14E0     		b	.L11
 117              	.L7:
  23:Z:/Moplabb2/snake\keypad.c **** 		case 1:
 118              		.loc 1 23 0
 119 006e 032B     		cmp	r3, #3
 120 0070 0AD0     		beq	.L9
 121 0072 042B     		cmp	r3, #4
 122 0074 0CD0     		beq	.L10
 123              		.loc 1 41 0
 124 0076 0FE0     		b	.L11
 125              	.L8:
  25:Z:/Moplabb2/snake\keypad.c **** 			break;
 126              		.loc 1 25 0
 127 0078 FB68     		ldr	r3, [r7, #12]
 128 007a 1022     		movs	r2, #16
 129 007c 1A70     		strb	r2, [r3]
  26:Z:/Moplabb2/snake\keypad.c **** 		
 130              		.loc 1 26 0
 131 007e 0BE0     		b	.L11
 132              	.L6:
  29:Z:/Moplabb2/snake\keypad.c **** 			break;
 133              		.loc 1 29 0
 134 0080 FB68     		ldr	r3, [r7, #12]
 135 0082 2022     		movs	r2, #32
 136 0084 1A70     		strb	r2, [r3]
  30:Z:/Moplabb2/snake\keypad.c **** 			
 137              		.loc 1 30 0
 138 0086 07E0     		b	.L11
 139              	.L9:
  33:Z:/Moplabb2/snake\keypad.c **** 			break;
 140              		.loc 1 33 0
 141 0088 FB68     		ldr	r3, [r7, #12]
 142 008a 4022     		movs	r2, #64
 143 008c 1A70     		strb	r2, [r3]
  34:Z:/Moplabb2/snake\keypad.c **** 		
 144              		.loc 1 34 0
 145 008e 03E0     		b	.L11
 146              	.L10:
  37:Z:/Moplabb2/snake\keypad.c **** 			break;
 147              		.loc 1 37 0
 148 0090 FB68     		ldr	r3, [r7, #12]
 149 0092 8022     		movs	r2, #128
 150 0094 1A70     		strb	r2, [r3]
  38:Z:/Moplabb2/snake\keypad.c **** 			
 151              		.loc 1 38 0
 152 0096 C046     		nop
 153              	.L11:
  42:Z:/Moplabb2/snake\keypad.c **** 	}
  43:Z:/Moplabb2/snake\keypad.c **** }
 154              		.loc 1 43 0
 155 0098 C046     		nop
 156 009a BD46     		mov	sp, r7
 157 009c 04B0     		add	sp, sp, #16
 158              		@ sp needed
 159 009e 80BD     		pop	{r7, pc}
 160              	.L13:
 161              		.align	2
 162              	.L12:
 163 00a0 000C0240 		.word	1073875968
 164              		.cfi_endproc
 165              	.LFE1:
 167              		.align	2
 168              		.global	readColumn
 169              		.code	16
 170              		.thumb_func
 172              	readColumn:
 173              	.LFB2:
  44:Z:/Moplabb2/snake\keypad.c **** 
  45:Z:/Moplabb2/snake\keypad.c **** int readColumn( void ){
 174              		.loc 1 45 0
 175              		.cfi_startproc
 176 00a4 80B5     		push	{r7, lr}
 177              		.cfi_def_cfa_offset 8
 178              		.cfi_offset 7, -8
 179              		.cfi_offset 14, -4
 180 00a6 82B0     		sub	sp, sp, #8
 181              		.cfi_def_cfa_offset 16
 182 00a8 00AF     		add	r7, sp, #0
 183              		.cfi_def_cfa_register 7
  46:Z:/Moplabb2/snake\keypad.c **** 	
  47:Z:/Moplabb2/snake\keypad.c **** 	// Inport
  48:Z:/Moplabb2/snake\keypad.c **** 	unsigned char *keyb_in = GPIO_D_BASE;
 184              		.loc 1 48 0
 185 00aa 154B     		ldr	r3, .L20
 186 00ac 7B60     		str	r3, [r7, #4]
  49:Z:/Moplabb2/snake\keypad.c **** 	keyb_in += 17;
 187              		.loc 1 49 0
 188 00ae 7B68     		ldr	r3, [r7, #4]
 189 00b0 1133     		adds	r3, r3, #17
 190 00b2 7B60     		str	r3, [r7, #4]
  50:Z:/Moplabb2/snake\keypad.c **** 	
  51:Z:/Moplabb2/snake\keypad.c **** 	unsigned short in_val = *keyb_in;
 191              		.loc 1 51 0
 192 00b4 7B68     		ldr	r3, [r7, #4]
 193 00b6 1A78     		ldrb	r2, [r3]
 194 00b8 BB1C     		adds	r3, r7, #2
 195 00ba 1A80     		strh	r2, [r3]
  52:Z:/Moplabb2/snake\keypad.c **** 	
  53:Z:/Moplabb2/snake\keypad.c **** 	if (in_val & 0x01){
 196              		.loc 1 53 0
 197 00bc BB1C     		adds	r3, r7, #2
 198 00be 1B88     		ldrh	r3, [r3]
 199 00c0 0122     		movs	r2, #1
 200 00c2 1340     		ands	r3, r2
 201 00c4 01D0     		beq	.L15
  54:Z:/Moplabb2/snake\keypad.c **** 		return 1;
 202              		.loc 1 54 0
 203 00c6 0123     		movs	r3, #1
 204 00c8 15E0     		b	.L16
 205              	.L15:
  55:Z:/Moplabb2/snake\keypad.c **** 	}
  56:Z:/Moplabb2/snake\keypad.c **** 	
  57:Z:/Moplabb2/snake\keypad.c **** 	if (in_val & 0x02){
 206              		.loc 1 57 0
 207 00ca BB1C     		adds	r3, r7, #2
 208 00cc 1B88     		ldrh	r3, [r3]
 209 00ce 0222     		movs	r2, #2
 210 00d0 1340     		ands	r3, r2
 211 00d2 01D0     		beq	.L17
  58:Z:/Moplabb2/snake\keypad.c **** 		return 2;
 212              		.loc 1 58 0
 213 00d4 0223     		movs	r3, #2
 214 00d6 0EE0     		b	.L16
 215              	.L17:
  59:Z:/Moplabb2/snake\keypad.c **** 	}
  60:Z:/Moplabb2/snake\keypad.c **** 	
  61:Z:/Moplabb2/snake\keypad.c **** 	if (in_val & 0x04){
 216              		.loc 1 61 0
 217 00d8 BB1C     		adds	r3, r7, #2
 218 00da 1B88     		ldrh	r3, [r3]
 219 00dc 0422     		movs	r2, #4
 220 00de 1340     		ands	r3, r2
 221 00e0 01D0     		beq	.L18
  62:Z:/Moplabb2/snake\keypad.c **** 		return 3;
 222              		.loc 1 62 0
 223 00e2 0323     		movs	r3, #3
 224 00e4 07E0     		b	.L16
 225              	.L18:
  63:Z:/Moplabb2/snake\keypad.c **** 	}
  64:Z:/Moplabb2/snake\keypad.c **** 	
  65:Z:/Moplabb2/snake\keypad.c **** 	if (in_val & 0x08){
 226              		.loc 1 65 0
 227 00e6 BB1C     		adds	r3, r7, #2
 228 00e8 1B88     		ldrh	r3, [r3]
 229 00ea 0822     		movs	r2, #8
 230 00ec 1340     		ands	r3, r2
 231 00ee 01D0     		beq	.L19
  66:Z:/Moplabb2/snake\keypad.c **** 		return 4;
 232              		.loc 1 66 0
 233 00f0 0423     		movs	r3, #4
 234 00f2 00E0     		b	.L16
 235              	.L19:
  67:Z:/Moplabb2/snake\keypad.c **** 	}
  68:Z:/Moplabb2/snake\keypad.c **** 	
  69:Z:/Moplabb2/snake\keypad.c **** 	return 0;
 236              		.loc 1 69 0
 237 00f4 0023     		movs	r3, #0
 238              	.L16:
  70:Z:/Moplabb2/snake\keypad.c **** 	
  71:Z:/Moplabb2/snake\keypad.c **** }
 239              		.loc 1 71 0
 240 00f6 1800     		movs	r0, r3
 241 00f8 BD46     		mov	sp, r7
 242 00fa 02B0     		add	sp, sp, #8
 243              		@ sp needed
 244 00fc 80BD     		pop	{r7, pc}
 245              	.L21:
 246 00fe C046     		.align	2
 247              	.L20:
 248 0100 000C0240 		.word	1073875968
 249              		.cfi_endproc
 250              	.LFE2:
 252              		.align	2
 253              		.global	keyb
 254              		.code	16
 255              		.thumb_func
 257              	keyb:
 258              	.LFB3:
  72:Z:/Moplabb2/snake\keypad.c **** 
  73:Z:/Moplabb2/snake\keypad.c **** unsigned char keyb( void ){
 259              		.loc 1 73 0
 260              		.cfi_startproc
 261 0104 80B5     		push	{r7, lr}
 262              		.cfi_def_cfa_offset 8
 263              		.cfi_offset 7, -8
 264              		.cfi_offset 14, -4
 265 0106 82B0     		sub	sp, sp, #8
 266              		.cfi_def_cfa_offset 16
 267 0108 00AF     		add	r7, sp, #0
 268              		.cfi_def_cfa_register 7
 269              	.LBB2:
  74:Z:/Moplabb2/snake\keypad.c **** 	
  75:Z:/Moplabb2/snake\keypad.c **** 	// Keyvalues based on row and column. keyValue[row][column]
  76:Z:/Moplabb2/snake\keypad.c **** 	static char keyValue[4][4] = {
  77:Z:/Moplabb2/snake\keypad.c **** 		{1,2,3,10},
  78:Z:/Moplabb2/snake\keypad.c **** 		{4,5,6,11},
  79:Z:/Moplabb2/snake\keypad.c **** 		{7,8,9,12},
  80:Z:/Moplabb2/snake\keypad.c **** 		{14,0,15,13}
  81:Z:/Moplabb2/snake\keypad.c **** 	};
  82:Z:/Moplabb2/snake\keypad.c **** 	
  83:Z:/Moplabb2/snake\keypad.c **** 	// Loop through every row of keys
  84:Z:/Moplabb2/snake\keypad.c **** 	for (int i = 0; i < 4; i++){
 270              		.loc 1 84 0
 271 010a 0023     		movs	r3, #0
 272 010c 7B60     		str	r3, [r7, #4]
 273 010e 15E0     		b	.L23
 274              	.L26:
 275              	.LBB3:
  85:Z:/Moplabb2/snake\keypad.c **** 		activateRow( i );
 276              		.loc 1 85 0
 277 0110 7B68     		ldr	r3, [r7, #4]
 278 0112 1800     		movs	r0, r3
 279 0114 FFF7FEFF 		bl	activateRow
  86:Z:/Moplabb2/snake\keypad.c **** 		int column = readColumn();
 280              		.loc 1 86 0
 281 0118 FFF7FEFF 		bl	readColumn
 282 011c 0300     		movs	r3, r0
 283 011e 3B60     		str	r3, [r7]
  87:Z:/Moplabb2/snake\keypad.c **** 		if (column != 0){
 284              		.loc 1 87 0
 285 0120 3B68     		ldr	r3, [r7]
 286 0122 002B     		cmp	r3, #0
 287 0124 07D0     		beq	.L24
  88:Z:/Moplabb2/snake\keypad.c **** 			return keyValue[i][column - 1];
 288              		.loc 1 88 0
 289 0126 3B68     		ldr	r3, [r7]
 290 0128 013B     		subs	r3, r3, #1
 291 012a 0849     		ldr	r1, .L27
 292 012c 7A68     		ldr	r2, [r7, #4]
 293 012e 9200     		lsls	r2, r2, #2
 294 0130 8A18     		adds	r2, r1, r2
 295 0132 D35C     		ldrb	r3, [r2, r3]
 296 0134 06E0     		b	.L25
 297              	.L24:
 298              	.LBE3:
  84:Z:/Moplabb2/snake\keypad.c **** 		activateRow( i );
 299              		.loc 1 84 0 discriminator 2
 300 0136 7B68     		ldr	r3, [r7, #4]
 301 0138 0133     		adds	r3, r3, #1
 302 013a 7B60     		str	r3, [r7, #4]
 303              	.L23:
  84:Z:/Moplabb2/snake\keypad.c **** 		activateRow( i );
 304              		.loc 1 84 0 is_stmt 0 discriminator 1
 305 013c 7B68     		ldr	r3, [r7, #4]
 306 013e 032B     		cmp	r3, #3
 307 0140 E6DD     		ble	.L26
 308              	.LBE2:
  89:Z:/Moplabb2/snake\keypad.c **** 		}
  90:Z:/Moplabb2/snake\keypad.c **** 	}
  91:Z:/Moplabb2/snake\keypad.c **** 	
  92:Z:/Moplabb2/snake\keypad.c **** 	// No key pressed
  93:Z:/Moplabb2/snake\keypad.c **** 	return 0xFF;
 309              		.loc 1 93 0 is_stmt 1
 310 0142 FF23     		movs	r3, #255
 311              	.L25:
  94:Z:/Moplabb2/snake\keypad.c **** }
 312              		.loc 1 94 0
 313 0144 1800     		movs	r0, r3
 314 0146 BD46     		mov	sp, r7
 315 0148 02B0     		add	sp, sp, #8
 316              		@ sp needed
 317 014a 80BD     		pop	{r7, pc}
 318              	.L28:
 319              		.align	2
 320              	.L27:
 321 014c 00000000 		.word	keyValue.4185
 322              		.cfi_endproc
 323              	.LFE3:
 325              		.align	2
 326              		.global	out7seg
 327              		.code	16
 328              		.thumb_func
 330              	out7seg:
 331              	.LFB4:
  95:Z:/Moplabb2/snake\keypad.c **** 
  96:Z:/Moplabb2/snake\keypad.c **** void out7seg( unsigned char c ){
 332              		.loc 1 96 0
 333              		.cfi_startproc
 334 0150 80B5     		push	{r7, lr}
 335              		.cfi_def_cfa_offset 8
 336              		.cfi_offset 7, -8
 337              		.cfi_offset 14, -4
 338 0152 84B0     		sub	sp, sp, #16
 339              		.cfi_def_cfa_offset 24
 340 0154 00AF     		add	r7, sp, #0
 341              		.cfi_def_cfa_register 7
 342 0156 0200     		movs	r2, r0
 343 0158 FB1D     		adds	r3, r7, #7
 344 015a 1A70     		strb	r2, [r3]
  97:Z:/Moplabb2/snake\keypad.c **** 	
  98:Z:/Moplabb2/snake\keypad.c **** 	static char segCodes [16] = {0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F,0x77,0x7C,0x39,0x5E
  99:Z:/Moplabb2/snake\keypad.c **** 	
 100:Z:/Moplabb2/snake\keypad.c **** 	// Outport
 101:Z:/Moplabb2/snake\keypad.c **** 	unsigned char *disp_out = GPIO_D_BASE;
 345              		.loc 1 101 0
 346 015c 0B4B     		ldr	r3, .L33
 347 015e FB60     		str	r3, [r7, #12]
 102:Z:/Moplabb2/snake\keypad.c **** 	disp_out += 20;
 348              		.loc 1 102 0
 349 0160 FB68     		ldr	r3, [r7, #12]
 350 0162 1433     		adds	r3, r3, #20
 351 0164 FB60     		str	r3, [r7, #12]
 103:Z:/Moplabb2/snake\keypad.c **** 	
 104:Z:/Moplabb2/snake\keypad.c **** 	if (c > 15){
 352              		.loc 1 104 0
 353 0166 FB1D     		adds	r3, r7, #7
 354 0168 1B78     		ldrb	r3, [r3]
 355 016a 0F2B     		cmp	r3, #15
 356 016c 03D9     		bls	.L30
 105:Z:/Moplabb2/snake\keypad.c **** 		*disp_out = 0;
 357              		.loc 1 105 0
 358 016e FB68     		ldr	r3, [r7, #12]
 359 0170 0022     		movs	r2, #0
 360 0172 1A70     		strb	r2, [r3]
 106:Z:/Moplabb2/snake\keypad.c **** 	}else{
 107:Z:/Moplabb2/snake\keypad.c **** 		*disp_out = segCodes[c];
 108:Z:/Moplabb2/snake\keypad.c **** 	}
 109:Z:/Moplabb2/snake\keypad.c **** }...
 361              		.loc 1 109 0
 362 0174 05E0     		b	.L32
 363              	.L30:
 107:Z:/Moplabb2/snake\keypad.c **** 		*disp_out = segCodes[c];
 364              		.loc 1 107 0
 365 0176 FB1D     		adds	r3, r7, #7
 366 0178 1B78     		ldrb	r3, [r3]
 367 017a 054A     		ldr	r2, .L33+4
 368 017c D25C     		ldrb	r2, [r2, r3]
 369 017e FB68     		ldr	r3, [r7, #12]
 370 0180 1A70     		strb	r2, [r3]
 371              	.L32:
 372              		.loc 1 109 0
 373 0182 C046     		nop
 374 0184 BD46     		mov	sp, r7
 375 0186 04B0     		add	sp, sp, #16
 376              		@ sp needed
 377 0188 80BD     		pop	{r7, pc}
 378              	.L34:
 379 018a C046     		.align	2
 380              	.L33:
 381 018c 000C0240 		.word	1073875968
 382 0190 10000000 		.word	segCodes.4194
 383              		.cfi_endproc
 384              	.LFE4:
 386              		.data
 387              		.align	2
 390              	keyValue.4185:
 391 0000 01       		.byte	1
 392 0001 02       		.byte	2
 393 0002 03       		.byte	3
 394 0003 0A       		.byte	10
 395 0004 04       		.byte	4
 396 0005 05       		.byte	5
 397 0006 06       		.byte	6
 398 0007 0B       		.byte	11
 399 0008 07       		.byte	7
 400 0009 08       		.byte	8
 401 000a 09       		.byte	9
 402 000b 0C       		.byte	12
 403 000c 0E       		.byte	14
 404 000d 00       		.byte	0
 405 000e 0F       		.byte	15
 406 000f 0D       		.byte	13
 407              		.align	2
 410              	segCodes.4194:
 411 0010 3F       		.byte	63
 412 0011 06       		.byte	6
 413 0012 5B       		.byte	91
 414 0013 4F       		.byte	79
 415 0014 66       		.byte	102
 416 0015 6D       		.byte	109
 417 0016 7D       		.byte	125
 418 0017 07       		.byte	7
 419 0018 7F       		.byte	127
 420 0019 6F       		.byte	111
 421 001a 77       		.byte	119
 422 001b 7C       		.byte	124
 423 001c 39       		.byte	57
 424 001d 5E       		.byte	94
 425 001e 79       		.byte	121
 426 001f 71       		.byte	113
 427              		.text
 428              	.Letext0:
