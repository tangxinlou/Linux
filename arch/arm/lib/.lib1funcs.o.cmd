cmd_arch/arm/lib/lib1funcs.o := arm-linux-gcc -Wp,-MD,arch/arm/lib/.lib1funcs.o.d  -nostdinc -isystem /work/tools/gcc-3.4.5-glibc-2.3.6/lib/gcc/arm-linux/3.4.5/include -D__KERNEL__ -Iinclude  -include include/linux/autoconf.h -mlittle-endian -D__ASSEMBLY__ -mapcs-32 -mno-thumb-interwork -D__LINUX_ARM_ARCH__=4 -march=armv4t -mtune=arm9tdmi -msoft-float -gdwarf2    -c -o arch/arm/lib/lib1funcs.o arch/arm/lib/lib1funcs.S

deps_arch/arm/lib/lib1funcs.o := \
  arch/arm/lib/lib1funcs.S \
    $(wildcard include/config/aeabi.h) \
  include/linux/linkage.h \
  include/asm/linkage.h \
  include/asm/assembler.h \
  include/asm/ptrace.h \
    $(wildcard include/config/arm/thumb.h) \
    $(wildcard include/config/smp.h) \

arch/arm/lib/lib1funcs.o: $(deps_arch/arm/lib/lib1funcs.o)

$(deps_arch/arm/lib/lib1funcs.o):
