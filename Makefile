# all:
# 	ocp-build root
# 	ocp-build
# 	rm -f *.old
# 	mv _obuild/main/main.asm .

# run:
# 	./main.asm
# clean:
# 	rm -f -R _obuild *~ *.js *.asm *.root


EXEC=generateur
CC=ocamlc
FLAGS=-annot
SRC=types.ml environnement.ml boltzmann_type.ml main.ml

OBJ=$(SRC:.ml=.cmo)
all: $(EXEC)
run: all
	./$(EXEC)
$(EXEC): $(OBJ)
	$(CC) $(FLAGS) -o $@ $^
%.cmi: %.mli
	$(CC) $(FLAGS) -c $<
%.cmo: %.ml
	$(CC) $(FLAGS) -c $<
 depend:
	@echo [OCAMLDEP]
	ocamldep *.ml *.mli > .depend
	-include .depend
clean:
	rm -f *.cm[io] $(EXEC) *~ *.annot
.PHONY: all clean depend
