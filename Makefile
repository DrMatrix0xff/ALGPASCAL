all: hello basecal mysqrt slst catout binstree

hello: hello.pas
	@echo 'compile hello...'
	fpc $^

basecal: basecal.pas
	@echo 'compile basecal...'
	fpc $^

mysqrt: mysqrt.pas
	@echo 'compile mysqrt...'
	fpc $^

# single list of Integers
slst: slst.pas
	@echo 'compile slst...'
	fpc $^

binstree: binstree.pas
	@echo 'compile binstree...'
	fpc $^

catout: catout.pas
	@echo 'compile catout...'
	fpc $^

test:
	@echo 'running catout...'
	./catout
	@echo '\nrunning hello...'
	./hello
	@echo "\nrunning basecal..."
	./basecal
	@echo "\nrunning mysqrt..."
	./mysqrt
	@echo "\nrunning slst..."
	./slst
	@echo "\nrunning binstree..."
	./binstree

clean:
	/bin/rm -f hello mysqrt basecal slst binstree catout *.o

.PHONY: test clean
