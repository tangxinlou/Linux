cmd_arch/arm/mm/init.o := arm-linux-gcc -Wp,-MD,arch/arm/mm/.init.o.d  -nostdinc -isystem /work/tools/gcc-3.4.5-glibc-2.3.6/lib/gcc/arm-linux/3.4.5/include -D__KERNEL__ -Iinclude  -include include/linux/autoconf.h -mlittle-endian -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Os -marm -fno-omit-frame-pointer -mapcs -mno-sched-prolog -mapcs-32 -mno-thumb-interwork -D__LINUX_ARM_ARCH__=4 -march=armv4t -mtune=arm9tdmi -malignment-traps -msoft-float -Uarm -fno-omit-frame-pointer -fno-optimize-sibling-calls -g  -Wdeclaration-after-statement     -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(init)"  -D"KBUILD_MODNAME=KBUILD_STR(init)" -c -o arch/arm/mm/init.o arch/arm/mm/init.c

deps_arch/arm/mm/init.o := \
  arch/arm/mm/init.c \
    $(wildcard include/config/blk/dev/initrd.h) \
    $(wildcard include/config/mmu.h) \
    $(wildcard include/config/discontigmem.h) \
    $(wildcard include/config/sa1111.h) \
  include/linux/kernel.h \
    $(wildcard include/config/preempt/voluntary.h) \
    $(wildcard include/config/debug/spinlock/sleep.h) \
    $(wildcard include/config/printk.h) \
    $(wildcard include/config/numa.h) \
  /work/tools/gcc-3.4.5-glibc-2.3.6/lib/gcc/arm-linux/3.4.5/include/stdarg.h \
  include/linux/linkage.h \
  include/asm/linkage.h \
  include/linux/stddef.h \
  include/linux/compiler.h \
    $(wildcard include/config/enable/must/check.h) \
  include/linux/compiler-gcc3.h \
  include/linux/compiler-gcc.h \
  include/linux/types.h \
    $(wildcard include/config/uid16.h) \
    $(wildcard include/config/lbd.h) \
    $(wildcard include/config/lsf.h) \
    $(wildcard include/config/resources/64bit.h) \
  include/linux/posix_types.h \
  include/asm/posix_types.h \
  include/asm/types.h \
  include/linux/bitops.h \
  include/asm/bitops.h \
    $(wildcard include/config/smp.h) \
  include/asm/system.h \
    $(wildcard include/config/cpu/cp15.h) \
    $(wildcard include/config/cpu/xsc3.h) \
    $(wildcard include/config/cpu/xscale.h) \
    $(wildcard include/config/cpu/sa1100.h) \
    $(wildcard include/config/cpu/sa110.h) \
  include/asm/memory.h \
    $(wildcard include/config/dram/size.h) \
    $(wildcard include/config/dram/base.h) \
  include/asm/arch/memory.h \
    $(wildcard include/config/cpu/s3c2400.h) \
  include/asm/sizes.h \
  include/asm-generic/memory_model.h \
    $(wildcard include/config/flatmem.h) \
    $(wildcard include/config/sparsemem.h) \
    $(wildcard include/config/out/of/line/pfn/to/page.h) \
  include/linux/irqflags.h \
    $(wildcard include/config/trace/irqflags.h) \
    $(wildcard include/config/trace/irqflags/support.h) \
    $(wildcard include/config/x86.h) \
  include/asm/irqflags.h \
  include/asm/ptrace.h \
    $(wildcard include/config/arm/thumb.h) \
  include/asm-generic/bitops/non-atomic.h \
  include/asm-generic/bitops/ffz.h \
  include/asm-generic/bitops/__ffs.h \
  include/asm-generic/bitops/fls.h \
  include/asm-generic/bitops/ffs.h \
  include/asm-generic/bitops/fls64.h \
  include/asm-generic/bitops/sched.h \
  include/asm-generic/bitops/hweight.h \
  include/linux/log2.h \
    $(wildcard include/config/arch/has/ilog2/u32.h) \
    $(wildcard include/config/arch/has/ilog2/u64.h) \
  include/asm/byteorder.h \
  include/linux/byteorder/little_endian.h \
  include/linux/byteorder/swab.h \
  include/linux/byteorder/generic.h \
  include/asm/bug.h \
    $(wildcard include/config/bug.h) \
    $(wildcard include/config/debug/bugverbose.h) \
  include/asm-generic/bug.h \
    $(wildcard include/config/generic/bug.h) \
  include/linux/errno.h \
  include/asm/errno.h \
  include/asm-generic/errno.h \
  include/asm-generic/errno-base.h \
  include/linux/swap.h \
    $(wildcard include/config/migration.h) \
    $(wildcard include/config/swap.h) \
  include/linux/spinlock.h \
    $(wildcard include/config/debug/spinlock.h) \
    $(wildcard include/config/preempt.h) \
    $(wildcard include/config/debug/lock/alloc.h) \
  include/linux/preempt.h \
    $(wildcard include/config/debug/preempt.h) \
  include/linux/thread_info.h \
  include/asm/thread_info.h \
    $(wildcard include/config/debug/stack/usage.h) \
  include/asm/fpstate.h \
    $(wildcard include/config/iwmmxt.h) \
  include/asm/domain.h \
    $(wildcard include/config/io/36.h) \
  include/linux/stringify.h \
  include/linux/bottom_half.h \
  include/linux/spinlock_types.h \
  include/linux/lockdep.h \
    $(wildcard include/config/lockdep.h) \
    $(wildcard include/config/generic/hardirqs.h) \
    $(wildcard include/config/prove/locking.h) \
  include/linux/spinlock_types_up.h \
  include/linux/spinlock_up.h \
  include/linux/spinlock_api_up.h \
  include/asm/atomic.h \
  include/asm-generic/atomic.h \
  include/linux/mmzone.h \
    $(wildcard include/config/force/max/zoneorder.h) \
    $(wildcard include/config/zone/dma.h) \
    $(wildcard include/config/zone/dma32.h) \
    $(wildcard include/config/highmem.h) \
    $(wildcard include/config/memory/hotplug.h) \
    $(wildcard include/config/arch/populates/node/map.h) \
    $(wildcard include/config/flat/node/mem/map.h) \
    $(wildcard include/config/have/memory/present.h) \
    $(wildcard include/config/need/node/memmap/size.h) \
    $(wildcard include/config/need/multiple/nodes.h) \
    $(wildcard include/config/have/arch/early/pfn/to/nid.h) \
    $(wildcard include/config/sparsemem/extreme.h) \
    $(wildcard include/config/nodes/span/other/nodes.h) \
    $(wildcard include/config/holes/in/zone.h) \
  include/linux/list.h \
    $(wildcard include/config/debug/list.h) \
  include/linux/poison.h \
  include/linux/prefetch.h \
  include/asm/processor.h \
  include/asm/cache.h \
  include/linux/wait.h \
  include/asm/current.h \
  include/linux/cache.h \
  include/linux/threads.h \
    $(wildcard include/config/nr/cpus.h) \
    $(wildcard include/config/base/small.h) \
  include/linux/numa.h \
    $(wildcard include/config/nodes/shift.h) \
  include/linux/init.h \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/hotplug.h) \
    $(wildcard include/config/hotplug/cpu.h) \
    $(wildcard include/config/acpi/hotplug/memory.h) \
  include/linux/seqlock.h \
  include/linux/nodemask.h \
  include/linux/bitmap.h \
  include/linux/string.h \
  include/asm/string.h \
  include/asm/page.h \
    $(wildcard include/config/cpu/copy/v3.h) \
    $(wildcard include/config/cpu/copy/v4wt.h) \
    $(wildcard include/config/cpu/copy/v4wb.h) \
    $(wildcard include/config/cpu/copy/v6.h) \
    $(wildcard include/config/aeabi.h) \
  include/asm/glue.h \
    $(wildcard include/config/cpu/arm610.h) \
    $(wildcard include/config/cpu/arm710.h) \
    $(wildcard include/config/cpu/abrt/lv4t.h) \
    $(wildcard include/config/cpu/abrt/ev4.h) \
    $(wildcard include/config/cpu/abrt/ev4t.h) \
    $(wildcard include/config/cpu/abrt/ev5tj.h) \
    $(wildcard include/config/cpu/abrt/ev5t.h) \
    $(wildcard include/config/cpu/abrt/ev6.h) \
    $(wildcard include/config/cpu/abrt/ev7.h) \
  include/asm-generic/page.h \
  include/linux/memory_hotplug.h \
    $(wildcard include/config/have/arch/nodedata/extension.h) \
  include/linux/notifier.h \
  include/linux/mutex.h \
    $(wildcard include/config/debug/mutexes.h) \
  include/linux/rwsem.h \
    $(wildcard include/config/rwsem/generic/spinlock.h) \
  include/linux/rwsem-spinlock.h \
  include/linux/srcu.h \
  include/linux/topology.h \
    $(wildcard include/config/sched/smt.h) \
    $(wildcard include/config/sched/mc.h) \
  include/linux/cpumask.h \
  include/linux/smp.h \
  include/asm/topology.h \
  include/asm-generic/topology.h \
  include/linux/sched.h \
    $(wildcard include/config/no/hz.h) \
    $(wildcard include/config/detect/softlockup.h) \
    $(wildcard include/config/split/ptlock/cpus.h) \
    $(wildcard include/config/keys.h) \
    $(wildcard include/config/bsd/process/acct.h) \
    $(wildcard include/config/taskstats.h) \
    $(wildcard include/config/inotify/user.h) \
    $(wildcard include/config/schedstats.h) \
    $(wildcard include/config/task/delay/acct.h) \
    $(wildcard include/config/blk/dev/io/trace.h) \
    $(wildcard include/config/cc/stackprotector.h) \
    $(wildcard include/config/sysvipc.h) \
    $(wildcard include/config/rt/mutexes.h) \
    $(wildcard include/config/task/xacct.h) \
    $(wildcard include/config/cpusets.h) \
    $(wildcard include/config/compat.h) \
    $(wildcard include/config/fault/injection.h) \
  include/linux/auxvec.h \
  include/asm/auxvec.h \
  include/asm/param.h \
    $(wildcard include/config/hz.h) \
  include/linux/capability.h \
  include/linux/timex.h \
    $(wildcard include/config/time/interpolation.h) \
  include/linux/time.h \
  include/asm/timex.h \
  include/asm/arch/timex.h \
  include/linux/jiffies.h \
  include/linux/calc64.h \
  include/asm/div64.h \
  include/linux/rbtree.h \
  include/asm/semaphore.h \
  include/asm/locks.h \
  include/asm/mmu.h \
    $(wildcard include/config/cpu/has/asid.h) \
  include/asm/cputime.h \
  include/asm-generic/cputime.h \
  include/linux/sem.h \
  include/linux/ipc.h \
    $(wildcard include/config/ipc/ns.h) \
  include/asm/ipcbuf.h \
  include/linux/kref.h \
  include/asm/sembuf.h \
  include/linux/signal.h \
  include/asm/signal.h \
  include/asm-generic/signal.h \
  include/asm/sigcontext.h \
  include/asm/siginfo.h \
  include/asm-generic/siginfo.h \
  include/linux/securebits.h \
  include/linux/fs_struct.h \
  include/linux/completion.h \
  include/linux/pid.h \
  include/linux/rcupdate.h \
  include/linux/percpu.h \
  include/linux/slab.h \
    $(wildcard include/config/slab/debug.h) \
    $(wildcard include/config/slab.h) \
    $(wildcard include/config/slub.h) \
    $(wildcard include/config/debug/slab.h) \
  include/linux/gfp.h \
  include/linux/slab_def.h \
  include/linux/kmalloc_sizes.h \
  include/asm/percpu.h \
  include/asm-generic/percpu.h \
  include/linux/seccomp.h \
    $(wildcard include/config/seccomp.h) \
  include/linux/futex.h \
    $(wildcard include/config/futex.h) \
  include/linux/rtmutex.h \
    $(wildcard include/config/debug/rt/mutexes.h) \
  include/linux/plist.h \
    $(wildcard include/config/debug/pi/list.h) \
  include/linux/param.h \
  include/linux/resource.h \
  include/asm/resource.h \
  include/asm-generic/resource.h \
  include/linux/timer.h \
    $(wildcard include/config/timer/stats.h) \
  include/linux/ktime.h \
    $(wildcard include/config/ktime/scalar.h) \
  include/linux/hrtimer.h \
    $(wildcard include/config/high/res/timers.h) \
  include/linux/task_io_accounting.h \
    $(wildcard include/config/task/io/accounting.h) \
  include/linux/aio.h \
  include/linux/workqueue.h \
  include/linux/aio_abi.h \
  include/linux/uio.h \
  include/linux/bootmem.h \
    $(wildcard include/config/crash/dump.h) \
    $(wildcard include/config/have/arch/bootmem/node.h) \
    $(wildcard include/config/have/arch/alloc/remap.h) \
    $(wildcard include/config/ia64.h) \
    $(wildcard include/config/x86/64.h) \
  include/asm/dma.h \
    $(wildcard include/config/pci.h) \
  include/asm/scatterlist.h \
  include/asm/arch/dma.h \
    $(wildcard include/config/cpu/s3c2443.h) \
    $(wildcard include/config/cpu/s3c2440.h) \
    $(wildcard include/config/cpu/s3c2412.h) \
  include/linux/sysdev.h \
  include/linux/kobject.h \
  include/linux/sysfs.h \
    $(wildcard include/config/sysfs.h) \
  include/linux/module.h \
    $(wildcard include/config/modversions.h) \
    $(wildcard include/config/unused/symbols.h) \
    $(wildcard include/config/kgdb.h) \
    $(wildcard include/config/module/unload.h) \
    $(wildcard include/config/kallsyms.h) \
  include/linux/stat.h \
  include/asm/stat.h \
  include/linux/kmod.h \
    $(wildcard include/config/kmod.h) \
  include/linux/elf.h \
  include/linux/elf-em.h \
  include/asm/elf.h \
  include/asm/user.h \
  include/linux/moduleparam.h \
  include/asm/local.h \
  include/asm-generic/local.h \
  include/linux/hardirq.h \
    $(wildcard include/config/preempt/bkl.h) \
    $(wildcard include/config/virt/cpu/accounting.h) \
  include/linux/smp_lock.h \
    $(wildcard include/config/lock/kernel.h) \
  include/asm/hardirq.h \
  include/asm/irq.h \
  include/asm/arch/irqs.h \
  include/linux/irq_cpustat.h \
  include/asm/module.h \
  include/linux/pm.h \
    $(wildcard include/config/pm.h) \
  include/asm/hardware.h \
  include/asm/arch/hardware.h \
    $(wildcard include/config/no/multiword/io.h) \
  include/asm/arch/map.h \
    $(wildcard include/config/cpu/s3c2413.h) \
    $(wildcard include/config/cpu/s3c2412/only.h) \
  include/linux/mman.h \
  include/asm/mman.h \
  include/asm-generic/mman.h \
  include/linux/mm.h \
    $(wildcard include/config/sysctl.h) \
    $(wildcard include/config/stack/growsup.h) \
    $(wildcard include/config/debug/vm.h) \
    $(wildcard include/config/shmem.h) \
    $(wildcard include/config/proc/fs.h) \
    $(wildcard include/config/debug/pagealloc.h) \
  include/linux/prio_tree.h \
  include/linux/fs.h \
    $(wildcard include/config/dnotify.h) \
    $(wildcard include/config/quota.h) \
    $(wildcard include/config/inotify.h) \
    $(wildcard include/config/security.h) \
    $(wildcard include/config/epoll.h) \
    $(wildcard include/config/auditsyscall.h) \
    $(wildcard include/config/block.h) \
    $(wildcard include/config/fs/xip.h) \
  include/linux/limits.h \
  include/linux/ioctl.h \
  include/asm/ioctl.h \
  include/asm-generic/ioctl.h \
  include/linux/kdev_t.h \
  include/linux/dcache.h \
    $(wildcard include/config/profiling.h) \
  include/linux/namei.h \
  include/linux/radix-tree.h \
  include/linux/quota.h \
  include/linux/dqblk_xfs.h \
  include/linux/dqblk_v1.h \
  include/linux/dqblk_v2.h \
  include/linux/nfs_fs_i.h \
  include/linux/nfs.h \
  include/linux/sunrpc/msg_prot.h \
  include/linux/fcntl.h \
  include/asm/fcntl.h \
  include/asm-generic/fcntl.h \
    $(wildcard include/config/64bit.h) \
  include/linux/err.h \
  include/linux/debug_locks.h \
    $(wildcard include/config/debug/locking/api/selftests.h) \
  include/linux/backing-dev.h \
  include/linux/mm_types.h \
  include/asm/pgtable.h \
  include/asm-generic/4level-fixup.h \
  include/asm/proc-fns.h \
    $(wildcard include/config/cpu/32.h) \
    $(wildcard include/config/cpu/arm7tdmi.h) \
    $(wildcard include/config/cpu/arm720t.h) \
    $(wildcard include/config/cpu/arm740t.h) \
    $(wildcard include/config/cpu/arm9tdmi.h) \
    $(wildcard include/config/cpu/arm920t.h) \
    $(wildcard include/config/cpu/arm922t.h) \
    $(wildcard include/config/cpu/arm925t.h) \
    $(wildcard include/config/cpu/arm926t.h) \
    $(wildcard include/config/cpu/arm940t.h) \
    $(wildcard include/config/cpu/arm946e.h) \
    $(wildcard include/config/cpu/arm1020.h) \
    $(wildcard include/config/cpu/arm1020e.h) \
    $(wildcard include/config/cpu/arm1022.h) \
    $(wildcard include/config/cpu/arm1026.h) \
    $(wildcard include/config/cpu/v6.h) \
    $(wildcard include/config/cpu/v7.h) \
  include/asm/cpu-multi32.h \
  include/asm/arch/vmalloc.h \
  include/asm/pgtable-hwdef.h \
  include/asm-generic/pgtable.h \
  include/linux/page-flags.h \
    $(wildcard include/config/s390.h) \
  include/linux/vmstat.h \
    $(wildcard include/config/vm/event/counters.h) \
  include/linux/initrd.h \
  include/asm/mach-types.h \
    $(wildcard include/config/arch/ebsa110.h) \
    $(wildcard include/config/arch/rpc.h) \
    $(wildcard include/config/arch/nexuspci.h) \
    $(wildcard include/config/arch/ebsa285.h) \
    $(wildcard include/config/arch/netwinder.h) \
    $(wildcard include/config/arch/cats.h) \
    $(wildcard include/config/arch/tbox.h) \
    $(wildcard include/config/arch/co285.h) \
    $(wildcard include/config/arch/clps7110.h) \
    $(wildcard include/config/arch/arc.h) \
    $(wildcard include/config/arch/a5k.h) \
    $(wildcard include/config/arch/etoile.h) \
    $(wildcard include/config/arch/lacie/nas.h) \
    $(wildcard include/config/arch/clps7500.h) \
    $(wildcard include/config/arch/shark.h) \
    $(wildcard include/config/sa1100/brutus.h) \
    $(wildcard include/config/arch/personal/server.h) \
    $(wildcard include/config/sa1100/itsy.h) \
    $(wildcard include/config/arch/l7200.h) \
    $(wildcard include/config/sa1100/pleb.h) \
    $(wildcard include/config/arch/integrator.h) \
    $(wildcard include/config/sa1100/h3600.h) \
    $(wildcard include/config/arch/ixp1200.h) \
    $(wildcard include/config/arch/p720t.h) \
    $(wildcard include/config/sa1100/assabet.h) \
    $(wildcard include/config/sa1100/victor.h) \
    $(wildcard include/config/sa1100/lart.h) \
    $(wildcard include/config/sa1100/ranger.h) \
    $(wildcard include/config/sa1100/graphicsclient.h) \
    $(wildcard include/config/sa1100/xp860.h) \
    $(wildcard include/config/sa1100/cerf.h) \
    $(wildcard include/config/sa1100/nanoengine.h) \
    $(wildcard include/config/sa1100/fpic.h) \
    $(wildcard include/config/sa1100/extenex1.h) \
    $(wildcard include/config/sa1100/sherman.h) \
    $(wildcard include/config/sa1100/accelent.h) \
    $(wildcard include/config/arch/l7200/accelent.h) \
    $(wildcard include/config/sa1100/netport.h) \
    $(wildcard include/config/sa1100/pangolin.h) \
    $(wildcard include/config/sa1100/yopy.h) \
    $(wildcard include/config/sa1100/coolidge.h) \
    $(wildcard include/config/sa1100/huw/webpanel.h) \
    $(wildcard include/config/arch/spotme.h) \
    $(wildcard include/config/arch/freebird.h) \
    $(wildcard include/config/arch/ti925.h) \
    $(wildcard include/config/arch/riscstation.h) \
    $(wildcard include/config/sa1100/cavy.h) \
    $(wildcard include/config/sa1100/jornada720.h) \
    $(wildcard include/config/sa1100/omnimeter.h) \
    $(wildcard include/config/arch/edb7211.h) \
    $(wildcard include/config/sa1100/citygo.h) \
    $(wildcard include/config/sa1100/pfs168.h) \
    $(wildcard include/config/sa1100/spot.h) \
    $(wildcard include/config/sa1100/flexanet.h) \
    $(wildcard include/config/arch/webpal.h) \
    $(wildcard include/config/sa1100/linpda.h) \
    $(wildcard include/config/arch/anakin.h) \
    $(wildcard include/config/sa1100/mvi.h) \
    $(wildcard include/config/sa1100/jupiter.h) \
    $(wildcard include/config/arch/psionw.h) \
    $(wildcard include/config/sa1100/aln.h) \
    $(wildcard include/config/arch/camelot.h) \
    $(wildcard include/config/sa1100/gds2200.h) \
    $(wildcard include/config/sa1100/psion/series7.h) \
    $(wildcard include/config/sa1100/xfile.h) \
    $(wildcard include/config/arch/accelent/ep9312.h) \
    $(wildcard include/config/arch/ic200.h) \
    $(wildcard include/config/sa1100/creditlart.h) \
    $(wildcard include/config/sa1100/htm.h) \
    $(wildcard include/config/arch/iq80310.h) \
    $(wildcard include/config/sa1100/freebot.h) \
    $(wildcard include/config/arch/entel.h) \
    $(wildcard include/config/arch/enp3510.h) \
    $(wildcard include/config/sa1100/trizeps.h) \
    $(wildcard include/config/sa1100/nesa.h) \
    $(wildcard include/config/arch/venus.h) \
    $(wildcard include/config/arch/tardis.h) \
    $(wildcard include/config/arch/mercury.h) \
    $(wildcard include/config/sa1100/empeg.h) \
    $(wildcard include/config/arch/i80200fcc.h) \
    $(wildcard include/config/sa1100/itt/cpb.h) \
    $(wildcard include/config/sa1100/svc.h) \
    $(wildcard include/config/sa1100/alpha2.h) \
    $(wildcard include/config/sa1100/alpha1.h) \
    $(wildcard include/config/arch/netarm.h) \
    $(wildcard include/config/sa1100/simpad.h) \
    $(wildcard include/config/arch/pda1.h) \
    $(wildcard include/config/arch/lubbock.h) \
    $(wildcard include/config/arch/aniko.h) \
    $(wildcard include/config/arch/clep7212.h) \
    $(wildcard include/config/arch/cs89712.h) \
    $(wildcard include/config/sa1100/weararm.h) \
    $(wildcard include/config/sa1100/possio/px.h) \
    $(wildcard include/config/sa1100/sidearm.h) \
    $(wildcard include/config/sa1100/stork.h) \
    $(wildcard include/config/sa1100/shannon.h) \
    $(wildcard include/config/arch/ace.h) \
    $(wildcard include/config/sa1100/ballyarm.h) \
    $(wildcard include/config/sa1100/simputer.h) \
    $(wildcard include/config/sa1100/nexterm.h) \
    $(wildcard include/config/sa1100/sa1100/elf.h) \
    $(wildcard include/config/sa1100/gator.h) \
    $(wildcard include/config/arch/granite.h) \
    $(wildcard include/config/sa1100/consus.h) \
    $(wildcard include/config/arch/aaed2000.h) \
    $(wildcard include/config/arch/cdb89712.h) \
    $(wildcard include/config/sa1100/graphicsmaster.h) \
    $(wildcard include/config/sa1100/adsbitsy.h) \
    $(wildcard include/config/arch/pxa/idp.h) \
    $(wildcard include/config/arch/plce.h) \
    $(wildcard include/config/sa1100/pt/system3.h) \
    $(wildcard include/config/arch/medalb.h) \
    $(wildcard include/config/arch/eagle.h) \
    $(wildcard include/config/arch/dsc21.h) \
    $(wildcard include/config/arch/dsc24.h) \
    $(wildcard include/config/arch/ti5472.h) \
    $(wildcard include/config/arch/autcpu12.h) \
    $(wildcard include/config/arch/uengine.h) \
    $(wildcard include/config/sa1100/bluestem.h) \
    $(wildcard include/config/arch/xingu8.h) \
    $(wildcard include/config/arch/bushstb.h) \
    $(wildcard include/config/sa1100/epsilon1.h) \
    $(wildcard include/config/sa1100/balloon.h) \
    $(wildcard include/config/arch/puppy.h) \
    $(wildcard include/config/sa1100/elroy.h) \
    $(wildcard include/config/arch/gms720.h) \
    $(wildcard include/config/arch/s24x.h) \
    $(wildcard include/config/arch/jtel/clep7312.h) \
    $(wildcard include/config/arch/cx821xx.h) \
    $(wildcard include/config/arch/edb7312.h) \
    $(wildcard include/config/sa1100/bsa1110.h) \
    $(wildcard include/config/arch/powerpin.h) \
    $(wildcard include/config/arch/openarm.h) \
    $(wildcard include/config/sa1100/whitechapel.h) \
    $(wildcard include/config/sa1100/h3100.h) \
    $(wildcard include/config/sa1100/h3800.h) \
    $(wildcard include/config/arch/blue/v1.h) \
    $(wildcard include/config/arch/pxa/cerf.h) \
    $(wildcard include/config/arch/arm7tevb.h) \
    $(wildcard include/config/sa1100/d7400.h) \
    $(wildcard include/config/arch/piranha.h) \
    $(wildcard include/config/sa1100/sbcamelot.h) \
    $(wildcard include/config/sa1100/kings.h) \
    $(wildcard include/config/arch/smdk2400.h) \
    $(wildcard include/config/sa1100/collie.h) \
    $(wildcard include/config/arch/idr.h) \
    $(wildcard include/config/sa1100/badge4.h) \
    $(wildcard include/config/arch/webnet.h) \
    $(wildcard include/config/sa1100/d7300.h) \
    $(wildcard include/config/sa1100/cep.h) \
    $(wildcard include/config/arch/fortunet.h) \
    $(wildcard include/config/arch/vc547x.h) \
    $(wildcard include/config/sa1100/filewalker.h) \
    $(wildcard include/config/sa1100/netgateway.h) \
    $(wildcard include/config/sa1100/symbol2800.h) \
    $(wildcard include/config/sa1100/suns.h) \
    $(wildcard include/config/sa1100/frodo.h) \
    $(wildcard include/config/sa1100/mach/tyte/ms301.h) \
    $(wildcard include/config/arch/mx1ads.h) \
    $(wildcard include/config/arch/h7201.h) \
    $(wildcard include/config/arch/h7202.h) \
    $(wildcard include/config/arch/amico.h) \
    $(wildcard include/config/sa1100/iam.h) \
    $(wildcard include/config/sa1100/tt530.h) \
    $(wildcard include/config/arch/sam2400.h) \
    $(wildcard include/config/sa1100/jornada56x.h) \
    $(wildcard include/config/sa1100/active.h) \
    $(wildcard include/config/arch/iq80321.h) \
    $(wildcard include/config/sa1100/wid.h) \
    $(wildcard include/config/arch/sabinal.h) \
    $(wildcard include/config/arch/ixp425/matacumbe.h) \
    $(wildcard include/config/sa1100/miniprint.h) \
    $(wildcard include/config/arch/adm510x.h) \
    $(wildcard include/config/sa1100/svs200.h) \
    $(wildcard include/config/arch/atg/tcu.h) \
    $(wildcard include/config/sa1100/jornada820.h) \
    $(wildcard include/config/arch/s3c44b0.h) \
    $(wildcard include/config/arch/margis2.h) \
    $(wildcard include/config/arch/ks8695.h) \
    $(wildcard include/config/arch/brh.h) \
    $(wildcard include/config/arch/s3c2410.h) \
    $(wildcard include/config/arch/possio/px30.h) \
    $(wildcard include/config/arch/s3c2800.h) \
    $(wildcard include/config/sa1100/fleetwood.h) \
    $(wildcard include/config/arch/omaha.h) \
    $(wildcard include/config/arch/ta7.h) \
    $(wildcard include/config/sa1100/nova.h) \
    $(wildcard include/config/arch/hmk.h) \
    $(wildcard include/config/arch/karo.h) \
    $(wildcard include/config/sa1100/fester.h) \
    $(wildcard include/config/arch/gpi.h) \
    $(wildcard include/config/arch/smdk2410.h) \
    $(wildcard include/config/arch/i519.h) \
    $(wildcard include/config/sa1100/nexio.h) \
    $(wildcard include/config/sa1100/bitbox.h) \
    $(wildcard include/config/sa1100/g200.h) \
    $(wildcard include/config/sa1100/gill.h) \
    $(wildcard include/config/arch/pxa/mercury.h) \
    $(wildcard include/config/arch/ceiva.h) \
    $(wildcard include/config/sa1100/fret.h) \
    $(wildcard include/config/sa1100/emailphone.h) \
    $(wildcard include/config/arch/h3900.h) \
    $(wildcard include/config/arch/pxa1.h) \
    $(wildcard include/config/sa1100/koan369.h) \
    $(wildcard include/config/arch/cogent.h) \
    $(wildcard include/config/arch/esl/simputer.h) \
    $(wildcard include/config/arch/esl/simputer/clr.h) \
    $(wildcard include/config/arch/esl/simputer/bw.h) \
    $(wildcard include/config/arch/hhp/cradle.h) \
    $(wildcard include/config/arch/he500.h) \
    $(wildcard include/config/sa1100/inhandelf2.h) \
    $(wildcard include/config/sa1100/inhandftip.h) \
    $(wildcard include/config/sa1100/dnp1110.h) \
    $(wildcard include/config/sa1100/pnp1110.h) \
    $(wildcard include/config/arch/csb226.h) \
    $(wildcard include/config/sa1100/arnold.h) \
    $(wildcard include/config/mach/voiceblue.h) \
    $(wildcard include/config/arch/jz8028.h) \
    $(wildcard include/config/arch/h5400.h) \
    $(wildcard include/config/sa1100/forte.h) \
    $(wildcard include/config/sa1100/acam.h) \
    $(wildcard include/config/sa1100/abox.h) \
    $(wildcard include/config/arch/atmel.h) \
    $(wildcard include/config/arch/sitsang.h) \
    $(wildcard include/config/sa1100/cpu1110lcdnet.h) \
    $(wildcard include/config/arch/mpl/vcma9.h) \
    $(wildcard include/config/arch/opus/a1.h) \
    $(wildcard include/config/arch/daytona.h) \
    $(wildcard include/config/sa1100/killbear.h) \
    $(wildcard include/config/arch/yoho.h) \
    $(wildcard include/config/arch/jasper.h) \
    $(wildcard include/config/arch/dsc25.h) \
    $(wildcard include/config/mach/omap/innovator.h) \
    $(wildcard include/config/arch/ramses.h) \
    $(wildcard include/config/arch/s28x.h) \
    $(wildcard include/config/arch/mport3.h) \
    $(wildcard include/config/arch/pxa/eagle250.h) \
    $(wildcard include/config/arch/pdb.h) \
    $(wildcard include/config/sa1100/blue/2g.h) \
    $(wildcard include/config/sa1100/bluearch.h) \
    $(wildcard include/config/arch/ixdp2400.h) \
    $(wildcard include/config/arch/ixdp2800.h) \
    $(wildcard include/config/sa1100/explorer.h) \
    $(wildcard include/config/arch/ixdp425.h) \
    $(wildcard include/config/arch/chimp.h) \
    $(wildcard include/config/arch/stork/nest.h) \
    $(wildcard include/config/arch/stork/egg.h) \
    $(wildcard include/config/sa1100/wismo.h) \
    $(wildcard include/config/arch/ezlinx.h) \
    $(wildcard include/config/arch/at91rm9200.h) \
    $(wildcard include/config/arch/orion.h) \
    $(wildcard include/config/arch/neptune.h) \
    $(wildcard include/config/sa1100/hackkit.h) \
    $(wildcard include/config/arch/pxa/wins30.h) \
    $(wildcard include/config/sa1100/lavinna.h) \
    $(wildcard include/config/arch/pxa/uengine.h) \
    $(wildcard include/config/arch/innokom.h) \
    $(wildcard include/config/arch/bms.h) \
    $(wildcard include/config/arch/ixcdp1100.h) \
    $(wildcard include/config/arch/prpmc1100.h) \
    $(wildcard include/config/arch/at91rm9200dk.h) \
    $(wildcard include/config/arch/armstick.h) \
    $(wildcard include/config/arch/armonie.h) \
    $(wildcard include/config/arch/mport1.h) \
    $(wildcard include/config/arch/s3c5410.h) \
    $(wildcard include/config/arch/zcp320a.h) \
    $(wildcard include/config/arch/i/box.h) \
    $(wildcard include/config/arch/stlc1502.h) \
    $(wildcard include/config/arch/siren.h) \
    $(wildcard include/config/arch/greenlake.h) \
    $(wildcard include/config/arch/argus.h) \
    $(wildcard include/config/sa1100/combadge.h) \
    $(wildcard include/config/arch/rokepxa.h) \
    $(wildcard include/config/arch/cintegrator.h) \
    $(wildcard include/config/arch/guidea07.h) \
    $(wildcard include/config/arch/tat257.h) \
    $(wildcard include/config/arch/igp2425.h) \
    $(wildcard include/config/arch/bluegramma.h) \
    $(wildcard include/config/arch/ipod.h) \
    $(wildcard include/config/arch/adsbitsyx.h) \
    $(wildcard include/config/arch/trizeps2.h) \
    $(wildcard include/config/arch/viper.h) \
    $(wildcard include/config/sa1100/adsbitsyplus.h) \
    $(wildcard include/config/sa1100/adsagc.h) \
    $(wildcard include/config/arch/stp7312.h) \
    $(wildcard include/config/mach/nx/phnx.h) \
    $(wildcard include/config/arch/wep/ep250.h) \
    $(wildcard include/config/arch/inhandelf3.h) \
    $(wildcard include/config/arch/adi/coyote.h) \
    $(wildcard include/config/arch/iyonix.h) \
    $(wildcard include/config/arch/damicam/sa1110.h) \
    $(wildcard include/config/arch/meg03.h) \
    $(wildcard include/config/arch/pxa/whitechapel.h) \
    $(wildcard include/config/arch/nwsc.h) \
    $(wildcard include/config/arch/nwlarm.h) \
    $(wildcard include/config/arch/ixp425/mguard.h) \
    $(wildcard include/config/arch/pxa/netdcu4.h) \
    $(wildcard include/config/arch/ixdp2401.h) \
    $(wildcard include/config/arch/ixdp2801.h) \
    $(wildcard include/config/arch/zodiac.h) \
    $(wildcard include/config/arch/armmodul.h) \
    $(wildcard include/config/sa1100/ketop.h) \
    $(wildcard include/config/arch/av7200.h) \
    $(wildcard include/config/arch/arch/ti925.h) \
    $(wildcard include/config/arch/acq200.h) \
    $(wildcard include/config/sa1100/pt/dafit.h) \
    $(wildcard include/config/arch/ihba.h) \
    $(wildcard include/config/arch/quinque.h) \
    $(wildcard include/config/arch/nimbraone.h) \
    $(wildcard include/config/arch/nimbra29x.h) \
    $(wildcard include/config/arch/nimbra210.h) \
    $(wildcard include/config/arch/hhp/d95xx.h) \
    $(wildcard include/config/arch/labarm.h) \
    $(wildcard include/config/arch/m825xx.h) \
    $(wildcard include/config/sa1100/m7100.h) \
    $(wildcard include/config/arch/nipc2.h) \
    $(wildcard include/config/arch/fu7202.h) \
    $(wildcard include/config/arch/adsagx.h) \
    $(wildcard include/config/arch/pxa/pooh.h) \
    $(wildcard include/config/arch/bandon.h) \
    $(wildcard include/config/arch/pcm7210.h) \
    $(wildcard include/config/arch/nms9200.h) \
    $(wildcard include/config/arch/logodl.h) \
    $(wildcard include/config/sa1100/m7140.h) \
    $(wildcard include/config/arch/korebot.h) \
    $(wildcard include/config/arch/iq31244.h) \
    $(wildcard include/config/sa1100/koan393.h) \
    $(wildcard include/config/arch/inhandftip3.h) \
    $(wildcard include/config/arch/gonzo.h) \
    $(wildcard include/config/arch/bast.h) \
    $(wildcard include/config/arch/scanpass.h) \
    $(wildcard include/config/arch/ep7312/pooh.h) \
    $(wildcard include/config/arch/ta7s.h) \
    $(wildcard include/config/arch/ta7v.h) \
    $(wildcard include/config/sa1100/icarus.h) \
    $(wildcard include/config/arch/h1900.h) \
    $(wildcard include/config/sa1100/gemini.h) \
    $(wildcard include/config/arch/axim.h) \
    $(wildcard include/config/arch/audiotron.h) \
    $(wildcard include/config/arch/h2200.h) \
    $(wildcard include/config/arch/loox600.h) \
    $(wildcard include/config/arch/niop.h) \
    $(wildcard include/config/arch/dm310.h) \
    $(wildcard include/config/arch/seedpxa/c2.h) \
    $(wildcard include/config/arch/ixp4xx/mguard/pci.h) \
    $(wildcard include/config/arch/h1940.h) \
    $(wildcard include/config/arch/scorpio.h) \
    $(wildcard include/config/arch/viva.h) \
    $(wildcard include/config/arch/pxa/xcard.h) \
    $(wildcard include/config/arch/csb335.h) \
    $(wildcard include/config/arch/ixrd425.h) \
    $(wildcard include/config/arch/iq80315.h) \
    $(wildcard include/config/arch/nmp7312.h) \
    $(wildcard include/config/arch/cx861xx.h) \
    $(wildcard include/config/arch/enp2611.h) \
    $(wildcard include/config/sa1100/xda.h) \
    $(wildcard include/config/arch/csir/ims.h) \
    $(wildcard include/config/arch/ixp421/dnaeeth.h) \
    $(wildcard include/config/arch/pocketserv9200.h) \
    $(wildcard include/config/arch/toto.h) \
    $(wildcard include/config/arch/s3c2440.h) \
    $(wildcard include/config/arch/ks8695p.h) \
    $(wildcard include/config/arch/se4000.h) \
    $(wildcard include/config/arch/quadriceps.h) \
    $(wildcard include/config/arch/bronco.h) \
    $(wildcard include/config/arch/esl/sofcomp.h) \
    $(wildcard include/config/arch/s5c7375.h) \
    $(wildcard include/config/arch/spearhead.h) \
    $(wildcard include/config/arch/pantera.h) \
    $(wildcard include/config/arch/prayoglite.h) \
    $(wildcard include/config/arch/gumstik.h) \
    $(wildcard include/config/arch/rcube.h) \
    $(wildcard include/config/arch/rea/olv.h) \
    $(wildcard include/config/arch/pxa/iphone.h) \
    $(wildcard include/config/arch/s3c3410.h) \
    $(wildcard include/config/arch/espd/4510b.h) \
    $(wildcard include/config/arch/mp1x.h) \
    $(wildcard include/config/arch/at91rm9200tb.h) \
    $(wildcard include/config/arch/adsvgx.h) \
    $(wildcard include/config/mach/omap/h2.h) \
    $(wildcard include/config/arch/pelee.h) \
    $(wildcard include/config/mach/e740.h) \
    $(wildcard include/config/arch/iq80331.h) \
    $(wildcard include/config/arch/versatile/pb.h) \
    $(wildcard include/config/mach/kev7a400.h) \
    $(wildcard include/config/mach/lpd7a400.h) \
    $(wildcard include/config/mach/lpd7a404.h) \
    $(wildcard include/config/arch/fujitsu/camelot.h) \
    $(wildcard include/config/arch/janus2m.h) \
    $(wildcard include/config/mach/embtf.h) \
    $(wildcard include/config/mach/hpm.h) \
    $(wildcard include/config/mach/smdk2410tk.h) \
    $(wildcard include/config/mach/smdk2410aj.h) \
    $(wildcard include/config/mach/streetracer.h) \
    $(wildcard include/config/mach/eframe.h) \
    $(wildcard include/config/mach/csb337.h) \
    $(wildcard include/config/mach/pxa/lark.h) \
    $(wildcard include/config/mach/pnp2110.h) \
    $(wildcard include/config/mach/tcc72x.h) \
    $(wildcard include/config/mach/altair.h) \
    $(wildcard include/config/mach/kc3.h) \
    $(wildcard include/config/mach/sinteftd.h) \
    $(wildcard include/config/mach/mainstone.h) \
    $(wildcard include/config/mach/aday4x.h) \
    $(wildcard include/config/mach/lite300.h) \
    $(wildcard include/config/mach/s5c7376.h) \
    $(wildcard include/config/mach/mt02.h) \
    $(wildcard include/config/mach/mport3s.h) \
    $(wildcard include/config/mach/ra/alpha.h) \
    $(wildcard include/config/mach/xcep.h) \
    $(wildcard include/config/mach/arcom/vulcan.h) \
    $(wildcard include/config/mach/stargate.h) \
    $(wildcard include/config/mach/armadilloj.h) \
    $(wildcard include/config/mach/elroy/jack.h) \
    $(wildcard include/config/mach/backend.h) \
    $(wildcard include/config/mach/s5linbox.h) \
    $(wildcard include/config/mach/nomadik.h) \
    $(wildcard include/config/mach/ia/cpu/9200.h) \
    $(wildcard include/config/mach/at91/bja1.h) \
    $(wildcard include/config/mach/corgi.h) \
    $(wildcard include/config/mach/poodle.h) \
    $(wildcard include/config/mach/ten.h) \
    $(wildcard include/config/mach/roverp5p.h) \
    $(wildcard include/config/mach/sc2700.h) \
    $(wildcard include/config/mach/ex/eagle.h) \
    $(wildcard include/config/mach/nx/pxa12.h) \
    $(wildcard include/config/mach/nx/pxa5.h) \
    $(wildcard include/config/mach/blackboard2.h) \
    $(wildcard include/config/mach/i819.h) \
    $(wildcard include/config/mach/ixmb995e.h) \
    $(wildcard include/config/mach/skyrider.h) \
    $(wildcard include/config/mach/skyhawk.h) \
    $(wildcard include/config/mach/enterprise.h) \
    $(wildcard include/config/mach/dep2410.h) \
    $(wildcard include/config/mach/armcore.h) \
    $(wildcard include/config/mach/hobbit.h) \
    $(wildcard include/config/mach/h7210.h) \
    $(wildcard include/config/mach/pxa/netdcu5.h) \
    $(wildcard include/config/mach/acc.h) \
    $(wildcard include/config/mach/esl/sarva.h) \
    $(wildcard include/config/mach/xm250.h) \
    $(wildcard include/config/mach/t6tc1xb.h) \
    $(wildcard include/config/mach/ess710.h) \
    $(wildcard include/config/mach/mx31ads.h) \
    $(wildcard include/config/mach/himalaya.h) \
    $(wildcard include/config/mach/bolfenk.h) \
    $(wildcard include/config/mach/at91rm9200kr.h) \
    $(wildcard include/config/mach/edb9312.h) \
    $(wildcard include/config/mach/omap/generic.h) \
    $(wildcard include/config/mach/aximx3.h) \
    $(wildcard include/config/mach/eb67xdip.h) \
    $(wildcard include/config/mach/webtxs.h) \
    $(wildcard include/config/mach/hawk.h) \
    $(wildcard include/config/mach/ccat91sbc001.h) \
    $(wildcard include/config/mach/expresso.h) \
    $(wildcard include/config/mach/h4000.h) \
    $(wildcard include/config/mach/dino.h) \
    $(wildcard include/config/mach/ml675k.h) \
    $(wildcard include/config/mach/edb9301.h) \
    $(wildcard include/config/mach/edb9315.h) \
    $(wildcard include/config/mach/reciva/tt.h) \
    $(wildcard include/config/mach/cstcb01.h) \
    $(wildcard include/config/mach/cstcb1.h) \
    $(wildcard include/config/mach/shadwell.h) \
    $(wildcard include/config/mach/goepel263.h) \
    $(wildcard include/config/mach/acq100.h) \
    $(wildcard include/config/mach/mx1fs2.h) \
    $(wildcard include/config/mach/hiptop/g1.h) \
    $(wildcard include/config/mach/sparky.h) \
    $(wildcard include/config/mach/ns9750.h) \
    $(wildcard include/config/mach/phoenix.h) \
    $(wildcard include/config/mach/vr1000.h) \
    $(wildcard include/config/mach/deisterpxa.h) \
    $(wildcard include/config/mach/bcm1160.h) \
    $(wildcard include/config/mach/pcm022.h) \
    $(wildcard include/config/mach/adsgcx.h) \
    $(wildcard include/config/mach/dreadnaught.h) \
    $(wildcard include/config/mach/dm320.h) \
    $(wildcard include/config/mach/markov.h) \
    $(wildcard include/config/mach/cos7a400.h) \
    $(wildcard include/config/mach/milano.h) \
    $(wildcard include/config/mach/ue9328.h) \
    $(wildcard include/config/mach/uex255.h) \
    $(wildcard include/config/mach/ue2410.h) \
    $(wildcard include/config/mach/a620.h) \
    $(wildcard include/config/mach/ocelot.h) \
    $(wildcard include/config/mach/cheetah.h) \
    $(wildcard include/config/mach/omap/perseus2.h) \
    $(wildcard include/config/mach/zvue.h) \
    $(wildcard include/config/mach/roverp1.h) \
    $(wildcard include/config/mach/asidial2.h) \
    $(wildcard include/config/mach/s3c24a0.h) \
    $(wildcard include/config/mach/e800.h) \
    $(wildcard include/config/mach/e750.h) \
    $(wildcard include/config/mach/s3c5500.h) \
    $(wildcard include/config/mach/smdk5500.h) \
    $(wildcard include/config/mach/signalsync.h) \
    $(wildcard include/config/mach/nbc.h) \
    $(wildcard include/config/mach/kodiak.h) \
    $(wildcard include/config/mach/netbookpro.h) \
    $(wildcard include/config/mach/hw90200.h) \
    $(wildcard include/config/mach/condor.h) \
    $(wildcard include/config/mach/cup.h) \
    $(wildcard include/config/mach/kite.h) \
    $(wildcard include/config/mach/scb9328.h) \
    $(wildcard include/config/mach/omap/h3.h) \
    $(wildcard include/config/mach/omap/h4.h) \
    $(wildcard include/config/mach/n10.h) \
    $(wildcard include/config/mach/montajade.h) \
    $(wildcard include/config/mach/sg560.h) \
    $(wildcard include/config/mach/dp1000.h) \
    $(wildcard include/config/mach/omap/osk.h) \
    $(wildcard include/config/mach/rg100v3.h) \
    $(wildcard include/config/mach/mx2ads.h) \
    $(wildcard include/config/mach/pxa/kilo.h) \
    $(wildcard include/config/mach/ixp4xx/eagle.h) \
    $(wildcard include/config/mach/tosa.h) \
    $(wildcard include/config/mach/mb2520f.h) \
    $(wildcard include/config/mach/emc1000.h) \
    $(wildcard include/config/mach/tidsc25.h) \
    $(wildcard include/config/mach/akcpmxl.h) \
    $(wildcard include/config/mach/av3xx.h) \
    $(wildcard include/config/mach/avila.h) \
    $(wildcard include/config/mach/pxa/mpm10.h) \
    $(wildcard include/config/mach/pxa/kyanite.h) \
    $(wildcard include/config/mach/sgold.h) \
    $(wildcard include/config/mach/oscar.h) \
    $(wildcard include/config/mach/epxa4usb2.h) \
    $(wildcard include/config/mach/xsengine.h) \
    $(wildcard include/config/mach/ip600.h) \
    $(wildcard include/config/mach/mcan2.h) \
    $(wildcard include/config/mach/ddi/blueridge.h) \
    $(wildcard include/config/mach/skyminder.h) \
    $(wildcard include/config/mach/lpd79520.h) \
    $(wildcard include/config/mach/edb9302.h) \
    $(wildcard include/config/mach/hw90340.h) \
    $(wildcard include/config/mach/cip/box.h) \
    $(wildcard include/config/mach/ivpn.h) \
    $(wildcard include/config/mach/rsoc2.h) \
    $(wildcard include/config/mach/husky.h) \
    $(wildcard include/config/mach/boxer.h) \
    $(wildcard include/config/mach/shepherd.h) \
    $(wildcard include/config/mach/aml42800aa.h) \
    $(wildcard include/config/mach/mach/type/ml674001.h) \
    $(wildcard include/config/mach/lpc2294.h) \
    $(wildcard include/config/mach/switchgrass.h) \
    $(wildcard include/config/mach/ens/cmu.h) \
    $(wildcard include/config/mach/mm6/sdb.h) \
    $(wildcard include/config/mach/saturn.h) \
    $(wildcard include/config/mach/i30030evb.h) \
    $(wildcard include/config/mach/mxc27530evb.h) \
    $(wildcard include/config/mach/smdk2800.h) \
    $(wildcard include/config/mach/mtwilson.h) \
    $(wildcard include/config/mach/ziti.h) \
    $(wildcard include/config/mach/grandfather.h) \
    $(wildcard include/config/mach/tengine.h) \
    $(wildcard include/config/mach/s3c2460.h) \
    $(wildcard include/config/mach/pdm.h) \
    $(wildcard include/config/mach/h4700.h) \
    $(wildcard include/config/mach/h6300.h) \
    $(wildcard include/config/mach/rz1700.h) \
    $(wildcard include/config/mach/a716.h) \
    $(wildcard include/config/mach/estk2440a.h) \
    $(wildcard include/config/mach/atwixp425.h) \
    $(wildcard include/config/mach/csb336.h) \
    $(wildcard include/config/mach/rirm2.h) \
    $(wildcard include/config/mach/cx23518.h) \
    $(wildcard include/config/mach/cx2351x.h) \
    $(wildcard include/config/mach/computime.h) \
    $(wildcard include/config/mach/izarus.h) \
    $(wildcard include/config/mach/rts.h) \
    $(wildcard include/config/mach/se5100.h) \
    $(wildcard include/config/mach/s3c2510.h) \
    $(wildcard include/config/mach/csb437tl.h) \
    $(wildcard include/config/mach/slauson.h) \
    $(wildcard include/config/mach/pearlriver.h) \
    $(wildcard include/config/mach/tdc/p210.h) \
    $(wildcard include/config/mach/sg580.h) \
    $(wildcard include/config/mach/wrsbcarm7.h) \
    $(wildcard include/config/mach/ipd.h) \
    $(wildcard include/config/mach/pxa/dnp2110.h) \
    $(wildcard include/config/mach/xaeniax.h) \
    $(wildcard include/config/mach/somn4250.h) \
    $(wildcard include/config/mach/pleb2.h) \
    $(wildcard include/config/mach/cornwallis.h) \
    $(wildcard include/config/mach/gurney/drv.h) \
    $(wildcard include/config/mach/chaffee.h) \
    $(wildcard include/config/mach/rms101.h) \
    $(wildcard include/config/mach/rx3715.h) \
    $(wildcard include/config/mach/swift.h) \
    $(wildcard include/config/mach/roverp7.h) \
    $(wildcard include/config/mach/pr818s.h) \
    $(wildcard include/config/mach/trxpro.h) \
    $(wildcard include/config/mach/nslu2.h) \
    $(wildcard include/config/mach/e400.h) \
    $(wildcard include/config/mach/trab.h) \
    $(wildcard include/config/mach/cmc/pu2.h) \
    $(wildcard include/config/mach/fulcrum.h) \
    $(wildcard include/config/mach/netgate42x.h) \
    $(wildcard include/config/mach/str710.h) \
    $(wildcard include/config/mach/ixdpg425.h) \
    $(wildcard include/config/mach/tomtomgo.h) \
    $(wildcard include/config/mach/versatile/ab.h) \
    $(wildcard include/config/mach/edb9307.h) \
    $(wildcard include/config/mach/sg565.h) \
    $(wildcard include/config/mach/lpd79524.h) \
    $(wildcard include/config/mach/lpd79525.h) \
    $(wildcard include/config/mach/rms100.h) \
    $(wildcard include/config/mach/kb9200.h) \
    $(wildcard include/config/mach/sx1.h) \
    $(wildcard include/config/mach/hms39c7092.h) \
    $(wildcard include/config/mach/armadillo.h) \
    $(wildcard include/config/mach/ipcu.h) \
    $(wildcard include/config/mach/loox720.h) \
    $(wildcard include/config/mach/ixdp465.h) \
    $(wildcard include/config/mach/ixdp2351.h) \
    $(wildcard include/config/mach/adsvix.h) \
    $(wildcard include/config/mach/dm270.h) \
    $(wildcard include/config/mach/socltplus.h) \
    $(wildcard include/config/mach/ecia.h) \
    $(wildcard include/config/mach/cm4008.h) \
    $(wildcard include/config/mach/p2001.h) \
    $(wildcard include/config/mach/twister.h) \
    $(wildcard include/config/mach/mudshark.h) \
    $(wildcard include/config/mach/hb2.h) \
    $(wildcard include/config/mach/iq80332.h) \
    $(wildcard include/config/mach/sendt.h) \
    $(wildcard include/config/mach/mx2jazz.h) \
    $(wildcard include/config/mach/multiio.h) \
    $(wildcard include/config/mach/hrdisplay.h) \
    $(wildcard include/config/mach/mxc27530ads.h) \
    $(wildcard include/config/mach/trizeps3.h) \
    $(wildcard include/config/mach/zefeerdza.h) \
    $(wildcard include/config/mach/zefeerdzb.h) \
    $(wildcard include/config/mach/zefeerdzg.h) \
    $(wildcard include/config/mach/zefeerdzn.h) \
    $(wildcard include/config/mach/zefeerdzq.h) \
    $(wildcard include/config/mach/gtwx5715.h) \
    $(wildcard include/config/mach/astro/jack.h) \
    $(wildcard include/config/mach/tip03.h) \
    $(wildcard include/config/mach/a9200ec.h) \
    $(wildcard include/config/mach/pnx0105.h) \
    $(wildcard include/config/mach/adcpoecpu.h) \
    $(wildcard include/config/mach/csb637.h) \
    $(wildcard include/config/mach/ml69q6203.h) \
    $(wildcard include/config/mach/mb9200.h) \
    $(wildcard include/config/mach/kulun.h) \
    $(wildcard include/config/mach/snapper.h) \
    $(wildcard include/config/mach/optima.h) \
    $(wildcard include/config/mach/dlhsbc.h) \
    $(wildcard include/config/mach/x30.h) \
    $(wildcard include/config/mach/n30.h) \
    $(wildcard include/config/mach/manga/ks8695.h) \
    $(wildcard include/config/mach/ajax.h) \
    $(wildcard include/config/mach/nec/mp900.h) \
    $(wildcard include/config/mach/vvtk1000.h) \
    $(wildcard include/config/mach/kafa.h) \
    $(wildcard include/config/mach/vvtk3000.h) \
    $(wildcard include/config/mach/pimx1.h) \
    $(wildcard include/config/mach/ollie.h) \
    $(wildcard include/config/mach/skymax.h) \
    $(wildcard include/config/mach/jazz.h) \
    $(wildcard include/config/mach/tel/t3.h) \
    $(wildcard include/config/mach/aisino/fcr255.h) \
    $(wildcard include/config/mach/btweb.h) \
    $(wildcard include/config/mach/dbg/lh79520.h) \
    $(wildcard include/config/mach/cm41xx.h) \
    $(wildcard include/config/mach/ts72xx.h) \
    $(wildcard include/config/mach/nggpxa.h) \
    $(wildcard include/config/mach/csb535.h) \
    $(wildcard include/config/mach/csb536.h) \
    $(wildcard include/config/mach/pxa/trakpod.h) \
    $(wildcard include/config/mach/praxis.h) \
    $(wildcard include/config/mach/lh75411.h) \
    $(wildcard include/config/mach/otom.h) \
    $(wildcard include/config/mach/nexcoder/2440.h) \
    $(wildcard include/config/mach/loox410.h) \
    $(wildcard include/config/mach/westlake.h) \
    $(wildcard include/config/mach/nsb.h) \
    $(wildcard include/config/mach/esl/sarva/stn.h) \
    $(wildcard include/config/mach/esl/sarva/tft.h) \
    $(wildcard include/config/mach/esl/sarva/iad.h) \
    $(wildcard include/config/mach/esl/sarva/acc.h) \
    $(wildcard include/config/mach/typhoon.h) \
    $(wildcard include/config/mach/cnav.h) \
    $(wildcard include/config/mach/a730.h) \
    $(wildcard include/config/mach/netstar.h) \
    $(wildcard include/config/mach/phasefale/supercon.h) \
    $(wildcard include/config/mach/shiva1100.h) \
    $(wildcard include/config/mach/etexsc.h) \
    $(wildcard include/config/mach/ixdpg465.h) \
    $(wildcard include/config/mach/a9m2410.h) \
    $(wildcard include/config/mach/a9m2440.h) \
    $(wildcard include/config/mach/a9m9750.h) \
    $(wildcard include/config/mach/a9m9360.h) \
    $(wildcard include/config/mach/unc90.h) \
    $(wildcard include/config/mach/eco920.h) \
    $(wildcard include/config/mach/satview.h) \
    $(wildcard include/config/mach/roadrunner.h) \
    $(wildcard include/config/mach/at91rm9200ek.h) \
    $(wildcard include/config/mach/gp32.h) \
    $(wildcard include/config/mach/gem.h) \
    $(wildcard include/config/mach/i858.h) \
    $(wildcard include/config/mach/hx2750.h) \
    $(wildcard include/config/mach/mxc91131evb.h) \
    $(wildcard include/config/mach/p700.h) \
    $(wildcard include/config/mach/cpe.h) \
    $(wildcard include/config/mach/spitz.h) \
    $(wildcard include/config/mach/nimbra340.h) \
    $(wildcard include/config/mach/lpc22xx.h) \
    $(wildcard include/config/mach/comet3.h) \
    $(wildcard include/config/mach/comet4.h) \
    $(wildcard include/config/mach/csb625.h) \
    $(wildcard include/config/mach/fortunet2.h) \
    $(wildcard include/config/mach/s5h2200.h) \
    $(wildcard include/config/mach/optorm920.h) \
    $(wildcard include/config/mach/adsbitsyxb.h) \
    $(wildcard include/config/mach/adssphere.h) \
    $(wildcard include/config/mach/adsportal.h) \
    $(wildcard include/config/mach/ln2410sbc.h) \
    $(wildcard include/config/mach/cb3rufc.h) \
    $(wildcard include/config/mach/mp2usb.h) \
    $(wildcard include/config/mach/ntnp425c.h) \
    $(wildcard include/config/mach/colibri.h) \
    $(wildcard include/config/mach/pcm7220.h) \
    $(wildcard include/config/mach/gateway7001.h) \
    $(wildcard include/config/mach/pcm027.h) \
    $(wildcard include/config/mach/cmpxa.h) \
    $(wildcard include/config/mach/anubis.h) \
    $(wildcard include/config/mach/ite8152.h) \
    $(wildcard include/config/mach/lpc3xxx.h) \
    $(wildcard include/config/mach/puppeteer.h) \
    $(wildcard include/config/mach/mach/vadatech.h) \
    $(wildcard include/config/mach/e570.h) \
    $(wildcard include/config/mach/x50.h) \
    $(wildcard include/config/mach/recon.h) \
    $(wildcard include/config/mach/xboardgp8.h) \
    $(wildcard include/config/mach/fpic2.h) \
    $(wildcard include/config/mach/akita.h) \
    $(wildcard include/config/mach/a81.h) \
    $(wildcard include/config/mach/svm/sc25x.h) \
    $(wildcard include/config/mach/vadatech020.h) \
    $(wildcard include/config/mach/tli.h) \
    $(wildcard include/config/mach/edb9315lc.h) \
    $(wildcard include/config/mach/passec.h) \
    $(wildcard include/config/mach/ds/tiger.h) \
    $(wildcard include/config/mach/e310.h) \
    $(wildcard include/config/mach/e330.h) \
    $(wildcard include/config/mach/rt3000.h) \
    $(wildcard include/config/mach/nokia770.h) \
    $(wildcard include/config/mach/pnx0106.h) \
    $(wildcard include/config/mach/hx21xx.h) \
    $(wildcard include/config/mach/faraday.h) \
    $(wildcard include/config/mach/sbc9312.h) \
    $(wildcard include/config/mach/batman.h) \
    $(wildcard include/config/mach/jpd201.h) \
    $(wildcard include/config/mach/mipsa.h) \
    $(wildcard include/config/mach/kacom.h) \
    $(wildcard include/config/mach/swarcocpu.h) \
    $(wildcard include/config/mach/swarcodsl.h) \
    $(wildcard include/config/mach/blueangel.h) \
    $(wildcard include/config/mach/hairygrama.h) \
    $(wildcard include/config/mach/banff.h) \
    $(wildcard include/config/mach/carmeva.h) \
    $(wildcard include/config/mach/sam255.h) \
    $(wildcard include/config/mach/ppm10.h) \
    $(wildcard include/config/mach/edb9315a.h) \
    $(wildcard include/config/mach/sunset.h) \
    $(wildcard include/config/mach/stargate2.h) \
    $(wildcard include/config/mach/intelmote2.h) \
    $(wildcard include/config/mach/trizeps4.h) \
    $(wildcard include/config/mach/mainstone2.h) \
    $(wildcard include/config/mach/ez/ixp42x.h) \
    $(wildcard include/config/mach/tapwave/zodiac.h) \
    $(wildcard include/config/mach/universalmeter.h) \
    $(wildcard include/config/mach/hicoarm9.h) \
    $(wildcard include/config/mach/pnx4008.h) \
    $(wildcard include/config/mach/kws6000.h) \
    $(wildcard include/config/mach/portux920t.h) \
    $(wildcard include/config/mach/ez/x5.h) \
    $(wildcard include/config/mach/omap/rudolph.h) \
    $(wildcard include/config/mach/cpuat91.h) \
    $(wildcard include/config/mach/rea9200.h) \
    $(wildcard include/config/mach/acts/pune/sa1110.h) \
    $(wildcard include/config/mach/ixp425.h) \
    $(wildcard include/config/mach/i30030ads.h) \
    $(wildcard include/config/mach/perch.h) \
    $(wildcard include/config/mach/eis05r1.h) \
    $(wildcard include/config/mach/pepperpad.h) \
    $(wildcard include/config/mach/sb3010.h) \
    $(wildcard include/config/mach/rm9200.h) \
    $(wildcard include/config/mach/dma03.h) \
    $(wildcard include/config/mach/road/s101.h) \
    $(wildcard include/config/mach/iq81340sc.h) \
    $(wildcard include/config/mach/iq/nextgen/b.h) \
    $(wildcard include/config/mach/iq81340mc.h) \
    $(wildcard include/config/mach/iq/nextgen/d.h) \
    $(wildcard include/config/mach/iq/nextgen/e.h) \
    $(wildcard include/config/mach/mallow/at91.h) \
    $(wildcard include/config/mach/cybertracker/i.h) \
    $(wildcard include/config/mach/gesbc931x.h) \
    $(wildcard include/config/mach/centipad.h) \
    $(wildcard include/config/mach/armsoc.h) \
    $(wildcard include/config/mach/se4200.h) \
    $(wildcard include/config/mach/ems197a.h) \
    $(wildcard include/config/mach/micro9.h) \
    $(wildcard include/config/mach/micro9l.h) \
    $(wildcard include/config/mach/uc5471dsp.h) \
    $(wildcard include/config/mach/sj5471eng.h) \
    $(wildcard include/config/mach/cmpxa26x.h) \
    $(wildcard include/config/mach/nc.h) \
    $(wildcard include/config/mach/omap/palmte.h) \
    $(wildcard include/config/mach/ajax52x.h) \
    $(wildcard include/config/mach/siriustar.h) \
    $(wildcard include/config/mach/iodata/hdlg.h) \
    $(wildcard include/config/mach/at91rm9200utl.h) \
    $(wildcard include/config/mach/biosafe.h) \
    $(wildcard include/config/mach/mp1000.h) \
    $(wildcard include/config/mach/parsy.h) \
    $(wildcard include/config/mach/ccxp.h) \
    $(wildcard include/config/mach/omap/gsample.h) \
    $(wildcard include/config/mach/realview/eb.h) \
    $(wildcard include/config/mach/samoa.h) \
    $(wildcard include/config/mach/t3xscale.h) \
    $(wildcard include/config/mach/i878.h) \
    $(wildcard include/config/mach/borzoi.h) \
    $(wildcard include/config/mach/gecko.h) \
    $(wildcard include/config/mach/ds101.h) \
    $(wildcard include/config/mach/omap/palmtt2.h) \
    $(wildcard include/config/mach/xscale/palmld.h) \
    $(wildcard include/config/mach/cc9c.h) \
    $(wildcard include/config/mach/sbc1670.h) \
    $(wildcard include/config/mach/ixdp28x5.h) \
    $(wildcard include/config/mach/omap/palmtt.h) \
    $(wildcard include/config/mach/ml696k.h) \
    $(wildcard include/config/mach/arcom/zeus.h) \
    $(wildcard include/config/mach/osiris.h) \
    $(wildcard include/config/mach/maestro.h) \
    $(wildcard include/config/mach/tunge2.h) \
    $(wildcard include/config/mach/ixbbm.h) \
    $(wildcard include/config/mach/mx27ads.h) \
    $(wildcard include/config/mach/ax8004.h) \
    $(wildcard include/config/mach/at91sam9261ek.h) \
    $(wildcard include/config/mach/loft.h) \
    $(wildcard include/config/mach/magpie.h) \
    $(wildcard include/config/mach/mx21ads.h) \
    $(wildcard include/config/mach/mb87m3400.h) \
    $(wildcard include/config/mach/mguard/delta.h) \
    $(wildcard include/config/mach/davinci/dvdp.h) \
    $(wildcard include/config/mach/htcuniversal.h) \
    $(wildcard include/config/mach/tpad.h) \
    $(wildcard include/config/mach/roverp3.h) \
    $(wildcard include/config/mach/jornada928.h) \
    $(wildcard include/config/mach/mv88fxx81.h) \
    $(wildcard include/config/mach/stmp36xx.h) \
    $(wildcard include/config/mach/sxni79524.h) \
    $(wildcard include/config/mach/ams/delta.h) \
    $(wildcard include/config/mach/uranium.h) \
    $(wildcard include/config/mach/ucon.h) \
    $(wildcard include/config/mach/nas100d.h) \
    $(wildcard include/config/mach/l083/1000.h) \
    $(wildcard include/config/mach/ezx.h) \
    $(wildcard include/config/mach/pnx5220.h) \
    $(wildcard include/config/mach/butte.h) \
    $(wildcard include/config/mach/srm2.h) \
    $(wildcard include/config/mach/dsbr.h) \
    $(wildcard include/config/mach/crystalball.h) \
    $(wildcard include/config/mach/tinypxa27x.h) \
    $(wildcard include/config/mach/herbie.h) \
    $(wildcard include/config/mach/magician.h) \
    $(wildcard include/config/mach/cm4002.h) \
    $(wildcard include/config/mach/b4.h) \
    $(wildcard include/config/mach/maui.h) \
    $(wildcard include/config/mach/cybertracker/g.h) \
    $(wildcard include/config/mach/nxdkn.h) \
    $(wildcard include/config/mach/mio8390.h) \
    $(wildcard include/config/mach/omi/board.h) \
    $(wildcard include/config/mach/mx21civ.h) \
    $(wildcard include/config/mach/mahi/cdac.h) \
    $(wildcard include/config/mach/xscale/palmtx.h) \
    $(wildcard include/config/mach/s3c2413.h) \
    $(wildcard include/config/mach/samsys/ep0.h) \
    $(wildcard include/config/mach/wg302v1.h) \
    $(wildcard include/config/mach/wg302v2.h) \
    $(wildcard include/config/mach/eb42x.h) \
    $(wildcard include/config/mach/iq331es.h) \
    $(wildcard include/config/mach/cosydsp.h) \
    $(wildcard include/config/mach/uplat7d.h) \
    $(wildcard include/config/mach/ptdavinci.h) \
    $(wildcard include/config/mach/mbus.h) \
    $(wildcard include/config/mach/nadia2vb.h) \
    $(wildcard include/config/mach/r1000.h) \
    $(wildcard include/config/mach/hw90250.h) \
    $(wildcard include/config/mach/omap/2430sdp.h) \
    $(wildcard include/config/mach/davinci/evm.h) \
    $(wildcard include/config/mach/omap/tornado.h) \
    $(wildcard include/config/mach/olocreek.h) \
    $(wildcard include/config/mach/palmz72.h) \
    $(wildcard include/config/mach/nxdb500.h) \
    $(wildcard include/config/mach/apf9328.h) \
    $(wildcard include/config/mach/omap/wipoq.h) \
    $(wildcard include/config/mach/omap/twip.h) \
    $(wildcard include/config/mach/xscale/palmtreo650.h) \
    $(wildcard include/config/mach/acumen.h) \
    $(wildcard include/config/mach/xp100.h) \
    $(wildcard include/config/mach/fs2410.h) \
    $(wildcard include/config/mach/pxa270/cerf.h) \
    $(wildcard include/config/mach/sq2ftlpalm.h) \
    $(wildcard include/config/mach/bsemserver.h) \
    $(wildcard include/config/mach/netclient.h) \
    $(wildcard include/config/mach/xscale/palmtt5.h) \
    $(wildcard include/config/mach/omap/palmtc.h) \
    $(wildcard include/config/mach/omap/apollon.h) \
    $(wildcard include/config/mach/mxc30030evb.h) \
    $(wildcard include/config/mach/rea/2d.h) \
    $(wildcard include/config/mach/ti3e524.h) \
    $(wildcard include/config/mach/ateb9200.h) \
    $(wildcard include/config/mach/auckland.h) \
    $(wildcard include/config/mach/ak3320m.h) \
    $(wildcard include/config/mach/duramax.h) \
    $(wildcard include/config/mach/n35.h) \
    $(wildcard include/config/mach/pronghorn.h) \
    $(wildcard include/config/mach/fundy.h) \
    $(wildcard include/config/mach/logicpd/pxa270.h) \
    $(wildcard include/config/mach/cpu777.h) \
    $(wildcard include/config/mach/simicon9201.h) \
    $(wildcard include/config/mach/leap2/hpm.h) \
    $(wildcard include/config/mach/cm922txa10.h) \
    $(wildcard include/config/mach/pxa.h) \
    $(wildcard include/config/mach/sandgate2.h) \
    $(wildcard include/config/mach/sandgate2g.h) \
    $(wildcard include/config/mach/sandgate2p.h) \
    $(wildcard include/config/mach/fred/jack.h) \
    $(wildcard include/config/mach/ttg/color1.h) \
    $(wildcard include/config/mach/nxeb500hmi.h) \
    $(wildcard include/config/mach/netdcu8.h) \
    $(wildcard include/config/mach/ml675050/cpu/boa.h) \
    $(wildcard include/config/mach/ng/fvx538.h) \
    $(wildcard include/config/mach/ng/fvs338.h) \
    $(wildcard include/config/mach/pnx4103.h) \
    $(wildcard include/config/mach/hesdb.h) \
    $(wildcard include/config/mach/xsilo.h) \
    $(wildcard include/config/mach/espresso.h) \
    $(wildcard include/config/mach/emlc.h) \
    $(wildcard include/config/mach/sisteron.h) \
    $(wildcard include/config/mach/rx1950.h) \
    $(wildcard include/config/mach/tsc/venus.h) \
    $(wildcard include/config/mach/ds101j.h) \
    $(wildcard include/config/mach/mxc30030ads.h) \
    $(wildcard include/config/mach/fujitsu/wimaxsoc.h) \
    $(wildcard include/config/mach/dualpcmodem.h) \
    $(wildcard include/config/mach/gesbc9312.h) \
    $(wildcard include/config/mach/htcapache.h) \
    $(wildcard include/config/mach/ixdp435.h) \
    $(wildcard include/config/mach/catprovt100.h) \
    $(wildcard include/config/mach/picotux1xx.h) \
    $(wildcard include/config/mach/picotux2xx.h) \
    $(wildcard include/config/mach/dsmg600.h) \
    $(wildcard include/config/mach/empc2.h) \
    $(wildcard include/config/mach/ventura.h) \
    $(wildcard include/config/mach/phidget/sbc.h) \
    $(wildcard include/config/mach/ij3k.h) \
    $(wildcard include/config/mach/pisgah.h) \
    $(wildcard include/config/mach/omap/fsample.h) \
    $(wildcard include/config/mach/sg720.h) \
    $(wildcard include/config/mach/redfox.h) \
    $(wildcard include/config/mach/mysh/ep9315/1.h) \
    $(wildcard include/config/mach/tpf106.h) \
    $(wildcard include/config/mach/at91rm9200kg.h) \
    $(wildcard include/config/mach/sledb.h) \
    $(wildcard include/config/mach/ontrack.h) \
    $(wildcard include/config/mach/pm1200.h) \
    $(wildcard include/config/mach/ess24xxx.h) \
    $(wildcard include/config/mach/coremp7.h) \
    $(wildcard include/config/mach/nexcoder/6446.h) \
    $(wildcard include/config/mach/stvc8380.h) \
    $(wildcard include/config/mach/teklynx.h) \
    $(wildcard include/config/mach/carbonado.h) \
    $(wildcard include/config/mach/sysmos/mp730.h) \
    $(wildcard include/config/mach/snapper/cl15.h) \
    $(wildcard include/config/mach/pgigim.h) \
    $(wildcard include/config/mach/ptx9160p2.h) \
    $(wildcard include/config/mach/dcore1.h) \
    $(wildcard include/config/mach/victorpxa.h) \
    $(wildcard include/config/mach/mx2dtb.h) \
    $(wildcard include/config/mach/pxa/irex/er0100.h) \
    $(wildcard include/config/mach/omap/palmz71.h) \
    $(wildcard include/config/mach/bartec/deg.h) \
    $(wildcard include/config/mach/hw50251.h) \
    $(wildcard include/config/mach/ibox.h) \
    $(wildcard include/config/mach/atlaslh7a404.h) \
    $(wildcard include/config/mach/pt2026.h) \
    $(wildcard include/config/mach/htcalpine.h) \
    $(wildcard include/config/mach/bartec/vtu.h) \
    $(wildcard include/config/mach/vcoreii.h) \
    $(wildcard include/config/mach/pdnb3.h) \
    $(wildcard include/config/mach/htcbeetles.h) \
    $(wildcard include/config/mach/s3c6400.h) \
    $(wildcard include/config/mach/s3c2443.h) \
    $(wildcard include/config/mach/omap/ldk.h) \
    $(wildcard include/config/mach/smdk2460.h) \
    $(wildcard include/config/mach/smdk2440.h) \
    $(wildcard include/config/mach/smdk2412.h) \
    $(wildcard include/config/mach/webbox.h) \
    $(wildcard include/config/mach/cwwndp.h) \
    $(wildcard include/config/mach/dragon.h) \
    $(wildcard include/config/mach/opendo/cpu/board.h) \
    $(wildcard include/config/mach/ccm2200.h) \
    $(wildcard include/config/mach/etwarm.h) \
    $(wildcard include/config/mach/m93030.h) \
    $(wildcard include/config/mach/cc7u.h) \
    $(wildcard include/config/mach/mtt/ranger.h) \
    $(wildcard include/config/mach/nexus.h) \
    $(wildcard include/config/mach/desman.h) \
    $(wildcard include/config/mach/bkde303.h) \
    $(wildcard include/config/mach/smdk2413.h) \
    $(wildcard include/config/mach/aml/m7200.h) \
    $(wildcard include/config/mach/aml/m5900.h) \
    $(wildcard include/config/mach/sg640.h) \
    $(wildcard include/config/mach/edg79524.h) \
    $(wildcard include/config/mach/ai2410.h) \
    $(wildcard include/config/mach/ixp465.h) \
    $(wildcard include/config/mach/balloon3.h) \
    $(wildcard include/config/mach/heins.h) \
    $(wildcard include/config/mach/mpluseva.h) \
    $(wildcard include/config/mach/rt042.h) \
    $(wildcard include/config/mach/cwiem.h) \
    $(wildcard include/config/mach/cm/x270.h) \
    $(wildcard include/config/mach/cm/x255.h) \
    $(wildcard include/config/mach/esh/at91.h) \
    $(wildcard include/config/mach/sandgate3.h) \
    $(wildcard include/config/mach/primo.h) \
    $(wildcard include/config/mach/gemstone.h) \
    $(wildcard include/config/mach/pronghornmetro.h) \
    $(wildcard include/config/mach/sidewinder.h) \
    $(wildcard include/config/mach/picomod1.h) \
    $(wildcard include/config/mach/sg590.h) \
    $(wildcard include/config/mach/akai9307.h) \
    $(wildcard include/config/mach/fontaine.h) \
    $(wildcard include/config/mach/wombat.h) \
    $(wildcard include/config/mach/acq300.h) \
    $(wildcard include/config/mach/mod/270.h) \
    $(wildcard include/config/mach/vc0820.h) \
    $(wildcard include/config/mach/ani/aim.h) \
    $(wildcard include/config/mach/jellyfish.h) \
    $(wildcard include/config/mach/amanita.h) \
    $(wildcard include/config/mach/vlink.h) \
    $(wildcard include/config/mach/dexflex.h) \
    $(wildcard include/config/mach/eigen/ttq.h) \
    $(wildcard include/config/mach/arcom/titan.h) \
    $(wildcard include/config/mach/tabla.h) \
    $(wildcard include/config/mach/mdirac3.h) \
    $(wildcard include/config/mach/mrhfbp2.h) \
    $(wildcard include/config/mach/at91rm9200rb.h) \
    $(wildcard include/config/mach/ani/apm.h) \
    $(wildcard include/config/mach/ella1.h) \
    $(wildcard include/config/mach/inhand/pxa27x.h) \
    $(wildcard include/config/mach/inhand/pxa25x.h) \
    $(wildcard include/config/mach/empos/xm.h) \
    $(wildcard include/config/mach/empos.h) \
    $(wildcard include/config/mach/empos/tiny.h) \
    $(wildcard include/config/mach/empos/sm.h) \
    $(wildcard include/config/mach/egret.h) \
    $(wildcard include/config/mach/ostrich.h) \
    $(wildcard include/config/mach/n50.h) \
    $(wildcard include/config/mach/ecbat91.h) \
    $(wildcard include/config/mach/stareast.h) \
    $(wildcard include/config/mach/dspg/dw.h) \
    $(wildcard include/config/mach/onearm.h) \
    $(wildcard include/config/mach/mrg110/6.h) \
    $(wildcard include/config/mach/wrt300nv2.h) \
    $(wildcard include/config/mach/xm/bulverde.h) \
    $(wildcard include/config/mach/msm6100.h) \
    $(wildcard include/config/mach/eti/b1.h) \
    $(wildcard include/config/mach/zilog/za9l.h) \
    $(wildcard include/config/mach/bit2440.h) \
    $(wildcard include/config/mach/nbi.h) \
    $(wildcard include/config/mach/smdk2443.h) \
    $(wildcard include/config/mach/vdavinci.h) \
    $(wildcard include/config/mach/atc6.h) \
    $(wildcard include/config/mach/multmdw.h) \
    $(wildcard include/config/mach/mba2440.h) \
    $(wildcard include/config/mach/ecsd.h) \
    $(wildcard include/config/mach/zire31.h) \
    $(wildcard include/config/mach/fsg.h) \
    $(wildcard include/config/mach/razor101.h) \
    $(wildcard include/config/mach/opera/tdm.h) \
    $(wildcard include/config/mach/comcerto.h) \
    $(wildcard include/config/mach/tb0319.h) \
    $(wildcard include/config/mach/kws8000.h) \
    $(wildcard include/config/mach/b2.h) \
    $(wildcard include/config/mach/lcl54.h) \
    $(wildcard include/config/mach/at91sam9260ek.h) \
    $(wildcard include/config/mach/glantank.h) \
    $(wildcard include/config/mach/n2100.h) \
    $(wildcard include/config/mach/n4100.h) \
    $(wildcard include/config/mach/vertical/rsc4.h) \
    $(wildcard include/config/mach/sg8100.h) \
    $(wildcard include/config/mach/im42xx.h) \
    $(wildcard include/config/mach/ftxx.h) \
    $(wildcard include/config/mach/lwfusion.h) \
    $(wildcard include/config/mach/qt2410.h) \
    $(wildcard include/config/mach/kixrp435.h) \
    $(wildcard include/config/mach/ccw9c.h) \
    $(wildcard include/config/mach/dabhs.h) \
    $(wildcard include/config/mach/gzmx.h) \
    $(wildcard include/config/mach/ipnw100ap.h) \
    $(wildcard include/config/mach/cc9p9360dev.h) \
    $(wildcard include/config/mach/cc9p9750dev.h) \
    $(wildcard include/config/mach/cc9p9360val.h) \
    $(wildcard include/config/mach/cc9p9750val.h) \
    $(wildcard include/config/mach/nx70v.h) \
    $(wildcard include/config/mach/at91rm9200df.h) \
    $(wildcard include/config/mach/se/pilot2.h) \
    $(wildcard include/config/mach/mtcn/t800.h) \
    $(wildcard include/config/mach/vcmx212.h) \
    $(wildcard include/config/mach/lynx.h) \
    $(wildcard include/config/mach/at91sam9260id.h) \
    $(wildcard include/config/mach/hw86052.h) \
    $(wildcard include/config/mach/pilz/pmi3.h) \
    $(wildcard include/config/mach/edb9302a.h) \
    $(wildcard include/config/mach/edb9307a.h) \
    $(wildcard include/config/mach/ct/dfs.h) \
    $(wildcard include/config/mach/pilz/pmi4.h) \
    $(wildcard include/config/mach/xceednp/ixp.h) \
    $(wildcard include/config/mach/smdk2442b.h) \
    $(wildcard include/config/mach/xnode.h) \
    $(wildcard include/config/mach/aidx270.h) \
    $(wildcard include/config/mach/rema.h) \
    $(wildcard include/config/mach/bps1000.h) \
    $(wildcard include/config/mach/hw90350.h) \
    $(wildcard include/config/mach/omap/sdp3430.h) \
    $(wildcard include/config/mach/bluetouch.h) \
    $(wildcard include/config/mach/vstms.h) \
    $(wildcard include/config/mach/xsbase270.h) \
    $(wildcard include/config/mach/at91sam9260ek/cn.h) \
    $(wildcard include/config/mach/adsturboxb.h) \
    $(wildcard include/config/mach/oti4110.h) \
    $(wildcard include/config/mach/hme/pxa.h) \
    $(wildcard include/config/mach/deisterdca.h) \
    $(wildcard include/config/mach/ces/ssem2.h) \
    $(wildcard include/config/mach/ces/mtr.h) \
    $(wildcard include/config/mach/tds/avng/sbc.h) \
    $(wildcard include/config/mach/everest.h) \
    $(wildcard include/config/mach/pnx4010.h) \
    $(wildcard include/config/mach/oxnas.h) \
    $(wildcard include/config/mach/fiori.h) \
    $(wildcard include/config/mach/ml1200.h) \
    $(wildcard include/config/mach/pecos.h) \
    $(wildcard include/config/mach/nb2xxx.h) \
    $(wildcard include/config/mach/hw6900.h) \
    $(wildcard include/config/mach/cdcs/quoll.h) \
    $(wildcard include/config/mach/quicksilver.h) \
    $(wildcard include/config/mach/uplat926.h) \
    $(wildcard include/config/mach/dep2410/thomas.h) \
    $(wildcard include/config/mach/dtk2410.h) \
    $(wildcard include/config/mach/chili.h) \
    $(wildcard include/config/mach/demeter.h) \
    $(wildcard include/config/mach/dionysus.h) \
    $(wildcard include/config/mach/as352x.h) \
    $(wildcard include/config/mach/service.h) \
    $(wildcard include/config/mach/cs/e9301.h) \
    $(wildcard include/config/mach/micro9m.h) \
    $(wildcard include/config/mach/ia/mospck.h) \
    $(wildcard include/config/mach/ql201b.h) \
    $(wildcard include/config/mach/bbm.h) \
    $(wildcard include/config/mach/exxx.h) \
    $(wildcard include/config/mach/wma11b.h) \
    $(wildcard include/config/mach/pelco/atlas.h) \
    $(wildcard include/config/mach/g500.h) \
    $(wildcard include/config/mach/bug.h) \
    $(wildcard include/config/mach/mx33ads.h) \
    $(wildcard include/config/mach/chub.h) \
    $(wildcard include/config/mach/neo1973/gta01.h) \
    $(wildcard include/config/mach/w90n740.h) \
    $(wildcard include/config/mach/medallion/sa2410.h) \
    $(wildcard include/config/mach/ia/cpu/9200/2.h) \
    $(wildcard include/config/mach/dimmrm9200.h) \
    $(wildcard include/config/mach/pm9261.h) \
    $(wildcard include/config/mach/ml7304.h) \
    $(wildcard include/config/mach/ucp250.h) \
    $(wildcard include/config/mach/intboard.h) \
    $(wildcard include/config/mach/gulfstream.h) \
    $(wildcard include/config/mach/labquest.h) \
    $(wildcard include/config/mach/vcmx313.h) \
    $(wildcard include/config/mach/urg200.h) \
    $(wildcard include/config/mach/cpux255lcdnet.h) \
    $(wildcard include/config/mach/netdcu9.h) \
    $(wildcard include/config/mach/netdcu10.h) \
    $(wildcard include/config/mach/dspg/dga.h) \
    $(wildcard include/config/mach/dspg/dvw.h) \
    $(wildcard include/config/mach/solos.h) \
    $(wildcard include/config/mach/at91sam9263ek.h) \
    $(wildcard include/config/mach/osstbox.h) \
    $(wildcard include/config/mach/kbat9261.h) \
    $(wildcard include/config/mach/ct1100.h) \
    $(wildcard include/config/mach/akcppxa.h) \
    $(wildcard include/config/mach/zevio/1020.h) \
    $(wildcard include/config/mach/hitrack.h) \
    $(wildcard include/config/mach/syme1.h) \
    $(wildcard include/config/mach/syhl1.h) \
    $(wildcard include/config/mach/empca400.h) \
    $(wildcard include/config/mach/em7210.h) \
    $(wildcard include/config/mach/htchermes.h) \
    $(wildcard include/config/mach/eti/c1.h) \
    $(wildcard include/config/mach/mach/dep2410.h) \
    $(wildcard include/config/mach/ac100.h) \
    $(wildcard include/config/mach/sneetch.h) \
    $(wildcard include/config/mach/studentmate.h) \
    $(wildcard include/config/mach/zir2410.h) \
    $(wildcard include/config/mach/zir2413.h) \
    $(wildcard include/config/mach/dlonip3.h) \
    $(wildcard include/config/mach/instream.h) \
    $(wildcard include/config/mach/ambarella.h) \
    $(wildcard include/config/mach/nevis.h) \
    $(wildcard include/config/mach/htc/trinity.h) \
    $(wildcard include/config/mach/ql202b.h) \
    $(wildcard include/config/mach/vpac270.h) \
    $(wildcard include/config/mach/rd129.h) \
    $(wildcard include/config/mach/htcwizard.h) \
    $(wildcard include/config/mach/xscale/treo680.h) \
    $(wildcard include/config/mach/tecon/tmezon.h) \
    $(wildcard include/config/mach/zylonite.h) \
    $(wildcard include/config/mach/gene1270.h) \
    $(wildcard include/config/mach/zir2412.h) \
    $(wildcard include/config/mach/mx31lite.h) \
    $(wildcard include/config/mach/t700wx.h) \
    $(wildcard include/config/mach/vf100.h) \
    $(wildcard include/config/mach/nsb2.h) \
    $(wildcard include/config/mach/nxhmi/bb.h) \
    $(wildcard include/config/mach/nxhmi/re.h) \
    $(wildcard include/config/mach/n4100pro.h) \
    $(wildcard include/config/mach/sam9260.h) \
    $(wildcard include/config/mach/omap/treo600.h) \
    $(wildcard include/config/mach/indy2410.h) \
    $(wildcard include/config/mach/nelt/a.h) \
    $(wildcard include/config/mach/n311.h) \
    $(wildcard include/config/mach/at91sam9260vgk.h) \
    $(wildcard include/config/mach/at91leppe.h) \
    $(wildcard include/config/mach/at91lepccn.h) \
    $(wildcard include/config/mach/apc7100.h) \
    $(wildcard include/config/mach/stargazer.h) \
    $(wildcard include/config/mach/sonata.h) \
    $(wildcard include/config/mach/schmoogie.h) \
    $(wildcard include/config/mach/aztool.h) \
    $(wildcard include/config/mach/mioa701.h) \
    $(wildcard include/config/mach/sxni9260.h) \
    $(wildcard include/config/mach/mxc27520evb.h) \
    $(wildcard include/config/mach/armadillo5x0.h) \
    $(wildcard include/config/mach/mb9260.h) \
    $(wildcard include/config/mach/mb9263.h) \
    $(wildcard include/config/mach/ipac9302.h) \
    $(wildcard include/config/mach/cc9p9360js.h) \
    $(wildcard include/config/mach/gallium.h) \
    $(wildcard include/config/mach/msc2410.h) \
    $(wildcard include/config/mach/ghi270.h) \
    $(wildcard include/config/mach/davinci/leonardo.h) \
    $(wildcard include/config/mach/oiab.h) \
    $(wildcard include/config/mach/smdk6400.h) \
    $(wildcard include/config/mach/nokia/n800.h) \
    $(wildcard include/config/mach/greenphone.h) \
    $(wildcard include/config/mach/compexwp18.h) \
    $(wildcard include/config/mach/xmate.h) \
    $(wildcard include/config/mach/energizer.h) \
    $(wildcard include/config/mach/ime1.h) \
    $(wildcard include/config/mach/swedatms.h) \
    $(wildcard include/config/mach/ntnp435c.h) \
    $(wildcard include/config/mach/spectro2.h) \
    $(wildcard include/config/mach/h6039.h) \
    $(wildcard include/config/mach/ep80219.h) \
    $(wildcard include/config/mach/samoa/ii.h) \
    $(wildcard include/config/mach/cwmxl.h) \
    $(wildcard include/config/mach/as9200.h) \
    $(wildcard include/config/mach/sfx1149.h) \
    $(wildcard include/config/mach/navi010.h) \
    $(wildcard include/config/mach/multmdp.h) \
    $(wildcard include/config/mach/scb9520.h) \
    $(wildcard include/config/mach/htcathena.h) \
    $(wildcard include/config/mach/xp179.h) \
    $(wildcard include/config/mach/h4300.h) \
    $(wildcard include/config/mach/goramo/mlr.h) \
    $(wildcard include/config/mach/mxc30020evb.h) \
    $(wildcard include/config/mach/adsbitsimx.h) \
    $(wildcard include/config/mach/adsportalplus.h) \
    $(wildcard include/config/mach/mmsp2plus.h) \
    $(wildcard include/config/mach/em/x270.h) \
    $(wildcard include/config/mach/tpp302.h) \
    $(wildcard include/config/mach/tpm104.h) \
    $(wildcard include/config/mach/tpm102.h) \
    $(wildcard include/config/mach/tpm109.h) \
    $(wildcard include/config/mach/fbxo1.h) \
    $(wildcard include/config/mach/hxd8.h) \
    $(wildcard include/config/mach/neo1973/gta02.h) \
    $(wildcard include/config/mach/emtest.h) \
    $(wildcard include/config/mach/ad6900.h) \
    $(wildcard include/config/mach/europa.h) \
    $(wildcard include/config/mach/metroconnect.h) \
    $(wildcard include/config/mach/ez/s2410.h) \
    $(wildcard include/config/mach/ez/s2440.h) \
    $(wildcard include/config/mach/ez/ep9312.h) \
    $(wildcard include/config/mach/ez/ep9315.h) \
    $(wildcard include/config/mach/ez/x7.h) \
    $(wildcard include/config/mach/godotdb.h) \
    $(wildcard include/config/mach/mistral.h) \
    $(wildcard include/config/mach/msm.h) \
    $(wildcard include/config/mach/ct5910.h) \
    $(wildcard include/config/mach/ct5912.h) \
    $(wildcard include/config/mach/hynet/ine.h) \
    $(wildcard include/config/mach/hynet/app.h) \
    $(wildcard include/config/mach/msm7200.h) \
    $(wildcard include/config/mach/msm7600.h) \
    $(wildcard include/config/mach/ceb255.h) \
    $(wildcard include/config/mach/ciel.h) \
    $(wildcard include/config/mach/slm5650.h) \
    $(wildcard include/config/mach/at91sam9rlek.h) \
    $(wildcard include/config/mach/comtech/router.h) \
    $(wildcard include/config/mach/sbc2410x.h) \
    $(wildcard include/config/mach/at4x0bd.h) \
    $(wildcard include/config/mach/cbifr.h) \
    $(wildcard include/config/mach/arcom/quantum.h) \
    $(wildcard include/config/mach/matrix520.h) \
    $(wildcard include/config/mach/matrix510.h) \
    $(wildcard include/config/mach/matrix500.h) \
    $(wildcard include/config/mach/m501.h) \
    $(wildcard include/config/mach/aaeon1270.h) \
    $(wildcard include/config/mach/matrix500ev.h) \
    $(wildcard include/config/mach/pac500.h) \
    $(wildcard include/config/mach/pnx8181.h) \
    $(wildcard include/config/mach/colibri320.h) \
    $(wildcard include/config/mach/aztoolbb.h) \
    $(wildcard include/config/mach/aztoolg2.h) \
    $(wildcard include/config/mach/dvlhost.h) \
    $(wildcard include/config/mach/zir9200.h) \
    $(wildcard include/config/mach/zir9260.h) \
    $(wildcard include/config/mach/cocopah.h) \
    $(wildcard include/config/mach/nds.h) \
    $(wildcard include/config/mach/rosencrantz.h) \
    $(wildcard include/config/mach/fttx/odsc.h) \
    $(wildcard include/config/mach/classe/r6904.h) \
    $(wildcard include/config/mach/cam60.h) \
    $(wildcard include/config/mach/mxc30031ads.h) \
    $(wildcard include/config/mach/datacall.h) \
    $(wildcard include/config/mach/at91eb01.h) \
    $(wildcard include/config/mach/rty.h) \
    $(wildcard include/config/mach/dwl2100.h) \
    $(wildcard include/config/mach/vinsi.h) \
    $(wildcard include/config/mach/db88f5281.h) \
    $(wildcard include/config/mach/csb726.h) \
    $(wildcard include/config/mach/tik27.h) \
    $(wildcard include/config/mach/mx/uc7420.h) \
  include/asm/setup.h \
    $(wildcard include/config/arch/lh7a40x.h) \
  include/asm/tlb.h \
  include/asm/cacheflush.h \
    $(wildcard include/config/cpu/cache/v3.h) \
    $(wildcard include/config/cpu/cache/v4.h) \
    $(wildcard include/config/cpu/cache/v4wb.h) \
    $(wildcard include/config/outer/cache.h) \
    $(wildcard include/config/cpu/cache/vipt.h) \
    $(wildcard include/config/cpu/cache/vivt.h) \
  include/asm/shmparam.h \
  include/asm/tlbflush.h \
    $(wildcard include/config/cpu/tlb/v3.h) \
    $(wildcard include/config/cpu/tlb/v4wt.h) \
    $(wildcard include/config/cpu/tlb/v4wbi.h) \
    $(wildcard include/config/cpu/tlb/v4wb.h) \
    $(wildcard include/config/cpu/tlb/v6.h) \
    $(wildcard include/config/cpu/tlb/v7.h) \
  include/asm/pgalloc.h \
  include/asm/mach/arch.h \
  include/asm/mach/map.h \
  include/asm/io.h \
  include/asm/arch/io.h \
  arch/arm/mm/mm.h \

arch/arm/mm/init.o: $(deps_arch/arm/mm/init.o)

$(deps_arch/arm/mm/init.o):
