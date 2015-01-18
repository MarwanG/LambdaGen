all:
	ocp-build root
	ocp-build
	rm -f *.old
	mv _obuild/main/main.asm .

run:
	./main.asm
clean:
	rm -f -R _obuild *~ *.js *.asm *.root
