int 3(void){
	int ohlala = 'a';
	return 0;
}# Makefile TP Flex

# $@ : the current target
# $^ : the current prerequisites
# $< : the first current prerequisite

CC = gcc
CFLAGS = -Wall
LDFLAGS = -Wall -lfl #-ly
EXEC = tpc-2020-2021

as: lex.yy.c $(EXEC).tab.c $(EXEC).tab.h
	$(CC) -o $@ $^ $(LDFLAGS)

$(EXEC).tab.c $(EXEC).tab.h: $(EXEC).y
	bison -d $(EXEC).y

%.o: %.c
	$(CC) -o $@ -c $< $(LDFLAGS)

lex.yy.c: $(EXEC).lex $(EXEC).tab.h
	flex $(EXEC).lex

clean:
	rm -f as *.[och]