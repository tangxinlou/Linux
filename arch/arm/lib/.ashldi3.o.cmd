cmd_arch/arm/lib/ashldi3.o := arm-linux-gcc -Wp,-MD,arch/arm/lib/.ashldi3.o.d  -nostdinc -isystem /work/tools/gcc-3.4.5-glibc-2.3.6/lib/gcc/arm-linux/3.4.5/include -D__KERNEL__ -Iinclude  -include include/linux/autoconf.h -mlittle-endian -D__ASSEMBLY__ -mapcs-32 -mno-thumb-interwork -D__LINUX_ARM_ARCH__=4 -march=armv4t -mtune=arm9tdmi -msoft-float -gdwarf2    -c -o arch/arm/lib/ashldi3.o arch/arm/lib/ashldi3.S

deps_arch/arm/lib/ashldi3.o := \
  arch/arm/lib/ashldi3.S \
  include/linux/linkage.h \
  include/asm/linkage.h \

arch/arm/lib/ashldi3.o: $(deps_arch/arm/lib/ashldi3.o)

$(deps_arch/arm/lib/ashldi3.o):
