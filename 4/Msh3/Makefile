
test: msh3
	for i in 1 2 3 4 5 6; do echo -n test $$i ": "; ./test$$i.sh; echo $$?; done

msh3: msh3.c
	gcc -o msh3 msh3.c

clean:
	rm -f temp* msh3 diffs.txt gold-out*
