/*******************************************************
## Author       : 唐新楼 
## Last modified: 2020-06-13 15:30
## Email        : tangxinlou@wintech.com
## blog         : https://blog.csdn.net/daweigongting
## Filename     : buttons.md
## Description  : 
*******************************************************/
# input subsystem

```c

/work/system/linux-2.6.22.6/drivers/input/input.c:1104:
int input_register_device(struct input_dev *dev)
{
	static atomic_t input_no = ATOMIC_INIT(0);
	struct input_handler *handler;
	const char *path;
	int error;

	set_bit(EV_SYN, dev->evbit);

	/*
	 * If delay and period are pre-set by the driver, then autorepeating
	 * is handled by the driver itself and we don't do it in input.c.
	 */

	init_timer(&dev->timer);
	if (!dev->rep[REP_DELAY] && !dev->rep[REP_PERIOD]) {
		dev->timer.data = (long) dev;
		dev->timer.function = input_repeat_key;
		dev->rep[REP_DELAY] = 250;
		dev->rep[REP_PERIOD] = 33;
	}

	if (!dev->getkeycode)
		dev->getkeycode = input_default_getkeycode;

	if (!dev->setkeycode)
		dev->setkeycode = input_default_setkeycode;

	list_add_tail(&dev->node, &input_dev_list);

	snprintf(dev->cdev.class_id, sizeof(dev->cdev.class_id),
		 "input%ld", (unsigned long) atomic_inc_return(&input_no) - 1);

	if (!dev->cdev.dev)
		dev->cdev.dev = dev->dev.parent;

	error = class_device_add(&dev->cdev);
	if (error)
		return error;

	path = kobject_get_path(&dev->cdev.kobj, GFP_KERNEL);
	printk(KERN_INFO "input: %s as %s\n",
		dev->name ? dev->name : "Unspecified device", path ? path : "N/A");
	kfree(path);

	list_for_each_entry(handler, &input_handler_list, node)
		input_attach_handler(dev, handler);

	input_wakeup_procfs_readers();

	return 0;
}

```

```c

/work/system/linux-2.6.22.6/drivers/input/input.c:428:
static int input_attach_handler(struct input_dev *dev, struct input_handler *handler)
{
	const struct input_device_id *id;
	int error;

	if (handler->blacklist && input_match_device(handler->blacklist, dev))
		return -ENODEV;

	id = input_match_device(handler->id_table, dev);
	if (!id)
		return -ENODEV;

	error = handler->connect(handler, dev, id);
	if (error && error != -ENODEV)
		printk(KERN_ERR
			"input: failed to attach handler %s to device %s, "
			"error: %d\n",
			handler->name, kobject_name(&dev->cdev.kobj), error);

	return error;
}

```

```c

/work/system/linux-2.6.22.6/drivers/input/input.c:389:
static const struct input_device_id *input_match_device(const struct input_device_id *id,
							struct input_dev *dev)
{
	int i;

	for (; id->flags || id->driver_info; id++) {

		if (id->flags & INPUT_DEVICE_ID_MATCH_BUS)
			if (id->bustype != dev->id.bustype)
				continue;

		if (id->flags & INPUT_DEVICE_ID_MATCH_VENDOR)
			if (id->vendor != dev->id.vendor)
				continue;

		if (id->flags & INPUT_DEVICE_ID_MATCH_PRODUCT)
			if (id->product != dev->id.product)
				continue;

		if (id->flags & INPUT_DEVICE_ID_MATCH_VERSION)
			if (id->version != dev->id.version)
				continue;

		MATCH_BIT(evbit,  EV_MAX);
		MATCH_BIT(keybit, KEY_MAX);
		MATCH_BIT(relbit, REL_MAX);
		MATCH_BIT(absbit, ABS_MAX);
		MATCH_BIT(mscbit, MSC_MAX);
		MATCH_BIT(ledbit, LED_MAX);
		MATCH_BIT(sndbit, SND_MAX);
		MATCH_BIT(ffbit,  FF_MAX);
		MATCH_BIT(swbit,  SW_MAX);

		return id;
	}

	return NULL;
}

```

```c

/work/system/linux-2.6.22.6/drivers/input/evdev.c:624:
static int evdev_connect(struct input_handler *handler, struct input_dev *dev,
			 const struct input_device_id *id)
{
	struct evdev *evdev;
	struct class_device *cdev;
	dev_t devt;
	int minor;
	int error;

	for (minor = 0; minor < EVDEV_MINORS && evdev_table[minor]; minor++);
	if (minor == EVDEV_MINORS) {
		printk(KERN_ERR "evdev: no more free evdev devices\n");
		return -ENFILE;
	}

	evdev = kzalloc(sizeof(struct evdev), GFP_KERNEL);
	if (!evdev)
		return -ENOMEM;

	INIT_LIST_HEAD(&evdev->client_list);
	init_waitqueue_head(&evdev->wait);

	evdev->exist = 1;
	evdev->minor = minor;
	evdev->handle.dev = dev;
	evdev->handle.name = evdev->name;
	evdev->handle.handler = handler;
	evdev->handle.private = evdev;
	sprintf(evdev->name, "event%d", minor);

	evdev_table[minor] = evdev;

	devt = MKDEV(INPUT_MAJOR, EVDEV_MINOR_BASE + minor),

	cdev = class_device_create(&input_class, &dev->cdev, devt,
				   dev->cdev.dev, evdev->name);
	if (IS_ERR(cdev)) {
		error = PTR_ERR(cdev);
		goto err_free_evdev;
	}

	/* temporary symlink to keep userspace happy */
	error = sysfs_create_link(&input_class.subsys.kobj,
				  &cdev->kobj, evdev->name);
	if (error)
		goto err_cdev_destroy;

	error = input_register_handle(&evdev->handle);
	if (error)
		goto err_remove_link;

	return 0;

 err_remove_link:
	sysfs_remove_link(&input_class.subsys.kobj, evdev->name);
 err_cdev_destroy:
	class_device_destroy(&input_class, devt);
 err_free_evdev:
	kfree(evdev);
	evdev_table[minor] = NULL;
	return error;
}

```
- move to h_list with all mached handle
```c

/work/system/linux-2.6.22.6/drivers/input/input.c:1222:
int input_register_handle(struct input_handle *handle)
{
	struct input_handler *handler = handle->handler;

	list_add_tail(&handle->d_node, &handle->dev->h_list);//hardware side with the h_list
	list_add_tail(&handle->h_node, &handler->h_list);// sofeware side with the h_list

	if (handler->start)
		handler->start(handle);

	return 0;
}

```
```c

/work/system/linux-2.6.22.6/drivers/input/input.c:1313:
subsys_initcall(input_init);
module_exit(input_exit); 

```
- /dev/event0  major 13 minor 65
```c

/work/system/linux-2.6.22.6/drivers/input/input.c:1274:
static const struct file_operations input_fops = {
	.owner = THIS_MODULE,
	.open = input_open_file,
}; 

```
```c

/work/system/linux-2.6.22.6/drivers/input/input.c:1279:
static int __init input_init(void)
{
	int err;

	err = class_register(&input_class);
	if (err) {
		printk(KERN_ERR "input: unable to register input_dev class\n");
		return err;
	}

	err = input_proc_init();
	if (err)
		goto fail1;

	err = register_chrdev(INPUT_MAJOR, "input", &input_fops);
	if (err) {
		printk(KERN_ERR "input: unable to register char major %d", INPUT_MAJOR);
		goto fail2;
	}

	return 0;

 fail2:	input_proc_exit();
 fail1:	class_unregister(&input_class);
	return err;
}

```

```c

/work/system/linux-2.6.22.6/drivers/input/input.c:1243:
static int input_open_file(struct inode *inode, struct file *file)
{
	struct input_handler *handler = input_table[iminor(inode) >> 5];
	const struct file_operations *old_fops, *new_fops = NULL;
	int err;

	/* No load-on-demand here? */
	if (!handler || !(new_fops = fops_get(handler->fops)))
		return -ENODEV;

	/*
	 * That's _really_ odd. Usually NULL ->open means "nothing special",
	 * not "no device". Oh, well...
	 */
	if (!new_fops->open) {
		fops_put(new_fops);
		return -ENODEV;
	}
	old_fops = file->f_op;
	file->f_op = new_fops;

	err = new_fops->open(inode, file);

	if (err) {
		fops_put(file->f_op);
		file->f_op = fops_get(old_fops);
	}
	fops_put(old_fops);
	return err;
}

```

```c

/work/system/linux-2.6.22.6/drivers/input/input.c:1182:
int input_register_handler(struct input_handler *handler)
{
	struct input_dev *dev;

	INIT_LIST_HEAD(&handler->h_list);

	if (handler->fops != NULL) {
		if (input_table[handler->minor >> 5])
			return -EBUSY;

		input_table[handler->minor >> 5] = handler;
	}

	list_add_tail(&handler->node, &input_handler_list);

	list_for_each_entry(dev, &input_dev_list, node)
		input_attach_handler(dev, handler);

	input_wakeup_procfs_readers();
	return 0;
}

```

```c

/work/system/linux-2.6.22.6/drivers/input/evdev.c:726:
static int __init evdev_init(void)
{
	return input_register_handler(&evdev_handler);
}

```

```c

/work/system/linux-2.6.22.6/drivers/input/evdev.c:716:
static struct input_handler evdev_handler = {
	.event =	evdev_event,
	.connect =	evdev_connect,
	.disconnect =	evdev_disconnect,
	.fops =		&evdev_fops,
	.minor =	EVDEV_MINOR_BASE,
	.name =		"evdev",
	.id_table =	evdev_ids,
};

```

```c

/work/system/linux-2.6.22.6/drivers/input/evdev.c:609:
static const struct file_operations evdev_fops = {
	.owner =	THIS_MODULE,
	.read =		evdev_read,
	.write =	evdev_write,
	.poll =		evdev_poll,
	.open =		evdev_open,
	.release =	evdev_release,
	.unlocked_ioctl = evdev_ioctl,
#ifdef CONFIG_COMPAT
	.compat_ioctl =	evdev_ioctl_compat,
#endif
	.fasync =	evdev_fasync,
	.flush =	evdev_flush
};

```

```c

/work/system/linux-2.6.22.6/drivers/input/evdev.c:127:
static int evdev_open(struct inode *inode, struct file *file)
{
	struct evdev_client *client;
	struct evdev *evdev;
	int i = iminor(inode) - EVDEV_MINOR_BASE;
	int error;

	if (i >= EVDEV_MINORS)
		return -ENODEV;

	evdev = evdev_table[i];

	if (!evdev || !evdev->exist)
		return -ENODEV;

	client = kzalloc(sizeof(struct evdev_client), GFP_KERNEL);
	if (!client)
		return -ENOMEM;

	client->evdev = evdev;
	list_add_tail(&client->node, &evdev->client_list);

	if (!evdev->open++ && evdev->exist) {
		error = input_open_device(&evdev->handle);
		if (error) {
			list_del(&client->node);
			kfree(client);
			return error;
		}
	}

	file->private_data = client;
	return 0;
}

```


























