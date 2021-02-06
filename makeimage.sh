dd if=/dev/zero of=img/fat.img bs=1k count=1440
mformat -i img/fat.img -f 1440 ::
mmd -i img/fat.img ::/EFI
mmd -i img/fat.img ::/EFI/BOOT
mcopy -i img/fat.img img/BOOTX64.EFI ::/EFI/BOOT
mkgpt -o img/hdimage.bin --image-size 4096 --part img/fat.img --type system
qemu-img convert -c -O qcow2 -f raw img/hdimage.bin img/hdimage.qcow2
