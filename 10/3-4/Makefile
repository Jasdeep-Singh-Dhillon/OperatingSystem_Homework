rwlock: rwlock.c 
	gcc -pthread -lm -o rwlock rwlock.c

awk: rwlock.c
	./rwlock > temp.txt; awk -f check-rwlock.awk temp.txt

run: rwlock
	./rwlock
