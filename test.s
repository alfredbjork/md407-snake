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
  15              		.file	"logic.c"
  16              		.text
  17              	.Ltext0:
  18              		.cfi_sections	.debug_frame
  19              		.align	2
  20              		.global	set_object_speed
  21              		.code	16
  22              		.thumb_func
  24              	set_object_speed:
  25              	.LFB0:
  26              		.file 1 "/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c"
   1:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** #include <logic.h>
   2:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 
   3:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** void set_object_speed(PSNAKE o, int speedx, int speedy){
  27              		.loc 1 3 0
  28              		.cfi_startproc
  29              		@ args = 0, pretend = 0, frame = 16
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  31 0000 80B5     		push	{r7, lr}
  32              		.cfi_def_cfa_offset 8
  33              		.cfi_offset 7, -8
  34              		.cfi_offset 14, -4
  35 0002 84B0     		sub	sp, sp, #16
  36              		.cfi_def_cfa_offset 24
  37 0004 00AF     		add	r7, sp, #0
  38              		.cfi_def_cfa_register 7
  39 0006 F860     		str	r0, [r7, #12]
  40 0008 B960     		str	r1, [r7, #8]
  41 000a 7A60     		str	r2, [r7, #4]
   4:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	o->dirx = speedx;
  42              		.loc 1 4 0
  43 000c FB68     		ldr	r3, [r7, #12]
  44 000e BA68     		ldr	r2, [r7, #8]
  45 0010 1A60     		str	r2, [r3]
   5:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	o->diry = speedy;
  46              		.loc 1 5 0
  47 0012 FB68     		ldr	r3, [r7, #12]
  48 0014 7A68     		ldr	r2, [r7, #4]
  49 0016 5A60     		str	r2, [r3, #4]
   6:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** }
  50              		.loc 1 6 0
  51 0018 C046     		nop
  52 001a BD46     		mov	sp, r7
  53 001c 04B0     		add	sp, sp, #16
  54              		@ sp needed
  55 001e 80BD     		pop	{r7, pc}
  56              		.cfi_endproc
  57              	.LFE0:
  59              		.align	2
  60              		.global	draw_position
  61              		.code	16
  62              		.thumb_func
  64              	draw_position:
  65              	.LFB1:
   7:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 
   8:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** void draw_position(int pos, PSNAKE o){
  66              		.loc 1 8 0
  67              		.cfi_startproc
  68              		@ args = 0, pretend = 0, frame = 16
  69              		@ frame_needed = 1, uses_anonymous_args = 0
  70 0020 80B5     		push	{r7, lr}
  71              		.cfi_def_cfa_offset 8
  72              		.cfi_offset 7, -8
  73              		.cfi_offset 14, -4
  74 0022 84B0     		sub	sp, sp, #16
  75              		.cfi_def_cfa_offset 24
  76 0024 00AF     		add	r7, sp, #0
  77              		.cfi_def_cfa_register 7
  78 0026 7860     		str	r0, [r7, #4]
  79 0028 3960     		str	r1, [r7]
  80              	.LBB2:
   9:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	unsigned char x;
  10:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	unsigned char y;
  11:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	
  12:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	// Loop through dots on position
  13:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	for (int j = 0; j < o->body->tile->numpoints; j++){
  81              		.loc 1 13 0
  82 002a 0023     		movs	r3, #0
  83 002c FB60     		str	r3, [r7, #12]
  84 002e 46E0     		b	.L3
  85              	.L4:
  86              	.LBB3:
  14:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 		x = (o->body->positions[pos].x * o->body->tile->sizex) - 1 + o->body->tile->px[j].x;
  87              		.loc 1 14 0 discriminator 3
  88 0030 3B68     		ldr	r3, [r7]
  89 0032 9B68     		ldr	r3, [r3, #8]
  90 0034 7A68     		ldr	r2, [r7, #4]
  91 0036 0432     		adds	r2, r2, #4
  92 0038 5200     		lsls	r2, r2, #1
  93 003a D25C     		ldrb	r2, [r2, r3]
  94 003c 3B68     		ldr	r3, [r7]
  95 003e 9B68     		ldr	r3, [r3, #8]
  96 0040 1B68     		ldr	r3, [r3]
  97 0042 5B68     		ldr	r3, [r3, #4]
  98 0044 DBB2     		uxtb	r3, r3
  99 0046 5343     		muls	r3, r2
 100 0048 DAB2     		uxtb	r2, r3
 101 004a 3B68     		ldr	r3, [r7]
 102 004c 9B68     		ldr	r3, [r3, #8]
 103 004e 1968     		ldr	r1, [r3]
 104 0050 FB68     		ldr	r3, [r7, #12]
 105 0052 0433     		adds	r3, r3, #4
 106 0054 5B00     		lsls	r3, r3, #1
 107 0056 CB18     		adds	r3, r1, r3
 108 0058 0433     		adds	r3, r3, #4
 109 005a 1B78     		ldrb	r3, [r3]
 110 005c D318     		adds	r3, r2, r3
 111 005e DAB2     		uxtb	r2, r3
 112 0060 0B23     		movs	r3, #11
 113 0062 FB18     		adds	r3, r7, r3
 114 0064 013A     		subs	r2, r2, #1
 115 0066 1A70     		strb	r2, [r3]
  15:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 		y = (o->body->positions[pos].y * o->body->tile->sizey) - 1 + o->body->tile->px[j].y;
 116              		.loc 1 15 0 discriminator 3
 117 0068 3B68     		ldr	r3, [r7]
 118 006a 9A68     		ldr	r2, [r3, #8]
 119 006c 7B68     		ldr	r3, [r7, #4]
 120 006e 0433     		adds	r3, r3, #4
 121 0070 5B00     		lsls	r3, r3, #1
 122 0072 D318     		adds	r3, r2, r3
 123 0074 0133     		adds	r3, r3, #1
 124 0076 1A78     		ldrb	r2, [r3]
 125 0078 3B68     		ldr	r3, [r7]
 126 007a 9B68     		ldr	r3, [r3, #8]
 127 007c 1B68     		ldr	r3, [r3]
 128 007e 9B68     		ldr	r3, [r3, #8]
 129 0080 DBB2     		uxtb	r3, r3
 130 0082 5343     		muls	r3, r2
 131 0084 DAB2     		uxtb	r2, r3
 132 0086 3B68     		ldr	r3, [r7]
 133 0088 9B68     		ldr	r3, [r3, #8]
 134 008a 1968     		ldr	r1, [r3]
 135 008c FB68     		ldr	r3, [r7, #12]
 136 008e 0433     		adds	r3, r3, #4
 137 0090 5B00     		lsls	r3, r3, #1
 138 0092 CB18     		adds	r3, r1, r3
 139 0094 0533     		adds	r3, r3, #5
 140 0096 1B78     		ldrb	r3, [r3]
 141 0098 D318     		adds	r3, r2, r3
 142 009a DAB2     		uxtb	r2, r3
 143 009c 0A23     		movs	r3, #10
 144 009e FB18     		adds	r3, r7, r3
 145 00a0 013A     		subs	r2, r2, #1
 146 00a2 1A70     		strb	r2, [r3]
  16:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 		
  17:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 		// Paint it
  18:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 		pixel(x, y, 1);
 147              		.loc 1 18 0 discriminator 3
 148 00a4 0B23     		movs	r3, #11
 149 00a6 FB18     		adds	r3, r7, r3
 150 00a8 1878     		ldrb	r0, [r3]
 151 00aa 0A23     		movs	r3, #10
 152 00ac FB18     		adds	r3, r7, r3
 153 00ae 1B78     		ldrb	r3, [r3]
 154 00b0 0122     		movs	r2, #1
 155 00b2 1900     		movs	r1, r3
 156 00b4 FFF7FEFF 		bl	pixel
 157              	.LBE3:
  13:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 		x = (o->body->positions[pos].x * o->body->tile->sizex) - 1 + o->body->tile->px[j].x;
 158              		.loc 1 13 0 discriminator 3
 159 00b8 FB68     		ldr	r3, [r7, #12]
 160 00ba 0133     		adds	r3, r3, #1
 161 00bc FB60     		str	r3, [r7, #12]
 162              	.L3:
  13:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 		x = (o->body->positions[pos].x * o->body->tile->sizex) - 1 + o->body->tile->px[j].x;
 163              		.loc 1 13 0 is_stmt 0 discriminator 1
 164 00be 3B68     		ldr	r3, [r7]
 165 00c0 9B68     		ldr	r3, [r3, #8]
 166 00c2 1B68     		ldr	r3, [r3]
 167 00c4 1A68     		ldr	r2, [r3]
 168 00c6 FB68     		ldr	r3, [r7, #12]
 169 00c8 9A42     		cmp	r2, r3
 170 00ca B1DC     		bgt	.L4
 171              	.LBE2:
  19:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	}
  20:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** }
 172              		.loc 1 20 0 is_stmt 1
 173 00cc C046     		nop
 174 00ce BD46     		mov	sp, r7
 175 00d0 04B0     		add	sp, sp, #16
 176              		@ sp needed
 177 00d2 80BD     		pop	{r7, pc}
 178              		.cfi_endproc
 179              	.LFE1:
 181              		.align	2
 182              		.global	clear_position
 183              		.code	16
 184              		.thumb_func
 186              	clear_position:
 187              	.LFB2:
  21:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 
  22:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** void clear_position(int pos, PSNAKE o){
 188              		.loc 1 22 0
 189              		.cfi_startproc
 190              		@ args = 0, pretend = 0, frame = 16
 191              		@ frame_needed = 1, uses_anonymous_args = 0
 192 00d4 80B5     		push	{r7, lr}
 193              		.cfi_def_cfa_offset 8
 194              		.cfi_offset 7, -8
 195              		.cfi_offset 14, -4
 196 00d6 84B0     		sub	sp, sp, #16
 197              		.cfi_def_cfa_offset 24
 198 00d8 00AF     		add	r7, sp, #0
 199              		.cfi_def_cfa_register 7
 200 00da 7860     		str	r0, [r7, #4]
 201 00dc 3960     		str	r1, [r7]
 202              	.LBB4:
  23:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	unsigned char x;
  24:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	unsigned char y;
  25:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	
  26:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	// Loop through dots on position
  27:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	for (int j = 0; j < o->body->tile->numpoints; j++){
 203              		.loc 1 27 0
 204 00de 0023     		movs	r3, #0
 205 00e0 FB60     		str	r3, [r7, #12]
 206 00e2 46E0     		b	.L6
 207              	.L7:
 208              	.LBB5:
  28:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 		x = (o->body->positions[pos].x * o->body->tile->sizex) - 1 + o->body->tile->px[j].x;
 209              		.loc 1 28 0 discriminator 3
 210 00e4 3B68     		ldr	r3, [r7]
 211 00e6 9B68     		ldr	r3, [r3, #8]
 212 00e8 7A68     		ldr	r2, [r7, #4]
 213 00ea 0432     		adds	r2, r2, #4
 214 00ec 5200     		lsls	r2, r2, #1
 215 00ee D25C     		ldrb	r2, [r2, r3]
 216 00f0 3B68     		ldr	r3, [r7]
 217 00f2 9B68     		ldr	r3, [r3, #8]
 218 00f4 1B68     		ldr	r3, [r3]
 219 00f6 5B68     		ldr	r3, [r3, #4]
 220 00f8 DBB2     		uxtb	r3, r3
 221 00fa 5343     		muls	r3, r2
 222 00fc DAB2     		uxtb	r2, r3
 223 00fe 3B68     		ldr	r3, [r7]
 224 0100 9B68     		ldr	r3, [r3, #8]
 225 0102 1968     		ldr	r1, [r3]
 226 0104 FB68     		ldr	r3, [r7, #12]
 227 0106 0433     		adds	r3, r3, #4
 228 0108 5B00     		lsls	r3, r3, #1
 229 010a CB18     		adds	r3, r1, r3
 230 010c 0433     		adds	r3, r3, #4
 231 010e 1B78     		ldrb	r3, [r3]
 232 0110 D318     		adds	r3, r2, r3
 233 0112 DAB2     		uxtb	r2, r3
 234 0114 0B23     		movs	r3, #11
 235 0116 FB18     		adds	r3, r7, r3
 236 0118 013A     		subs	r2, r2, #1
 237 011a 1A70     		strb	r2, [r3]
  29:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 		y = (o->body->positions[pos].y * o->body->tile->sizey) - 1 + o->body->tile->px[j].y;
 238              		.loc 1 29 0 discriminator 3
 239 011c 3B68     		ldr	r3, [r7]
 240 011e 9A68     		ldr	r2, [r3, #8]
 241 0120 7B68     		ldr	r3, [r7, #4]
 242 0122 0433     		adds	r3, r3, #4
 243 0124 5B00     		lsls	r3, r3, #1
 244 0126 D318     		adds	r3, r2, r3
 245 0128 0133     		adds	r3, r3, #1
 246 012a 1A78     		ldrb	r2, [r3]
 247 012c 3B68     		ldr	r3, [r7]
 248 012e 9B68     		ldr	r3, [r3, #8]
 249 0130 1B68     		ldr	r3, [r3]
 250 0132 9B68     		ldr	r3, [r3, #8]
 251 0134 DBB2     		uxtb	r3, r3
 252 0136 5343     		muls	r3, r2
 253 0138 DAB2     		uxtb	r2, r3
 254 013a 3B68     		ldr	r3, [r7]
 255 013c 9B68     		ldr	r3, [r3, #8]
 256 013e 1968     		ldr	r1, [r3]
 257 0140 FB68     		ldr	r3, [r7, #12]
 258 0142 0433     		adds	r3, r3, #4
 259 0144 5B00     		lsls	r3, r3, #1
 260 0146 CB18     		adds	r3, r1, r3
 261 0148 0533     		adds	r3, r3, #5
 262 014a 1B78     		ldrb	r3, [r3]
 263 014c D318     		adds	r3, r2, r3
 264 014e DAB2     		uxtb	r2, r3
 265 0150 0A23     		movs	r3, #10
 266 0152 FB18     		adds	r3, r7, r3
 267 0154 013A     		subs	r2, r2, #1
 268 0156 1A70     		strb	r2, [r3]
  30:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 		
  31:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 		// Paint it
  32:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 		pixel(x, y, 0);
 269              		.loc 1 32 0 discriminator 3
 270 0158 0B23     		movs	r3, #11
 271 015a FB18     		adds	r3, r7, r3
 272 015c 1878     		ldrb	r0, [r3]
 273 015e 0A23     		movs	r3, #10
 274 0160 FB18     		adds	r3, r7, r3
 275 0162 1B78     		ldrb	r3, [r3]
 276 0164 0022     		movs	r2, #0
 277 0166 1900     		movs	r1, r3
 278 0168 FFF7FEFF 		bl	pixel
 279              	.LBE5:
  27:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 		x = (o->body->positions[pos].x * o->body->tile->sizex) - 1 + o->body->tile->px[j].x;
 280              		.loc 1 27 0 discriminator 3
 281 016c FB68     		ldr	r3, [r7, #12]
 282 016e 0133     		adds	r3, r3, #1
 283 0170 FB60     		str	r3, [r7, #12]
 284              	.L6:
  27:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 		x = (o->body->positions[pos].x * o->body->tile->sizex) - 1 + o->body->tile->px[j].x;
 285              		.loc 1 27 0 is_stmt 0 discriminator 1
 286 0172 3B68     		ldr	r3, [r7]
 287 0174 9B68     		ldr	r3, [r3, #8]
 288 0176 1B68     		ldr	r3, [r3]
 289 0178 1A68     		ldr	r2, [r3]
 290 017a FB68     		ldr	r3, [r7, #12]
 291 017c 9A42     		cmp	r2, r3
 292 017e B1DC     		bgt	.L7
 293              	.LBE4:
  33:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	}
  34:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** }
 294              		.loc 1 34 0 is_stmt 1
 295 0180 C046     		nop
 296 0182 BD46     		mov	sp, r7
 297 0184 04B0     		add	sp, sp, #16
 298              		@ sp needed
 299 0186 80BD     		pop	{r7, pc}
 300              		.cfi_endproc
 301              	.LFE2:
 303              		.align	2
 304              		.global	draw_object
 305              		.code	16
 306              		.thumb_func
 308              	draw_object:
 309              	.LFB3:
  35:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 
  36:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** void draw_object(PSNAKE o){
 310              		.loc 1 36 0
 311              		.cfi_startproc
 312              		@ args = 0, pretend = 0, frame = 16
 313              		@ frame_needed = 1, uses_anonymous_args = 0
 314 0188 80B5     		push	{r7, lr}
 315              		.cfi_def_cfa_offset 8
 316              		.cfi_offset 7, -8
 317              		.cfi_offset 14, -4
 318 018a 84B0     		sub	sp, sp, #16
 319              		.cfi_def_cfa_offset 24
 320 018c 00AF     		add	r7, sp, #0
 321              		.cfi_def_cfa_register 7
 322 018e 7860     		str	r0, [r7, #4]
 323              	.LBB6:
  37:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	
  38:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	// Loop through positions
  39:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	for (int i = 0; i < o->body->body_size; i++){
 324              		.loc 1 39 0
 325 0190 0023     		movs	r3, #0
 326 0192 FB60     		str	r3, [r7, #12]
 327 0194 08E0     		b	.L9
 328              	.L10:
  40:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 		draw_position(i, o);
 329              		.loc 1 40 0 discriminator 3
 330 0196 7A68     		ldr	r2, [r7, #4]
 331 0198 FB68     		ldr	r3, [r7, #12]
 332 019a 1100     		movs	r1, r2
 333 019c 1800     		movs	r0, r3
 334 019e FFF7FEFF 		bl	draw_position
  39:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 		draw_position(i, o);
 335              		.loc 1 39 0 discriminator 3
 336 01a2 FB68     		ldr	r3, [r7, #12]
 337 01a4 0133     		adds	r3, r3, #1
 338 01a6 FB60     		str	r3, [r7, #12]
 339              	.L9:
  39:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 		draw_position(i, o);
 340              		.loc 1 39 0 is_stmt 0 discriminator 1
 341 01a8 7B68     		ldr	r3, [r7, #4]
 342 01aa 9B68     		ldr	r3, [r3, #8]
 343 01ac 5A68     		ldr	r2, [r3, #4]
 344 01ae FB68     		ldr	r3, [r7, #12]
 345 01b0 9A42     		cmp	r2, r3
 346 01b2 F0D8     		bhi	.L10
 347              	.LBE6:
  41:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	}
  42:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** }
 348              		.loc 1 42 0 is_stmt 1
 349 01b4 C046     		nop
 350 01b6 BD46     		mov	sp, r7
 351 01b8 04B0     		add	sp, sp, #16
 352              		@ sp needed
 353 01ba 80BD     		pop	{r7, pc}
 354              		.cfi_endproc
 355              	.LFE3:
 357              		.align	2
 358              		.global	clear_object
 359              		.code	16
 360              		.thumb_func
 362              	clear_object:
 363              	.LFB4:
  43:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 
  44:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** void clear_object(PSNAKE o){
 364              		.loc 1 44 0
 365              		.cfi_startproc
 366              		@ args = 0, pretend = 0, frame = 16
 367              		@ frame_needed = 1, uses_anonymous_args = 0
 368 01bc 80B5     		push	{r7, lr}
 369              		.cfi_def_cfa_offset 8
 370              		.cfi_offset 7, -8
 371              		.cfi_offset 14, -4
 372 01be 84B0     		sub	sp, sp, #16
 373              		.cfi_def_cfa_offset 24
 374 01c0 00AF     		add	r7, sp, #0
 375              		.cfi_def_cfa_register 7
 376 01c2 7860     		str	r0, [r7, #4]
 377              	.LBB7:
  45:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	
  46:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	// Loop through positions
  47:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	for (int i = 0; i < o->body->body_size; i++){
 378              		.loc 1 47 0
 379 01c4 0023     		movs	r3, #0
 380 01c6 FB60     		str	r3, [r7, #12]
 381 01c8 08E0     		b	.L12
 382              	.L13:
  48:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 		clear_position(i, o);
 383              		.loc 1 48 0 discriminator 3
 384 01ca 7A68     		ldr	r2, [r7, #4]
 385 01cc FB68     		ldr	r3, [r7, #12]
 386 01ce 1100     		movs	r1, r2
 387 01d0 1800     		movs	r0, r3
 388 01d2 FFF7FEFF 		bl	clear_position
  47:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 		clear_position(i, o);
 389              		.loc 1 47 0 discriminator 3
 390 01d6 FB68     		ldr	r3, [r7, #12]
 391 01d8 0133     		adds	r3, r3, #1
 392 01da FB60     		str	r3, [r7, #12]
 393              	.L12:
  47:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 		clear_position(i, o);
 394              		.loc 1 47 0 is_stmt 0 discriminator 1
 395 01dc 7B68     		ldr	r3, [r7, #4]
 396 01de 9B68     		ldr	r3, [r3, #8]
 397 01e0 5A68     		ldr	r2, [r3, #4]
 398 01e2 FB68     		ldr	r3, [r7, #12]
 399 01e4 9A42     		cmp	r2, r3
 400 01e6 F0D8     		bhi	.L13
 401              	.LBE7:
  49:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	}
  50:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** }
 402              		.loc 1 50 0 is_stmt 1
 403 01e8 C046     		nop
 404 01ea BD46     		mov	sp, r7
 405 01ec 04B0     		add	sp, sp, #16
 406              		@ sp needed
 407 01ee 80BD     		pop	{r7, pc}
 408              		.cfi_endproc
 409              	.LFE4:
 411              		.align	2
 412              		.global	clear_tail
 413              		.code	16
 414              		.thumb_func
 416              	clear_tail:
 417              	.LFB5:
  51:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 
  52:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** void clear_tail(PSNAKE o){
 418              		.loc 1 52 0
 419              		.cfi_startproc
 420              		@ args = 0, pretend = 0, frame = 16
 421              		@ frame_needed = 1, uses_anonymous_args = 0
 422 01f0 80B5     		push	{r7, lr}
 423              		.cfi_def_cfa_offset 8
 424              		.cfi_offset 7, -8
 425              		.cfi_offset 14, -4
 426 01f2 84B0     		sub	sp, sp, #16
 427              		.cfi_def_cfa_offset 24
 428 01f4 00AF     		add	r7, sp, #0
 429              		.cfi_def_cfa_register 7
 430 01f6 7860     		str	r0, [r7, #4]
  53:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	
  54:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	// Get tail position
  55:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	int i = o->body->body_size - 1;
 431              		.loc 1 55 0
 432 01f8 7B68     		ldr	r3, [r7, #4]
 433 01fa 9B68     		ldr	r3, [r3, #8]
 434 01fc 5B68     		ldr	r3, [r3, #4]
 435 01fe 013B     		subs	r3, r3, #1
 436 0200 FB60     		str	r3, [r7, #12]
  56:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	
  57:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	// Clear tail
  58:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	clear_position(i, o);
 437              		.loc 1 58 0
 438 0202 7A68     		ldr	r2, [r7, #4]
 439 0204 FB68     		ldr	r3, [r7, #12]
 440 0206 1100     		movs	r1, r2
 441 0208 1800     		movs	r0, r3
 442 020a FFF7FEFF 		bl	clear_position
  59:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** }
 443              		.loc 1 59 0
 444 020e C046     		nop
 445 0210 BD46     		mov	sp, r7
 446 0212 04B0     		add	sp, sp, #16
 447              		@ sp needed
 448 0214 80BD     		pop	{r7, pc}
 449              		.cfi_endproc
 450              	.LFE5:
 452 0216 C046     		.align	2
 453              		.global	draw_head
 454              		.code	16
 455              		.thumb_func
 457              	draw_head:
 458              	.LFB6:
  60:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 
  61:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** void draw_head(PSNAKE o){
 459              		.loc 1 61 0
 460              		.cfi_startproc
 461              		@ args = 0, pretend = 0, frame = 8
 462              		@ frame_needed = 1, uses_anonymous_args = 0
 463 0218 80B5     		push	{r7, lr}
 464              		.cfi_def_cfa_offset 8
 465              		.cfi_offset 7, -8
 466              		.cfi_offset 14, -4
 467 021a 82B0     		sub	sp, sp, #8
 468              		.cfi_def_cfa_offset 16
 469 021c 00AF     		add	r7, sp, #0
 470              		.cfi_def_cfa_register 7
 471 021e 7860     		str	r0, [r7, #4]
  62:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	draw_position(0, o);
 472              		.loc 1 62 0
 473 0220 7B68     		ldr	r3, [r7, #4]
 474 0222 1900     		movs	r1, r3
 475 0224 0020     		movs	r0, #0
 476 0226 FFF7FEFF 		bl	draw_position
  63:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** }
 477              		.loc 1 63 0
 478 022a C046     		nop
 479 022c BD46     		mov	sp, r7
 480 022e 02B0     		add	sp, sp, #8
 481              		@ sp needed
 482 0230 80BD     		pop	{r7, pc}
 483              		.cfi_endproc
 484              	.LFE6:
 486 0232 C046     		.align	2
 487              		.global	move_object
 488              		.code	16
 489              		.thumb_func
 491              	move_object:
 492              	.LFB7:
  64:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 
  65:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** void move_object(PSNAKE o){
 493              		.loc 1 65 0
 494              		.cfi_startproc
 495              		@ args = 0, pretend = 0, frame = 16
 496              		@ frame_needed = 1, uses_anonymous_args = 0
 497 0234 80B5     		push	{r7, lr}
 498              		.cfi_def_cfa_offset 8
 499              		.cfi_offset 7, -8
 500              		.cfi_offset 14, -4
 501 0236 84B0     		sub	sp, sp, #16
 502              		.cfi_def_cfa_offset 24
 503 0238 00AF     		add	r7, sp, #0
 504              		.cfi_def_cfa_register 7
 505 023a 7860     		str	r0, [r7, #4]
  66:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	clear_tail(o);
 506              		.loc 1 66 0
 507 023c 7B68     		ldr	r3, [r7, #4]
 508 023e 1800     		movs	r0, r3
 509 0240 FFF7FEFF 		bl	clear_tail
 510              	.LBB8:
  67:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	
  68:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	// Loop through positions
  69:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	for (int i = o->body->body_size - 1; i > 0; i--){
 511              		.loc 1 69 0
 512 0244 7B68     		ldr	r3, [r7, #4]
 513 0246 9B68     		ldr	r3, [r3, #8]
 514 0248 5B68     		ldr	r3, [r3, #4]
 515 024a 013B     		subs	r3, r3, #1
 516 024c FB60     		str	r3, [r7, #12]
 517 024e 0FE0     		b	.L17
 518              	.L18:
  70:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 		o->body->positions[i] = o->body->positions[i-1];
 519              		.loc 1 70 0 discriminator 3
 520 0250 7B68     		ldr	r3, [r7, #4]
 521 0252 9A68     		ldr	r2, [r3, #8]
 522 0254 7B68     		ldr	r3, [r7, #4]
 523 0256 9968     		ldr	r1, [r3, #8]
 524 0258 FB68     		ldr	r3, [r7, #12]
 525 025a 581E     		subs	r0, r3, #1
 526 025c FB68     		ldr	r3, [r7, #12]
 527 025e 0433     		adds	r3, r3, #4
 528 0260 5B00     		lsls	r3, r3, #1
 529 0262 0430     		adds	r0, r0, #4
 530 0264 4000     		lsls	r0, r0, #1
 531 0266 415A     		ldrh	r1, [r0, r1]
 532 0268 9952     		strh	r1, [r3, r2]
  69:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 		o->body->positions[i] = o->body->positions[i-1];
 533              		.loc 1 69 0 discriminator 3
 534 026a FB68     		ldr	r3, [r7, #12]
 535 026c 013B     		subs	r3, r3, #1
 536 026e FB60     		str	r3, [r7, #12]
 537              	.L17:
  69:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 		o->body->positions[i] = o->body->positions[i-1];
 538              		.loc 1 69 0 is_stmt 0 discriminator 1
 539 0270 FB68     		ldr	r3, [r7, #12]
 540 0272 002B     		cmp	r3, #0
 541 0274 ECDC     		bgt	.L18
 542              	.LBE8:
  71:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	}
  72:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	
  73:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	// Set new head
  74:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	o->body->positions[0].x += o->dirx;
 543              		.loc 1 74 0 is_stmt 1
 544 0276 7B68     		ldr	r3, [r7, #4]
 545 0278 9A68     		ldr	r2, [r3, #8]
 546 027a 7B68     		ldr	r3, [r7, #4]
 547 027c 9B68     		ldr	r3, [r3, #8]
 548 027e 197A     		ldrb	r1, [r3, #8]
 549 0280 7B68     		ldr	r3, [r7, #4]
 550 0282 1B68     		ldr	r3, [r3]
 551 0284 DBB2     		uxtb	r3, r3
 552 0286 CB18     		adds	r3, r1, r3
 553 0288 DBB2     		uxtb	r3, r3
 554 028a 1372     		strb	r3, [r2, #8]
  75:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	o->body->positions[0].y += o->diry;
 555              		.loc 1 75 0
 556 028c 7B68     		ldr	r3, [r7, #4]
 557 028e 9A68     		ldr	r2, [r3, #8]
 558 0290 7B68     		ldr	r3, [r7, #4]
 559 0292 9B68     		ldr	r3, [r3, #8]
 560 0294 597A     		ldrb	r1, [r3, #9]
 561 0296 7B68     		ldr	r3, [r7, #4]
 562 0298 5B68     		ldr	r3, [r3, #4]
 563 029a DBB2     		uxtb	r3, r3
 564 029c CB18     		adds	r3, r1, r3
 565 029e DBB2     		uxtb	r3, r3
 566 02a0 5372     		strb	r3, [r2, #9]
  76:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	
  77:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	draw_head(o);
 567              		.loc 1 77 0
 568 02a2 7B68     		ldr	r3, [r7, #4]
 569 02a4 1800     		movs	r0, r3
 570 02a6 FFF7FEFF 		bl	draw_head
  78:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** }
 571              		.loc 1 78 0
 572 02aa C046     		nop
 573 02ac BD46     		mov	sp, r7
 574 02ae 04B0     		add	sp, sp, #16
 575              		@ sp needed
 576 02b0 80BD     		pop	{r7, pc}
 577              		.cfi_endproc
 578              	.LFE7:
 580 02b2 C046     		.align	2
 581              		.global	snake_eats_food
 582              		.code	16
 583              		.thumb_func
 585              	snake_eats_food:
 586              	.LFB8:
  79:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 
  80:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** /**
  81:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c ****  * FOOD FUNCTIONS
  82:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c ****  */
  83:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 
  84:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** /**
  85:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c ****  * @brief Checks if any of the snakes body tiles is on the same position as the food
  86:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c ****  */
  87:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** bool snake_eats_food(PSNAKE s, PFOOD f){
 587              		.loc 1 87 0
 588              		.cfi_startproc
 589              		@ args = 0, pretend = 0, frame = 16
 590              		@ frame_needed = 1, uses_anonymous_args = 0
 591 02b4 80B5     		push	{r7, lr}
 592              		.cfi_def_cfa_offset 8
 593              		.cfi_offset 7, -8
 594              		.cfi_offset 14, -4
 595 02b6 84B0     		sub	sp, sp, #16
 596              		.cfi_def_cfa_offset 24
 597 02b8 00AF     		add	r7, sp, #0
 598              		.cfi_def_cfa_register 7
 599 02ba 7860     		str	r0, [r7, #4]
 600 02bc 3960     		str	r1, [r7]
 601              	.LBB9:
  88:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	
  89:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	bool x_eq;
  90:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	bool y_eq;
  91:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	
  92:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	// Loop trough all parts of snake body
  93:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	for (int i = 0; i < s->body->body_size; i++){
 602              		.loc 1 93 0
 603 02be 0023     		movs	r3, #0
 604 02c0 FB60     		str	r3, [r7, #12]
 605 02c2 36E0     		b	.L20
 606              	.L23:
  94:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 		x_eq = false;
 607              		.loc 1 94 0
 608 02c4 0B23     		movs	r3, #11
 609 02c6 FB18     		adds	r3, r7, r3
 610 02c8 0022     		movs	r2, #0
 611 02ca 1A70     		strb	r2, [r3]
  95:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 		y_eq = false;
 612              		.loc 1 95 0
 613 02cc 0A23     		movs	r3, #10
 614 02ce FB18     		adds	r3, r7, r3
 615 02d0 0022     		movs	r2, #0
 616 02d2 1A70     		strb	r2, [r3]
  96:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 		
  97:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 		x_eq = s->body->positions[i].x == f->position.x;
 617              		.loc 1 97 0
 618 02d4 7B68     		ldr	r3, [r7, #4]
 619 02d6 9B68     		ldr	r3, [r3, #8]
 620 02d8 FA68     		ldr	r2, [r7, #12]
 621 02da 0432     		adds	r2, r2, #4
 622 02dc 5200     		lsls	r2, r2, #1
 623 02de D25C     		ldrb	r2, [r2, r3]
 624 02e0 3B68     		ldr	r3, [r7]
 625 02e2 1B78     		ldrb	r3, [r3]
 626 02e4 D31A     		subs	r3, r2, r3
 627 02e6 5A42     		rsbs	r2, r3, #0
 628 02e8 5341     		adcs	r3, r3, r2
 629 02ea DAB2     		uxtb	r2, r3
 630 02ec 0B23     		movs	r3, #11
 631 02ee FB18     		adds	r3, r7, r3
 632 02f0 1A70     		strb	r2, [r3]
  98:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 		y_eq = s->body->positions[i].y == f->position.y;
 633              		.loc 1 98 0
 634 02f2 7B68     		ldr	r3, [r7, #4]
 635 02f4 9A68     		ldr	r2, [r3, #8]
 636 02f6 FB68     		ldr	r3, [r7, #12]
 637 02f8 0433     		adds	r3, r3, #4
 638 02fa 5B00     		lsls	r3, r3, #1
 639 02fc D318     		adds	r3, r2, r3
 640 02fe 0133     		adds	r3, r3, #1
 641 0300 1A78     		ldrb	r2, [r3]
 642 0302 3B68     		ldr	r3, [r7]
 643 0304 5B78     		ldrb	r3, [r3, #1]
 644 0306 D31A     		subs	r3, r2, r3
 645 0308 5A42     		rsbs	r2, r3, #0
 646 030a 5341     		adcs	r3, r3, r2
 647 030c DAB2     		uxtb	r2, r3
 648 030e 0A23     		movs	r3, #10
 649 0310 FB18     		adds	r3, r7, r3
 650 0312 1A70     		strb	r2, [r3]
  99:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 		
 100:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 		if (x_eq && y_eq)
 651              		.loc 1 100 0
 652 0314 0B23     		movs	r3, #11
 653 0316 FB18     		adds	r3, r7, r3
 654 0318 1B78     		ldrb	r3, [r3]
 655 031a 002B     		cmp	r3, #0
 656 031c 06D0     		beq	.L21
 657              		.loc 1 100 0 is_stmt 0 discriminator 1
 658 031e 0A23     		movs	r3, #10
 659 0320 FB18     		adds	r3, r7, r3
 660 0322 1B78     		ldrb	r3, [r3]
 661 0324 002B     		cmp	r3, #0
 662 0326 01D0     		beq	.L21
 101:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 			return true;
 663              		.loc 1 101 0 is_stmt 1
 664 0328 0123     		movs	r3, #1
 665 032a 09E0     		b	.L22
 666              	.L21:
  93:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 		x_eq = false;
 667              		.loc 1 93 0 discriminator 2
 668 032c FB68     		ldr	r3, [r7, #12]
 669 032e 0133     		adds	r3, r3, #1
 670 0330 FB60     		str	r3, [r7, #12]
 671              	.L20:
  93:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 		x_eq = false;
 672              		.loc 1 93 0 is_stmt 0 discriminator 1
 673 0332 7B68     		ldr	r3, [r7, #4]
 674 0334 9B68     		ldr	r3, [r3, #8]
 675 0336 5A68     		ldr	r2, [r3, #4]
 676 0338 FB68     		ldr	r3, [r7, #12]
 677 033a 9A42     		cmp	r2, r3
 678 033c C2D8     		bhi	.L23
 679              	.LBE9:
 102:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	}
 103:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	
 104:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	return false;
 680              		.loc 1 104 0 is_stmt 1
 681 033e 0023     		movs	r3, #0
 682              	.L22:
 105:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** }
 683              		.loc 1 105 0
 684 0340 1800     		movs	r0, r3
 685 0342 BD46     		mov	sp, r7
 686 0344 04B0     		add	sp, sp, #16
 687              		@ sp needed
 688 0346 80BD     		pop	{r7, pc}
 689              		.cfi_endproc
 690              	.LFE8:
 692              		.align	2
 693              		.global	head_eats_food
 694              		.code	16
 695              		.thumb_func
 697              	head_eats_food:
 698              	.LFB9:
 106:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 
 107:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** /**
 108:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c ****  * @brief Checks if the snake head is on the same position as the food
 109:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c ****  */
 110:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** bool head_eats_food(PSNAKE s, PFOOD f){
 699              		.loc 1 110 0
 700              		.cfi_startproc
 701              		@ args = 0, pretend = 0, frame = 16
 702              		@ frame_needed = 1, uses_anonymous_args = 0
 703 0348 80B5     		push	{r7, lr}
 704              		.cfi_def_cfa_offset 8
 705              		.cfi_offset 7, -8
 706              		.cfi_offset 14, -4
 707 034a 84B0     		sub	sp, sp, #16
 708              		.cfi_def_cfa_offset 24
 709 034c 00AF     		add	r7, sp, #0
 710              		.cfi_def_cfa_register 7
 711 034e 7860     		str	r0, [r7, #4]
 712 0350 3960     		str	r1, [r7]
 111:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	
 112:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	bool x_eq = false;
 713              		.loc 1 112 0
 714 0352 0F23     		movs	r3, #15
 715 0354 FB18     		adds	r3, r7, r3
 716 0356 0022     		movs	r2, #0
 717 0358 1A70     		strb	r2, [r3]
 113:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	bool y_eq = false;
 718              		.loc 1 113 0
 719 035a 0E23     		movs	r3, #14
 720 035c FB18     		adds	r3, r7, r3
 721 035e 0022     		movs	r2, #0
 722 0360 1A70     		strb	r2, [r3]
 114:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	
 115:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	x_eq = s->body->positions[0].x == f->position.x;
 723              		.loc 1 115 0
 724 0362 7B68     		ldr	r3, [r7, #4]
 725 0364 9B68     		ldr	r3, [r3, #8]
 726 0366 1A7A     		ldrb	r2, [r3, #8]
 727 0368 3B68     		ldr	r3, [r7]
 728 036a 1B78     		ldrb	r3, [r3]
 729 036c D31A     		subs	r3, r2, r3
 730 036e 5A42     		rsbs	r2, r3, #0
 731 0370 5341     		adcs	r3, r3, r2
 732 0372 DAB2     		uxtb	r2, r3
 733 0374 0F23     		movs	r3, #15
 734 0376 FB18     		adds	r3, r7, r3
 735 0378 1A70     		strb	r2, [r3]
 116:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	y_eq = s->body->positions[0].y == f->position.y;
 736              		.loc 1 116 0
 737 037a 7B68     		ldr	r3, [r7, #4]
 738 037c 9B68     		ldr	r3, [r3, #8]
 739 037e 5A7A     		ldrb	r2, [r3, #9]
 740 0380 3B68     		ldr	r3, [r7]
 741 0382 5B78     		ldrb	r3, [r3, #1]
 742 0384 D31A     		subs	r3, r2, r3
 743 0386 5A42     		rsbs	r2, r3, #0
 744 0388 5341     		adcs	r3, r3, r2
 745 038a DAB2     		uxtb	r2, r3
 746 038c 0E23     		movs	r3, #14
 747 038e FB18     		adds	r3, r7, r3
 748 0390 1A70     		strb	r2, [r3]
 117:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	
 118:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	return x_eq && y_eq;
 749              		.loc 1 118 0
 750 0392 0F23     		movs	r3, #15
 751 0394 FB18     		adds	r3, r7, r3
 752 0396 1B78     		ldrb	r3, [r3]
 753 0398 002B     		cmp	r3, #0
 754 039a 06D0     		beq	.L25
 755              		.loc 1 118 0 is_stmt 0 discriminator 1
 756 039c 0E23     		movs	r3, #14
 757 039e FB18     		adds	r3, r7, r3
 758 03a0 1B78     		ldrb	r3, [r3]
 759 03a2 002B     		cmp	r3, #0
 760 03a4 01D0     		beq	.L25
 761              		.loc 1 118 0 discriminator 3
 762 03a6 0123     		movs	r3, #1
 763 03a8 00E0     		b	.L26
 764              	.L25:
 765              		.loc 1 118 0 discriminator 4
 766 03aa 0023     		movs	r3, #0
 767              	.L26:
 768              		.loc 1 118 0 discriminator 6
 769 03ac DBB2     		uxtb	r3, r3
 119:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** }
 770              		.loc 1 119 0 is_stmt 1 discriminator 6
 771 03ae 1800     		movs	r0, r3
 772 03b0 BD46     		mov	sp, r7
 773 03b2 04B0     		add	sp, sp, #16
 774              		@ sp needed
 775 03b4 80BD     		pop	{r7, pc}
 776              		.cfi_endproc
 777              	.LFE9:
 779 03b6 C046     		.align	2
 780              		.global	spawn_food
 781              		.code	16
 782              		.thumb_func
 784              	spawn_food:
 785              	.LFB10:
 120:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 
 121:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** void spawn_food(PSNAKE s, PFOOD f){
 786              		.loc 1 121 0
 787              		.cfi_startproc
 788              		@ args = 0, pretend = 0, frame = 16
 789              		@ frame_needed = 1, uses_anonymous_args = 0
 790 03b8 80B5     		push	{r7, lr}
 791              		.cfi_def_cfa_offset 8
 792              		.cfi_offset 7, -8
 793              		.cfi_offset 14, -4
 794 03ba 84B0     		sub	sp, sp, #16
 795              		.cfi_def_cfa_offset 24
 796 03bc 00AF     		add	r7, sp, #0
 797              		.cfi_def_cfa_register 7
 798 03be 7860     		str	r0, [r7, #4]
 799 03c0 3960     		str	r1, [r7]
 800              	.L36:
 122:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	
 123:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	static int i = 0;
 124:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	
 125:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	// Temporary solution without random number generator
 126:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	do{
 127:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 		switch (i){
 801              		.loc 1 127 0
 802 03c2 3F4B     		ldr	r3, .L39
 803 03c4 1B68     		ldr	r3, [r3]
 804 03c6 042B     		cmp	r3, #4
 805 03c8 27D8     		bhi	.L29
 806 03ca 9A00     		lsls	r2, r3, #2
 807 03cc 3D4B     		ldr	r3, .L39+4
 808 03ce D318     		adds	r3, r2, r3
 809 03d0 1B68     		ldr	r3, [r3]
 810 03d2 9F46     		mov	pc, r3
 811              		.section	.rodata
 812              		.align	2
 813              	.L31:
 814 0000 D4030000 		.word	.L30
 815 0004 E2030000 		.word	.L32
 816 0008 F0030000 		.word	.L33
 817 000c FE030000 		.word	.L34
 818 0010 0C040000 		.word	.L35
 819              		.text
 820              	.L30:
 128:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 			case 0:
 129:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 				f->position.x = 5;
 821              		.loc 1 129 0
 822 03d4 3B68     		ldr	r3, [r7]
 823 03d6 0522     		movs	r2, #5
 824 03d8 1A70     		strb	r2, [r3]
 130:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 				f->position.y = 10;
 825              		.loc 1 130 0
 826 03da 3B68     		ldr	r3, [r7]
 827 03dc 0A22     		movs	r2, #10
 828 03de 5A70     		strb	r2, [r3, #1]
 131:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 				break;
 829              		.loc 1 131 0
 830 03e0 1BE0     		b	.L29
 831              	.L32:
 132:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 				
 133:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 			case 1:
 134:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 				f->position.x = 50;
 832              		.loc 1 134 0
 833 03e2 3B68     		ldr	r3, [r7]
 834 03e4 3222     		movs	r2, #50
 835 03e6 1A70     		strb	r2, [r3]
 135:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 				f->position.y = 28;
 836              		.loc 1 135 0
 837 03e8 3B68     		ldr	r3, [r7]
 838 03ea 1C22     		movs	r2, #28
 839 03ec 5A70     		strb	r2, [r3, #1]
 136:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 				break;
 840              		.loc 1 136 0
 841 03ee 14E0     		b	.L29
 842              	.L33:
 137:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 				
 138:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 			case 2:
 139:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 				f->position.x = 31;
 843              		.loc 1 139 0
 844 03f0 3B68     		ldr	r3, [r7]
 845 03f2 1F22     		movs	r2, #31
 846 03f4 1A70     		strb	r2, [r3]
 140:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 				f->position.y = 1;
 847              		.loc 1 140 0
 848 03f6 3B68     		ldr	r3, [r7]
 849 03f8 0122     		movs	r2, #1
 850 03fa 5A70     		strb	r2, [r3, #1]
 141:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 				break;
 851              		.loc 1 141 0
 852 03fc 0DE0     		b	.L29
 853              	.L34:
 142:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 				
 143:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 			case 3:
 144:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 				f->position.x = 15;
 854              		.loc 1 144 0
 855 03fe 3B68     		ldr	r3, [r7]
 856 0400 0F22     		movs	r2, #15
 857 0402 1A70     		strb	r2, [r3]
 145:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 				f->position.y = 18;
 858              		.loc 1 145 0
 859 0404 3B68     		ldr	r3, [r7]
 860 0406 1222     		movs	r2, #18
 861 0408 5A70     		strb	r2, [r3, #1]
 146:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 				break;
 862              		.loc 1 146 0
 863 040a 06E0     		b	.L29
 864              	.L35:
 147:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 				
 148:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 			case 4:
 149:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 				f->position.x = 22;
 865              		.loc 1 149 0
 866 040c 3B68     		ldr	r3, [r7]
 867 040e 1622     		movs	r2, #22
 868 0410 1A70     		strb	r2, [r3]
 150:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 				f->position.y = 31;
 869              		.loc 1 150 0
 870 0412 3B68     		ldr	r3, [r7]
 871 0414 1F22     		movs	r2, #31
 872 0416 5A70     		strb	r2, [r3, #1]
 151:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 				break;
 873              		.loc 1 151 0
 874 0418 C046     		nop
 875              	.L29:
 152:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 		}
 153:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 		
 154:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 		i++;
 876              		.loc 1 154 0
 877 041a 294B     		ldr	r3, .L39
 878 041c 1B68     		ldr	r3, [r3]
 879 041e 5A1C     		adds	r2, r3, #1
 880 0420 274B     		ldr	r3, .L39
 881 0422 1A60     		str	r2, [r3]
 155:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 		
 156:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	} while(snake_eats_food(s,f));
 882              		.loc 1 156 0
 883 0424 3A68     		ldr	r2, [r7]
 884 0426 7B68     		ldr	r3, [r7, #4]
 885 0428 1100     		movs	r1, r2
 886 042a 1800     		movs	r0, r3
 887 042c FFF7FEFF 		bl	snake_eats_food
 888 0430 031E     		subs	r3, r0, #0
 889 0432 C6D1     		bne	.L36
 890              	.LBB10:
 157:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	
 158:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	// Randomize until food does not collide with snake
 159:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	/*do{
 160:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 		f->position.x = random(64);
 161:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 		f->position.y = random(32);
 162:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	} while(snake_eats_food(s,f));*/
 163:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	
 164:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	unsigned char x;
 165:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	unsigned char y;
 166:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	
 167:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	// Draw the food
 168:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	for (int j = 0; j < f->tile->numpoints; j++){
 891              		.loc 1 168 0
 892 0434 0023     		movs	r3, #0
 893 0436 FB60     		str	r3, [r7, #12]
 894 0438 38E0     		b	.L37
 895              	.L38:
 896              	.LBB11:
 169:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 		x = (f->position.x * f->tile->sizex) - 1 + f->tile->px[j].x;
 897              		.loc 1 169 0 discriminator 3
 898 043a 3B68     		ldr	r3, [r7]
 899 043c 1A78     		ldrb	r2, [r3]
 900 043e 3B68     		ldr	r3, [r7]
 901 0440 5B68     		ldr	r3, [r3, #4]
 902 0442 5B68     		ldr	r3, [r3, #4]
 903 0444 DBB2     		uxtb	r3, r3
 904 0446 5343     		muls	r3, r2
 905 0448 DAB2     		uxtb	r2, r3
 906 044a 3B68     		ldr	r3, [r7]
 907 044c 5968     		ldr	r1, [r3, #4]
 908 044e FB68     		ldr	r3, [r7, #12]
 909 0450 0433     		adds	r3, r3, #4
 910 0452 5B00     		lsls	r3, r3, #1
 911 0454 CB18     		adds	r3, r1, r3
 912 0456 0433     		adds	r3, r3, #4
 913 0458 1B78     		ldrb	r3, [r3]
 914 045a D318     		adds	r3, r2, r3
 915 045c DAB2     		uxtb	r2, r3
 916 045e 0B23     		movs	r3, #11
 917 0460 FB18     		adds	r3, r7, r3
 918 0462 013A     		subs	r2, r2, #1
 919 0464 1A70     		strb	r2, [r3]
 170:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 		y = (f->position.y * f->tile->sizey) - 1 + f->tile->px[j].y;
 920              		.loc 1 170 0 discriminator 3
 921 0466 3B68     		ldr	r3, [r7]
 922 0468 5A78     		ldrb	r2, [r3, #1]
 923 046a 3B68     		ldr	r3, [r7]
 924 046c 5B68     		ldr	r3, [r3, #4]
 925 046e 9B68     		ldr	r3, [r3, #8]
 926 0470 DBB2     		uxtb	r3, r3
 927 0472 5343     		muls	r3, r2
 928 0474 DAB2     		uxtb	r2, r3
 929 0476 3B68     		ldr	r3, [r7]
 930 0478 5968     		ldr	r1, [r3, #4]
 931 047a FB68     		ldr	r3, [r7, #12]
 932 047c 0433     		adds	r3, r3, #4
 933 047e 5B00     		lsls	r3, r3, #1
 934 0480 CB18     		adds	r3, r1, r3
 935 0482 0533     		adds	r3, r3, #5
 936 0484 1B78     		ldrb	r3, [r3]
 937 0486 D318     		adds	r3, r2, r3
 938 0488 DAB2     		uxtb	r2, r3
 939 048a 0A23     		movs	r3, #10
 940 048c FB18     		adds	r3, r7, r3
 941 048e 013A     		subs	r2, r2, #1
 942 0490 1A70     		strb	r2, [r3]
 171:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 		
 172:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 		// Paint it
 173:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 		pixel(x, y, 1);
 943              		.loc 1 173 0 discriminator 3
 944 0492 0B23     		movs	r3, #11
 945 0494 FB18     		adds	r3, r7, r3
 946 0496 1878     		ldrb	r0, [r3]
 947 0498 0A23     		movs	r3, #10
 948 049a FB18     		adds	r3, r7, r3
 949 049c 1B78     		ldrb	r3, [r3]
 950 049e 0122     		movs	r2, #1
 951 04a0 1900     		movs	r1, r3
 952 04a2 FFF7FEFF 		bl	pixel
 953              	.LBE11:
 168:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 		x = (f->position.x * f->tile->sizex) - 1 + f->tile->px[j].x;
 954              		.loc 1 168 0 discriminator 3
 955 04a6 FB68     		ldr	r3, [r7, #12]
 956 04a8 0133     		adds	r3, r3, #1
 957 04aa FB60     		str	r3, [r7, #12]
 958              	.L37:
 168:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 		x = (f->position.x * f->tile->sizex) - 1 + f->tile->px[j].x;
 959              		.loc 1 168 0 is_stmt 0 discriminator 1
 960 04ac 3B68     		ldr	r3, [r7]
 961 04ae 5B68     		ldr	r3, [r3, #4]
 962 04b0 1A68     		ldr	r2, [r3]
 963 04b2 FB68     		ldr	r3, [r7, #12]
 964 04b4 9A42     		cmp	r2, r3
 965 04b6 C0DC     		bgt	.L38
 966              	.LBE10:
 174:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** 	}
 175:/Users/Alfred/Box_Sync/Y02_LP2/DAT017/Moplabb/md407-snake/logic.c **** }...
 967              		.loc 1 175 0 is_stmt 1
 968 04b8 C046     		nop
 969 04ba BD46     		mov	sp, r7
 970 04bc 04B0     		add	sp, sp, #16
 971              		@ sp needed
 972 04be 80BD     		pop	{r7, pc}
 973              	.L40:
 974              		.align	2
 975              	.L39:
 976 04c0 00000000 		.word	i.4175
 977 04c4 00000000 		.word	.L31
 978              		.cfi_endproc
 979              	.LFE10:
 981              		.bss
 982              		.align	2
 983              	i.4175:
 984 0000 00000000 		.space	4
 985              		.text
 986              	.Letext0:
 987              		.file 2 "./logic.h"
