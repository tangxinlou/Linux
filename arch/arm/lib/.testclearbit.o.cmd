cmd_arch/arm/lib/testclearbit.o := arm-linux-gcc -Wp,-MD,arch/arm/lib/.testclearbit.o.d  -nostdinc -isystem /work/tools/gcc-3.4.5-glibc-2.3.6/lib/gcc/arm-linux/3.4.5/include -D__KERNEL__ -Iinclude  -include include/linux/autoconf.h -mlittle-endian -D__ASSEMBLY__ -mapcs-32 -mno-thumb-interwork -D__LINUX_ARM_ARCH__=4 -march=armv4t -mtune=arm9tdmi -msoft-float -gdwarf2    -c -o arch/arm/lib/testclearbit.o arch/arm/lib/testclearbit.S

deps_arch/arm/lib/testclearbit.o := \
  arch/arm/lib/testclearbit.S \
  include/linux/linkage.h \
  include/asm/linkage.h \
  include/asm/assembler.h \
  include/asm/ptrace.h \
    $(wildcard include/config/arm/thumb.h) \
    $(wildcard include/config/smp.h) \
  arch/arm/lib/bitops.h \
    $(wildcard include/config/cpu/32v6k.h) \

arch/arm/lib/testclearbit.o: $(deps_arch/arm/lib/testclearbit.o)

$(deps_arch/arm/lib/testclearbit.o):
