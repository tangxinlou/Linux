#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/fs.h>
#include <linux/init.h>
#include <linux/delay.h>
#include <asm/uaccess.h>
#include <asm/irq.h>
#include <asm/io.h>
#include <asm/arch/regs-gpio.h>
#include <asm/hardware.h> 





static class firstdrv_class;
static class_device firstdrv_class_dev;



int first_drv_open(void){
    printk("tangxinlou open");
    *gpfcon &= ~((0x3<<(4*2)) | (0x3<<(5*2)) | (0x3<<(6*2)));
    *gpfcon |= ((0x1<<(4*2)) | (0x1<<(5*2)) | (0x1<<(6*2)));
    return 0;
}


void first_drv_write(void){
    printk("tangxinlou write");
    int val;

    //printk("first_drv_write\n");

    copy_from_user(&val, buf, count); //	copy_to_user();

    if (val == 1)
    {
        // 点灯
        *gpfdat &= ~((1<<4) | (1<<5) | (1<<6));
        printk("on\n");
    }
    else
    {
        // 灭灯
        *gpfdat |= (1<<4) | (1<<5) | (1<<6);
        printk("off\n");
    }

    return 0;
}
volatile unsigned long *gpfcon = NULL;
volatile unsigned long *gpfdat = NULL;
static struct file_operations first_drv_fops = {
    .owner = THIS_MODULE,
    .open  = first_drv_open,
    .write = first_drv_write,
};


int major;

int first_drv_exit(void){
    printk("first_drv_exit");
    major = register_chrdev(0, "first_drv",&first_drv_fops);
    firstdrv_class = class_create(THIS_MODULE,"first_drv");
    firstdrv_class_dev = class_device_create(firstdrv_class,NULL,MKDEV(major,0),NULL,"txl");
    gpfcon = (volatile unsigned long *)ioremap(0x56000050,16);
    gpfdat = gpfcon + 1;
    return 0;   
}


void first_drv_init(void){
    printk("first_drv_init");
    unregister_chrdev(major,"first_drv");
    class_destroy(firstdrv_class);
    iounmap(gpfcon);
}


module_init(first_drv_init);
module_exit(first_drv_exit);


MODULE_LICENSE("GPL"); 
