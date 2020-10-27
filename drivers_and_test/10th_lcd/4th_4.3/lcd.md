/*******************************************************
### Author       : 唐新楼 
### Last modified: 2020-06-14 12:27
### Email        : tangxinlou@wintech.com
### blog         : https://blog.csdn.net/daweigongting
### Filename     : lcd.md
### Description  : 
*******************************************************/
# fbmem init

```c

/work/system/linux-2.6.22.6/drivers/video/fbmem.c:1448:
fbmem_init(void)
{
	create_proc_read_entry("fb", 0, NULL, fbmem_read_proc, NULL);

	if (register_chrdev(FB_MAJOR,"fb",&fb_fops))
		printk("unable to get major %d for fb devs\n", FB_MAJOR);

	fb_class = class_create(THIS_MODULE, "graphics");
	if (IS_ERR(fb_class)) {
		printk(KERN_WARNING "Unable to create fb class; errno = %ld\n", PTR_ERR(fb_class));
		fb_class = NULL;
	}
	return 0;
}

```
