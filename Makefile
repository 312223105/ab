CC=gcc
prefix=/usr

all: ab

.PHONY: ab clean install uninstall

ab:
	${CC} -std=gnu99 -D_GNU_SOURCE -DHAVE_OPENSSL -lm -ldl -lssl -pthread -lcrypto -lcrypt -I/usr/include/apr-1 /usr/lib64/libaprutil-1.so /usr/lib64/libapr-1.so -o ab ab.c

install:
	install -m 0755 ab ${prefix}/bin
	install -m 0644 docs/man/ab.1 ${prefix}/share/man/man1/ab.1.gz

uninstall:
	rm -f ${prefix}/bin/ab
	rm -f ${prefix}/share/man/man1/ab.1.gz
clean:
	rm -rf ab ab.[!c]*
