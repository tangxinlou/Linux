cmd_arch/arm/mach-s3c2410/sleep.o := arm-linux-gcc -Wp,-MD,arch/arm/mach-s3c2410/.sleep.o.d  -nostdinc -isystem /work/tools/gcc-3.4.5-glibc-2.3.6/lib/gcc/arm-linux/3.4.5/include -D__KERNEL__ -Iinclude  -include include/linux/autoconf.h -mlittle-endian -D__ASSEMBLY__ -mapcs-32 -mno-thumb-interwork -D__LINUX_ARM_ARCH__=4 -march=armv4t -mtune=arm9tdmi -msoft-float -gdwarf2    -c -o arch/arm/mach-s3c2410/sleep.o arch/arm/mach-s3c2410/sleep.S

deps_arch/arm/mach-s3c2410/sleep.o := \
  arch/arm/mach-s3c2410/sleep.S \
  include/linux/linkage.h \
  include/asm/linkage.h \
  include/asm/assembler.h \
  include/asm/ptrace.h \
    $(wildcard include/config/arm/thumb.h) \
    $(wildcard include/config/smp.h) \
  include/asm/hardware.h \
  include/asm/arch/hardware.h \
    $(wildcard include/config/cpu/s3c2400.h) \
    $(wildcard include/config/cpu/s3c2440.h) \
    $(wildcard include/config/no/multiword/io.h) \
  include/asm/sizes.h \
  include/asm/arch/map.h \
    $(wildcard include/config/cpu/s3c2412.h) \
    $(wildcard include/config/cpu/s3c2413.h) \
    $(wildcard include/config/cpu/s3c2412/only.h) \
  include/asm/arch/regs-gpio.h \
  include/asm/arch/regs-clock.h \
    $(wildcard include/config/cpu/s3c2442.h) \
  include/asm/arch/regs-mem.h \
  include/asm/arch/regs-serial.h \

arch/arm/mach-s3c2410/sleep.o: $(deps_arch/arm/mach-s3c2410/sleep.o)

$(deps_arch/arm/mach-s3c2410/sleep.o):
