#define RNG_CR ((unsigned int *) 0x50060800)
#define RNG_SR ((unsigned int *) 0x50060804)
#define RNG_DR ((unsigned int *) 0x50060808)

void enable_rng(void){
	*RNG_CR &= 0xFFFFFFF7;
	*RNG_CR |= (1<<2);
}

unsigned int rng_has_data(void){
	return *RNG_SR && 1;
}

unsigned int random(int max){
	enable_rng();
	
	while(!rng_has_data()){
		// wait until data is ready
	}
	
	return *RNG_DR;
}

