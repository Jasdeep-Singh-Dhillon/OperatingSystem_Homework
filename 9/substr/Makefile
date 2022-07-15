
# run all tests
tests:
		for test in test*.sh; do echo $$test; ./$$test; echo $$?; done

# the 20 must common 3-letter subsequences in words of length 10 or less
three-ten.txt: substr-cnt.sh
		./substr-cnt.sh 3 10 | head -20 > three-ten.txt


