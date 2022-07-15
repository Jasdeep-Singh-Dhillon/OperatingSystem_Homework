
test: msh2
	for i in 1 2 3 4 5; do echo -n test $$i ": "; ./test$$i.sh; echo $$?; done

msh2: msh2.c
	gcc -o msh2 msh2.c

clean:
	rm -f temp* msh2 diffs.txt gold-out*
