training: training.o
	ld -o training training.o
training.o: training.s
	as -o training.o training.s
clean:
	rm *.o training
debug:
	as -g training.s -o training.o
	ld training.o -o training
	gdb training
gcc:
		gcc training.s -o training
gccdsm:
		gcc training.s -o training
		objdump -d training

