OBJCOPY = objcopy
LD = ld
CC = gcc
RM = del
AS = nasm


init.bin: init.o
	$(OBJCOPY) -O binary -S init.o init.bin
init.o: init.p pre_init.p ldscript
	$(LD) -Tldscript -o init.o
init.p: init.c
	$(CC) init.c -o init.p -c
pre_init.p: pre_init.S
	$(AS) pre_init.S -o pre_init.p -f elf
clean:
	$(RM) *.bin,*.p