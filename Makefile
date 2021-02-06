BASEPATH = ~/Deployments/cross-dev-utils/
EFIPATH = $(BASEPATH)/gnu-efi-code/inc/
CC = x86_64-w64-mingw32-gcc
CFLAGS = -Wall -ffreestanding 
LDFLAGS = -nostdlib -Wl,-dll -shared -Wl,--subsystem,10 -e efi_main
INCPATHS = -I $(EFIPATH) -I $(EFIPATH)/x86_64/
LIBGCCPATH = -lgcc -L ~/opt/cross/lib/gcc/x86_64-w64-mingw32/11.0.0/
LD = x86_64-w64-mingw32-ld
LIBGCC = $(shell $(CC) $(CFLAGS) -print-file-name=libgcc.a)
SRCPATH = src
BINPATH = bin
IMGPATH = img

efimain:
	$(CC) $(LDFLAGS) $(LIBGCCPATH) -o $(IMGPATH)/BOOTX64.EFI $(BINPATH)/BOOTX64.EFI $(BINPATH)/boot.o $(BINPATH)/data.o

boot.o:
	$(CC) $(CFLAGS) $(INCPATHS) -c -o $(BINPATH)/boot.o $(SRCPATH)/boot.c

data.o:
	$(CC) $(CFLAGS) $(INCPATHS) -c -o $(BINPATH)/data.o $(SRCPATH)/data.c

