/*******************************************************
### Author       : 唐新楼 
### Last modified: 2020-06-20 12:28
### Email        : tangxinlou@wintech.com
### blog         : https://blog.csdn.net/daweigongting
### Filename     : usb_bus.md
### Description  : 
 *******************************************************/
# 识别 USB 设备。

## 分配地址。
choose_address(udev);
## 并告诉 USB 设备(set address)。
hub_set_address
## 发出命令获取描述符。
# 查找并安装对应的设备驱动程序
# 提供 USB 读写函数






# usb 1-1: new full speed USB device using s3c2410-ohci and address 2

```c

/work/system/linux-2.6.22.6/drivers/usb/core/hub.c:2843:
static struct usb_driver hub_driver = {
	.name =		"hub",
	.probe =	hub_probe,
	.disconnect =	hub_disconnect,
	.suspend =	hub_suspend,
	.resume =	hub_resume,
	.pre_reset =	hub_pre_reset,
	.post_reset =	hub_post_reset,
	.ioctl =	hub_ioctl,
	.id_table =	hub_id_table,
	.supports_autosuspend =	1,
}; 

```

```c

/work/system/linux-2.6.22.6/drivers/usb/core/hub.c:2856:
int usb_hub_init(void)
{
	if (usb_register(&hub_driver) < 0) {
		printk(KERN_ERR "%s: can't register hub driver\n",
			usbcore_name);
		return -1;
	}

	khubd_task = kthread_run(hub_thread, NULL, "khubd");
	if (!IS_ERR(khubd_task))
		return 0;

	/* Fall through if kernel_thread failed */
	usb_deregister(&hub_driver);
	printk(KERN_ERR "%s: can't start khubd\n", usbcore_name);

	return -1;
}

```

```c

/work/system/linux-2.6.22.6/drivers/usb/core/usb.c:863:
static int __init usb_init(void)
{
	int retval;
	if (nousb) {
		pr_info("%s: USB support disabled\n", usbcore_name);
		return 0;
	}

	retval = ksuspend_usb_init();
	if (retval)
		goto out;
	retval = bus_register(&usb_bus_type);
	if (retval) 
		goto bus_register_failed;
	retval = usb_host_init();
	if (retval)
		goto host_init_failed;
	retval = usb_major_init();
	if (retval)
		goto major_init_failed;
	retval = usb_register(&usbfs_driver);
	if (retval)
		goto driver_register_failed;
	retval = usb_devio_init();
	if (retval)
		goto usb_devio_init_failed;
	retval = usbfs_init();
	if (retval)
		goto fs_init_failed;
	retval = usb_hub_init();
	if (retval)
		goto hub_init_failed;
	retval = usb_register_device_driver(&usb_generic_driver, THIS_MODULE);
	if (!retval)
		goto out;

	usb_hub_cleanup();
hub_init_failed:
	usbfs_cleanup();
fs_init_failed:
	usb_devio_cleanup();
usb_devio_init_failed:
	usb_deregister(&usbfs_driver);
driver_register_failed:
	usb_major_cleanup();
major_init_failed:
	usb_host_cleanup();
host_init_failed:
	bus_unregister(&usb_bus_type);
bus_register_failed:
	ksuspend_usb_cleanup();
out:
	return retval;
}

```



 ```c

/work/system/linux-2.6.22.6/drivers/usb/core/hub.c:887:
static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
{
    struct usb_host_interface *desc;
    struct usb_endpoint_descriptor *endpoint;
    struct usb_device *hdev;
    struct usb_hub *hub;

    desc = intf->cur_altsetting;
    hdev = interface_to_usbdev(intf);

    //#ifdef	CONFIG_USB_OTG_BLACKLIST_HUB
    if (hdev->parent) {
        dev_warn(&intf->dev, "ignoring external hub\n");
        return -ENODEV;
    }
    //#endif

    /* Some hubs have a subclass of 1, which AFAICT according to the */
    /*  specs is not defined, but it works */
    if ((desc->desc.bInterfaceSubClass != 0) &&
            (desc->desc.bInterfaceSubClass != 1)) {
descriptor_error:
        dev_err (&intf->dev, "bad descriptor, ignoring hub\n");
        return -EIO;
    }

    /* Multiple endpoints? What kind of mutant ninja-hub is this? */
    if (desc->desc.bNumEndpoints != 1)
        goto descriptor_error;

    endpoint = &desc->endpoint[0].desc;

    /* If it's not an interrupt in endpoint, we'd better punt! */
    if (!usb_endpoint_is_int_in(endpoint))
        goto descriptor_error;

    /* We found a hub */
    dev_info (&intf->dev, "USB hub found\n");

    hub = kzalloc(sizeof(*hub), GFP_KERNEL);
    if (!hub) {
        dev_dbg (&intf->dev, "couldn't kmalloc hub struct\n");
        return -ENOMEM;
    }

    INIT_LIST_HEAD(&hub->event_list);
    hub->intfdev = &intf->dev;
    hub->hdev = hdev;
    INIT_DELAYED_WORK(&hub->leds, led_work);

    usb_set_intfdata (intf, hub);
    intf->needs_remote_wakeup = 1;

    if (hdev->speed == USB_SPEED_HIGH)
        highspeed_hubs++;

    if (hub_configure(hub, endpoint) >= 0)
        return 0;

    hub_disconnect (intf);
    return -ENODEV;
}

``` 

 ```c

/work/system/linux-2.6.22.6/drivers/usb/core/hub.c:595:
static int hub_configure(struct usb_hub *hub,
        struct usb_endpoint_descriptor *endpoint)
{
    struct usb_device *hdev = hub->hdev;
    struct device *hub_dev = hub->intfdev;
    u16 hubstatus, hubchange;
    u16 wHubCharacteristics;
    unsigned int pipe;
    int maxp, ret;
    char *message;

    hub->buffer = usb_buffer_alloc(hdev, sizeof(*hub->buffer), GFP_KERNEL,
            &hub->buffer_dma);
    if (!hub->buffer) {
        message = "can't allocate hub irq buffer";
        ret = -ENOMEM;
        goto fail;
    }

    hub->status = kmalloc(sizeof(*hub->status), GFP_KERNEL);
    if (!hub->status) {
        message = "can't kmalloc hub status buffer";
        ret = -ENOMEM;
        goto fail;
    }
    mutex_init(&hub->status_mutex);

    hub->descriptor = kmalloc(sizeof(*hub->descriptor), GFP_KERNEL);
    if (!hub->descriptor) {
        message = "can't kmalloc hub descriptor";
        ret = -ENOMEM;
        goto fail;
    }

    /* Request the entire hub descriptor.
     * hub->descriptor can handle USB_MAXCHILDREN ports,
     * but the hub can/will return fewer bytes here.
     */
    ret = get_hub_descriptor(hdev, hub->descriptor,
            sizeof(*hub->descriptor));
    if (ret < 0) {
        message = "can't read hub descriptor";
        goto fail;
    } else if (hub->descriptor->bNbrPorts > USB_MAXCHILDREN) {
        message = "hub has too many ports!";
        ret = -ENODEV;
        goto fail;
    }

    hdev->maxchild = hub->descriptor->bNbrPorts;
    dev_info (hub_dev, "%d port%s detected\n", hdev->maxchild,
            (hdev->maxchild == 1) ? "" : "s");

    wHubCharacteristics = le16_to_cpu(hub->descriptor->wHubCharacteristics);

    if (wHubCharacteristics & HUB_CHAR_COMPOUND) {
        int	i;
        char	portstr [USB_MAXCHILDREN + 1];

        for (i = 0; i < hdev->maxchild; i++)
            portstr[i] = hub->descriptor->DeviceRemovable
                [((i + 1) / 8)] & (1 << ((i + 1) % 8))
                ? 'F' : 'R';
        portstr[hdev->maxchild] = 0;
        dev_dbg(hub_dev, "compound device; port removable status: %s\n", portstr);
    } else
        dev_dbg(hub_dev, "standalone hub\n");

    switch (wHubCharacteristics & HUB_CHAR_LPSM) {
        case 0x00:
            dev_dbg(hub_dev, "ganged power switching\n");
            break;
        case 0x01:
            dev_dbg(hub_dev, "individual port power switching\n");
            break;
        case 0x02:
        case 0x03:
            dev_dbg(hub_dev, "no power switching (usb 1.0)\n");
            break;
    }

    switch (wHubCharacteristics & HUB_CHAR_OCPM) {
        case 0x00:
            dev_dbg(hub_dev, "global over-current protection\n");
            break;
        case 0x08:
            dev_dbg(hub_dev, "individual port over-current protection\n");
            break;
        case 0x10:
        case 0x18:
            dev_dbg(hub_dev, "no over-current protection\n");
            break;
    }

    spin_lock_init (&hub->tt.lock);
    INIT_LIST_HEAD (&hub->tt.clear_list);
    INIT_WORK (&hub->tt.kevent, hub_tt_kevent);
    switch (hdev->descriptor.bDeviceProtocol) {
        case 0:
            break;
        case 1:
            dev_dbg(hub_dev, "Single TT\n");
            hub->tt.hub = hdev;
            break;
        case 2:
            ret = usb_set_interface(hdev, 0, 1);
            if (ret == 0) {
                dev_dbg(hub_dev, "TT per port\n");
                hub->tt.multi = 1;
            } else
                dev_err(hub_dev, "Using single TT (err %d)\n",
                        ret);
            hub->tt.hub = hdev;
            break;
        default:
            dev_dbg(hub_dev, "Unrecognized hub protocol %d\n",
                    hdev->descriptor.bDeviceProtocol);
            break;
    }

    /* Note 8 FS bit times == (8 bits / 12000000 bps) ~= 666ns */
    switch (wHubCharacteristics & HUB_CHAR_TTTT) {
        case HUB_TTTT_8_BITS:
            if (hdev->descriptor.bDeviceProtocol != 0) {
                hub->tt.think_time = 666;
                dev_dbg(hub_dev, "TT requires at most %d "
                        "FS bit times (%d ns)\n",
                        8, hub->tt.think_time);
            }
            break;
        case HUB_TTTT_16_BITS:
            hub->tt.think_time = 666 * 2;
            dev_dbg(hub_dev, "TT requires at most %d "
                    "FS bit times (%d ns)\n",
                    16, hub->tt.think_time);
            break;
        case HUB_TTTT_24_BITS:
            hub->tt.think_time = 666 * 3;
            dev_dbg(hub_dev, "TT requires at most %d "
                    "FS bit times (%d ns)\n",
                    24, hub->tt.think_time);
            break;
        case HUB_TTTT_32_BITS:
            hub->tt.think_time = 666 * 4;
            dev_dbg(hub_dev, "TT requires at most %d "
                    "FS bit times (%d ns)\n",
                    32, hub->tt.think_time);
            break;
    }

    /* probe() zeroes hub->indicator[] */
    if (wHubCharacteristics & HUB_CHAR_PORTIND) {
        hub->has_indicators = 1;
        dev_dbg(hub_dev, "Port indicators are supported\n");
    }

    dev_dbg(hub_dev, "power on to power good time: %dms\n",
            hub->descriptor->bPwrOn2PwrGood * 2);

    /* power budgeting mostly matters with bus-powered hubs,
     * and battery-powered root hubs (may provide just 8 mA).
     */
    ret = usb_get_status(hdev, USB_RECIP_DEVICE, 0, &hubstatus);
    if (ret < 2) {
        message = "can't get hub status";
        goto fail;
    }
    le16_to_cpus(&hubstatus);
    if (hdev == hdev->bus->root_hub) {
        if (hdev->bus_mA == 0 || hdev->bus_mA >= 500)
            hub->mA_per_port = 500;
        else {
            hub->mA_per_port = hdev->bus_mA;
            hub->limited_power = 1;
        }
    } else if ((hubstatus & (1 << USB_DEVICE_SELF_POWERED)) == 0) {
        dev_dbg(hub_dev, "hub controller current requirement: %dmA\n",
                hub->descriptor->bHubContrCurrent);
        hub->limited_power = 1;
        if (hdev->maxchild > 0) {
            int remaining = hdev->bus_mA -
                hub->descriptor->bHubContrCurrent;

            if (remaining < hdev->maxchild * 100)
                dev_warn(hub_dev,
                        "insufficient power available "
                        "to use all downstream ports\n");
            hub->mA_per_port = 100;		/* 7.2.1.1 */
        }
    } else {	/* Self-powered external hub */
        /* FIXME: What about battery-powered external hubs that
         * provide less current per port? */
        hub->mA_per_port = 500;
    }
    if (hub->mA_per_port < 500)
        dev_dbg(hub_dev, "%umA bus power budget for each child\n",
                hub->mA_per_port);

    ret = hub_hub_status(hub, &hubstatus, &hubchange);
    if (ret < 0) {
        message = "can't get hub status";
        goto fail;
    }

    /* local power status reports aren't always correct */
    if (hdev->actconfig->desc.bmAttributes & USB_CONFIG_ATT_SELFPOWER)
        dev_dbg(hub_dev, "local power source is %s\n",
                (hubstatus & HUB_STATUS_LOCAL_POWER)
                ? "lost (inactive)" : "good");

    if ((wHubCharacteristics & HUB_CHAR_OCPM) == 0)
        dev_dbg(hub_dev, "%sover-current condition exists\n",
                (hubstatus & HUB_STATUS_OVERCURRENT) ? "" : "no ");

    /* set up the interrupt endpoint
     * We use the EP's maxpacket size instead of (PORTS+1+7)/8
     * bytes as USB2.0[11.12.3] says because some hubs are known
     * to send more data (and thus cause overflow). For root hubs,
     * maxpktsize is defined in hcd.c's fake endpoint descriptors
     * to be big enough for at least USB_MAXCHILDREN ports. */
    pipe = usb_rcvintpipe(hdev, endpoint->bEndpointAddress);
    maxp = usb_maxpacket(hdev, pipe, usb_pipeout(pipe));

    if (maxp > sizeof(*hub->buffer))
        maxp = sizeof(*hub->buffer);

    hub->urb = usb_alloc_urb(0, GFP_KERNEL);
    if (!hub->urb) {
        message = "couldn't allocate interrupt urb";
        ret = -ENOMEM;
        goto fail;
    }

    usb_fill_int_urb(hub->urb, hdev, pipe, *hub->buffer, maxp, hub_irq,
            hub, endpoint->bInterval);
    hub->urb->transfer_dma = hub->buffer_dma;
    hub->urb->transfer_flags |= URB_NO_TRANSFER_DMA_MAP;

    /* maybe cycle the hub leds */
    if (hub->has_indicators && blinkenlights)
        hub->indicator [0] = INDICATOR_CYCLE;

    hub_power_on(hub);
    hub_activate(hub);
    return 0;

fail:
    dev_err (hub_dev, "config failed, %s (err %d)\n",
            message, ret);
    /* hub_disconnect() frees urb and descriptor */
    return ret;
}

``` 

 ```c

/work/system/linux-2.6.22.6/drivers/usb/core/hub.c:338:
static void hub_irq(struct urb *urb)
{
    struct usb_hub *hub = urb->context;
    int status;
    int i;
    unsigned long bits;

    switch (urb->status) {
        case -ENOENT:		/* synchronous unlink */
        case -ECONNRESET:	/* async unlink */
        case -ESHUTDOWN:	/* hardware going away */
            return;

        default:		/* presumably an error */
            /* Cause a hub reset after 10 consecutive errors */
            dev_dbg (hub->intfdev, "transfer --> %d\n", urb->status);
            if ((++hub->nerrors < 10) || hub->error)
                goto resubmit;
            hub->error = urb->status;
            /* FALL THROUGH */

            /* let khubd handle things */
        case 0:			/* we got data:  port status changed */
            bits = 0;
            for (i = 0; i < urb->actual_length; ++i)
                bits |= ((unsigned long) ((*hub->buffer)[i]))
                    << (i*8);
            hub->event_bits[0] = bits;
            break;
    }

    hub->nerrors = 0;

    /* Something happened, let khubd figure it out */
    kick_khubd(hub);

resubmit:
    if (hub->quiescing)
        return;

    if ((status = usb_submit_urb (hub->urb, GFP_ATOMIC)) != 0
            && status != -ENODEV && status != -EPERM)
        dev_err (hub->intfdev, "resubmit --> %d\n", status);
}

``` 

 ```c

/work/system/linux-2.6.22.6/drivers/usb/core/hub.c:316:
static void kick_khubd(struct usb_hub *hub)
{
    unsigned long	flags;

    /* Suppress autosuspend until khubd runs */
    to_usb_interface(hub->intfdev)->pm_usage_cnt = 1;

    spin_lock_irqsave(&hub_event_lock, flags);
    if (list_empty(&hub->event_list)) {
        list_add_tail(&hub->event_list, &hub_event_list);
        wake_up(&khubd_wait);
    }
    spin_unlock_irqrestore(&hub_event_lock, flags);
}

``` 

 ```c

/work/system/linux-2.6.22.6/drivers/usb/core/hub.c:2819:
static int hub_thread(void *__unused)
{
    do {
        hub_events();
        wait_event_interruptible(khubd_wait,
                !list_empty(&hub_event_list) ||
                kthread_should_stop());
        try_to_freeze();
    } while (!kthread_should_stop() || !list_empty(&hub_event_list));

    pr_debug("%s: khubd exiting\n", usbcore_name);
    return 0;
}

``` 

 ```c

/work/system/linux-2.6.22.6/drivers/usb/core/hub.c:2597:
static void hub_events(void)
{
    struct list_head *tmp;
    struct usb_device *hdev;
    struct usb_interface *intf;
    struct usb_hub *hub;
    struct device *hub_dev;
    u16 hubstatus;
    u16 hubchange;
    u16 portstatus;
    u16 portchange;
    int i, ret;
    int connect_change;

    /*
     *  We restart the list every time to avoid a deadlock with
     * deleting hubs downstream from this one. This should be
     * safe since we delete the hub from the event list.
     * Not the most efficient, but avoids deadlocks.
     */
    while (1) {

        /* Grab the first entry at the beginning of the list */
        spin_lock_irq(&hub_event_lock);
        if (list_empty(&hub_event_list)) {
            spin_unlock_irq(&hub_event_lock);
            break;
        }

        tmp = hub_event_list.next;
        list_del_init(tmp);

        hub = list_entry(tmp, struct usb_hub, event_list);
        hdev = hub->hdev;
        intf = to_usb_interface(hub->intfdev);
        hub_dev = &intf->dev;

        dev_dbg(hub_dev, "state %d ports %d chg %04x evt %04x\n",
                hdev->state, hub->descriptor
                ? hub->descriptor->bNbrPorts
                : 0,
                /* NOTE: expects max 15 ports... */
                (u16) hub->change_bits[0],
                (u16) hub->event_bits[0]);

        usb_get_intf(intf);
        spin_unlock_irq(&hub_event_lock);

        /* Lock the device, then check to see if we were
         * disconnected while waiting for the lock to succeed. */
        if (locktree(hdev) < 0) {
            usb_put_intf(intf);
            continue;
        }
        if (hub != usb_get_intfdata(intf))
            goto loop;

        /* If the hub has died, clean up after it */
        if (hdev->state == USB_STATE_NOTATTACHED) {
            hub->error = -ENODEV;
            hub_pre_reset(intf);
            goto loop;
        }

        /* Autoresume */
        ret = usb_autopm_get_interface(intf);
        if (ret) {
            dev_dbg(hub_dev, "Can't autoresume: %d\n", ret);
            goto loop;
        }

        /* If this is an inactive hub, do nothing */
        if (hub->quiescing)
            goto loop_autopm;

        if (hub->error) {
            dev_dbg (hub_dev, "resetting for error %d\n",
                    hub->error);

            ret = usb_reset_composite_device(hdev, intf);
            if (ret) {
                dev_dbg (hub_dev,
                        "error resetting hub: %d\n", ret);
                goto loop_autopm;
            }

            hub->nerrors = 0;
            hub->error = 0;
        }

        /* deal with port status changes */
        for (i = 1; i <= hub->descriptor->bNbrPorts; i++) {
            if (test_bit(i, hub->busy_bits))
                continue;
            connect_change = test_bit(i, hub->change_bits);
            if (!test_and_clear_bit(i, hub->event_bits) &&
                    !connect_change && !hub->activating)
                continue;

            ret = hub_port_status(hub, i,
                    &portstatus, &portchange);
            if (ret < 0)
                continue;

            if (hub->activating && !hdev->children[i-1] &&
                    (portstatus &
                     USB_PORT_STAT_CONNECTION))
                connect_change = 1;

            if (portchange & USB_PORT_STAT_C_CONNECTION) {
                clear_port_feature(hdev, i,
                        USB_PORT_FEAT_C_CONNECTION);
                connect_change = 1;
            }

            if (portchange & USB_PORT_STAT_C_ENABLE) {
                if (!connect_change)
                    dev_dbg (hub_dev,
                            "port %d enable change, "
                            "status %08x\n",
                            i, portstatus);
                clear_port_feature(hdev, i,
                        USB_PORT_FEAT_C_ENABLE);

                /*
                 * EM interference sometimes causes badly
                 * shielded USB devices to be shutdown by
                 * the hub, this hack enables them again.
                 * Works at least with mouse driver. 
                 */
                if (!(portstatus & USB_PORT_STAT_ENABLE)
                        && !connect_change
                        && hdev->children[i-1]) {
                    dev_err (hub_dev,
                            "port %i "
                            "disabled by hub (EMI?), "
                            "re-enabling...\n",
                            i);
                    connect_change = 1;
                }
            }

            if (portchange & USB_PORT_STAT_C_SUSPEND) {
                clear_port_feature(hdev, i,
                        USB_PORT_FEAT_C_SUSPEND);
                if (hdev->children[i-1]) {
                    ret = remote_wakeup(hdev->
                            children[i-1]);
                    if (ret < 0)
                        connect_change = 1;
                } else {
                    ret = -ENODEV;
                    hub_port_disable(hub, i, 1);
                }
                dev_dbg (hub_dev,
                        "resume on port %d, status %d\n",
                        i, ret);
            }

            if (portchange & USB_PORT_STAT_C_OVERCURRENT) {
                dev_err (hub_dev,
                        "over-current change on port %d\n",
                        i);
                clear_port_feature(hdev, i,
                        USB_PORT_FEAT_C_OVER_CURRENT);
                hub_power_on(hub);
            }

            if (portchange & USB_PORT_STAT_C_RESET) {
                dev_dbg (hub_dev,
                        "reset change on port %d\n",
                        i);
                clear_port_feature(hdev, i,
                        USB_PORT_FEAT_C_RESET);
            }

            if (connect_change)
                hub_port_connect_change(hub, i,
                        portstatus, portchange);
        } /* end for i */

        /* deal with hub status changes */
        if (test_and_clear_bit(0, hub->event_bits) == 0)
            ;	/* do nothing */
        else if (hub_hub_status(hub, &hubstatus, &hubchange) < 0)
            dev_err (hub_dev, "get_hub_status failed\n");
        else {
            if (hubchange & HUB_CHANGE_LOCAL_POWER) {
                dev_dbg (hub_dev, "power change\n");
                clear_hub_feature(hdev, C_HUB_LOCAL_POWER);
                if (hubstatus & HUB_STATUS_LOCAL_POWER)
                    /* FIXME: Is this always true? */
                    hub->limited_power = 0;
                else
                    hub->limited_power = 1;
            }
            if (hubchange & HUB_CHANGE_OVERCURRENT) {
                dev_dbg (hub_dev, "overcurrent change\n");
                msleep(500);	/* Cool down */
                clear_hub_feature(hdev, C_HUB_OVER_CURRENT);
                hub_power_on(hub);
            }
        }

        hub->activating = 0;

        /* If this is a root hub, tell the HCD it's okay to
         * re-enable port-change interrupts now. */
        if (!hdev->parent && !hub->busy_bits[0])
            usb_enable_root_hub_irq(hdev->bus);

loop_autopm:
        /* Allow autosuspend if we're not going to run again */
        if (list_empty(&hub->event_list))
            usb_autopm_enable(intf);
loop:
        usb_unlock_device(hdev);
        usb_put_intf(intf);

    } /* end while (1) */
}

``` 

 ```c

/work/system/linux-2.6.22.6/drivers/usb/core/hub.c:2414:
static void hub_port_connect_change(struct usb_hub *hub, int port1,
        u16 portstatus, u16 portchange)
{
    struct usb_device *hdev = hub->hdev;
    struct device *hub_dev = hub->intfdev;
    u16 wHubCharacteristics = le16_to_cpu(hub->descriptor->wHubCharacteristics);
    int status, i;

    dev_dbg (hub_dev,
            "port %d, status %04x, change %04x, %s\n",
            port1, portstatus, portchange, portspeed (portstatus));

    if (hub->has_indicators) {
        set_port_led(hub, port1, HUB_LED_AUTO);
        hub->indicator[port1-1] = INDICATOR_AUTO;
    }

    /* Disconnect any existing devices under this port */
    if (hdev->children[port1-1])
        usb_disconnect(&hdev->children[port1-1]);
    clear_bit(port1, hub->change_bits);

    //#ifdef	CONFIG_USB_OTG
    /* during HNP, don't repeat the debounce */
    if (hdev->bus->is_b_host)
        portchange &= ~USB_PORT_STAT_C_CONNECTION;
    //#endif

    if (portchange & USB_PORT_STAT_C_CONNECTION) {
        status = hub_port_debounce(hub, port1);
        if (status < 0) {
            if (printk_ratelimit())
                dev_err (hub_dev, "connect-debounce failed, "
                        "port %d disabled\n", port1);
            goto done;
        }
        portstatus = status;
    }

    /* Return now if nothing is connected */
    if (!(portstatus & USB_PORT_STAT_CONNECTION)) {

        /* maybe switch power back on (e.g. root hub was reset) */
        if ((wHubCharacteristics & HUB_CHAR_LPSM) < 2
                && !(portstatus & (1 << USB_PORT_FEAT_POWER)))
            set_port_feature(hdev, port1, USB_PORT_FEAT_POWER);

        if (portstatus & USB_PORT_STAT_ENABLE)
            goto done;
        return;
    }

    //#ifdef  CONFIG_USB_SUSPEND
    /* If something is connected, but the port is suspended, wake it up. */
    if (portstatus & USB_PORT_STAT_SUSPEND) {
        status = hub_port_resume(hub, port1, NULL);
        if (status < 0) {
            dev_dbg(hub_dev,
                    "can't clear suspend on port %d; %d\n",
                    port1, status);
            goto done;
        }
    }
    //#endif

    for (i = 0; i < SET_CONFIG_TRIES; i++) {
        struct usb_device *udev;

        /* reallocate for each attempt, since references
         * to the previous one can escape in various ways
         */
        udev = usb_alloc_dev(hdev, hdev->bus, port1);
        if (!udev) {
            dev_err (hub_dev,
                    "couldn't allocate port %d usb_device\n",
                    port1);
            goto done;
        }

        usb_set_device_state(udev, USB_STATE_POWERED);
        udev->speed = USB_SPEED_UNKNOWN;
        udev->bus_mA = hub->mA_per_port;
        udev->level = hdev->level + 1;

        /* set the address */
        choose_address(udev);
        if (udev->devnum <= 0) {
            status = -ENOTCONN;	/* Don't retry */
            goto loop;
        }

        /* reset and get descriptor */
        status = hub_port_init(hub, udev, port1, i);
        if (status < 0)
            goto loop;

        /* consecutive bus-powered hubs aren't reliable; they can
         * violate the voltage drop budget.  if the new child has
         * a "powered" LED, users should notice we didn't enable it
         * (without reading syslog), even without per-port LEDs
         * on the parent.
         */
        if (udev->descriptor.bDeviceClass == USB_CLASS_HUB
                && udev->bus_mA <= 100) {
            u16	devstat;

            status = usb_get_status(udev, USB_RECIP_DEVICE, 0,
                    &devstat);
            if (status < 2) {
                dev_dbg(&udev->dev, "get status %d ?\n", status);
                goto loop_disable;
            }
            le16_to_cpus(&devstat);
            if ((devstat & (1 << USB_DEVICE_SELF_POWERED)) == 0) {
                dev_err(&udev->dev,
                        "can't connect bus-powered hub "
                        "to this port\n");
                if (hub->has_indicators) {
                    hub->indicator[port1-1] =
                        INDICATOR_AMBER_BLINK;
                    schedule_delayed_work (&hub->leds, 0);
                }
                status = -ENOTCONN;	/* Don't retry */
                goto loop_disable;
            }
        }

        /* check for devices running slower than they could */
        if (le16_to_cpu(udev->descriptor.bcdUSB) >= 0x0200
                && udev->speed == USB_SPEED_FULL
                && highspeed_hubs != 0)
            check_highspeed (hub, udev, port1);

        /* Store the parent's children[] pointer.  At this point
         * udev becomes globally accessible, although presumably
         * no one will look at it until hdev is unlocked.
         */
        status = 0;

        /* We mustn't add new devices if the parent hub has
         * been disconnected; we would race with the
         * recursively_mark_NOTATTACHED() routine.
         */
        spin_lock_irq(&device_state_lock);
        if (hdev->state == USB_STATE_NOTATTACHED)
            status = -ENOTCONN;
        else
            hdev->children[port1-1] = udev;
        spin_unlock_irq(&device_state_lock);

        /* Run it through the hoops (find a driver, etc) */
        if (!status) {
            status = usb_new_device(udev);
            if (status) {
                spin_lock_irq(&device_state_lock);
                hdev->children[port1-1] = NULL;
                spin_unlock_irq(&device_state_lock);
            }
        }

        if (status)
            goto loop_disable;

        status = hub_power_remaining(hub);
        if (status)
            dev_dbg(hub_dev, "%dmA power budget left\n", status);

        return;

loop_disable:
        hub_port_disable(hub, port1, 1);
loop:
        ep0_reinit(udev);
        release_address(udev);
        usb_put_dev(udev);
        if (status == -ENOTCONN)
            break;
    }

done:
    hub_port_disable(hub, port1, 1);
}

```
 
 ```c

/work/system/linux-2.6.22.6/drivers/usb/core/hub.c:2108:
hub_port_init (struct usb_hub *hub, struct usb_device *udev, int port1,
        int retry_counter)
{
    static DEFINE_MUTEX(usb_address0_mutex);

    struct usb_device	*hdev = hub->hdev;
    int			i, j, retval;
    unsigned		delay = HUB_SHORT_RESET_TIME;
    enum usb_device_speed	oldspeed = udev->speed;
    char 			*speed, *type;

    /* root hub ports have a slightly longer reset period
     * (from USB 2.0 spec, section 7.1.7.5)
     */
    if (!hdev->parent) {
        delay = HUB_ROOT_RESET_TIME;
        if (port1 == hdev->bus->otg_port)
            hdev->bus->b_hnp_enable = 0;
    }

    /* Some low speed devices have problems with the quick delay, so */
    /*  be a bit pessimistic with those devices. RHbug #23670 */
    if (oldspeed == USB_SPEED_LOW)
        delay = HUB_LONG_RESET_TIME;

    mutex_lock(&usb_address0_mutex);

    /* Reset the device; full speed may morph to high speed */
    retval = hub_port_reset(hub, port1, udev, delay);
    if (retval < 0)		/* error or disconnect */
        goto fail;
    /* success, speed is known */
    retval = -ENODEV;

    if (oldspeed != USB_SPEED_UNKNOWN && oldspeed != udev->speed) {
        dev_dbg(&udev->dev, "device reset changed speed!\n");
        goto fail;
    }
    oldspeed = udev->speed;

    /* USB 2.0 section 5.5.3 talks about ep0 maxpacket ...
     * it's fixed size except for full speed devices.
     * For Wireless USB devices, ep0 max packet is always 512 (tho
     * reported as 0xff in the device descriptor). WUSB1.0[4.8.1].
     */
    switch (udev->speed) {
        case USB_SPEED_VARIABLE:	/* fixed at 512 */
            udev->ep0.desc.wMaxPacketSize = __constant_cpu_to_le16(512);
            break;
        case USB_SPEED_HIGH:		/* fixed at 64 */
            udev->ep0.desc.wMaxPacketSize = __constant_cpu_to_le16(64);
            break;
        case USB_SPEED_FULL:		/* 8, 16, 32, or 64 */
            /* to determine the ep0 maxpacket size, try to read
             * the device descriptor to get bMaxPacketSize0 and
             * then correct our initial guess.
             */
            udev->ep0.desc.wMaxPacketSize = __constant_cpu_to_le16(64);
            break;
        case USB_SPEED_LOW:		/* fixed at 8 */
            udev->ep0.desc.wMaxPacketSize = __constant_cpu_to_le16(8);
            break;
        default:
            goto fail;
    }

    type = "";
    switch (udev->speed) {
        case USB_SPEED_LOW:	speed = "low";	break;
        case USB_SPEED_FULL:	speed = "full";	break;
        case USB_SPEED_HIGH:	speed = "high";	break;
        case USB_SPEED_VARIABLE:
                                speed = "variable";
                                type = "Wireless ";
                                break;
        default: 		speed = "?";	break;
    }
    dev_info (&udev->dev,
            "%s %s speed %sUSB device using %s and address %d\n",
            (udev->config) ? "reset" : "new", speed, type,
            udev->bus->controller->driver->name, udev->devnum);

    /* Set up TT records, if needed  */
    if (hdev->tt) {
        udev->tt = hdev->tt;
        udev->ttport = hdev->ttport;
    } else if (udev->speed != USB_SPEED_HIGH
            && hdev->speed == USB_SPEED_HIGH) {
        udev->tt = &hub->tt;
        udev->ttport = port1;
    }

    /* Why interleave GET_DESCRIPTOR and SET_ADDRESS this way?
     * Because device hardware and firmware is sometimes buggy in
     * this area, and this is how Linux has done it for ages.
     * Change it cautiously.
     *
     * NOTE:  If USE_NEW_SCHEME() is true we will start by issuing
     * a 64-byte GET_DESCRIPTOR request.  This is what Windows does,
     * so it may help with some non-standards-compliant devices.
     * Otherwise we start with SET_ADDRESS and then try to read the
     * first 8 bytes of the device descriptor to get the ep0 maxpacket
     * value.
     */
    for (i = 0; i < GET_DESCRIPTOR_TRIES; (++i, msleep(100))) {
        if (USE_NEW_SCHEME(retry_counter)) {
            struct usb_device_descriptor *buf;
            int r = 0;

            //#define GET_DESCRIPTOR_BUFSIZE	64
            buf = kmalloc(GET_DESCRIPTOR_BUFSIZE, GFP_NOIO);
            if (!buf) {
                retval = -ENOMEM;
                continue;
            }

            /* Retry on all errors; some devices are flakey.
             * 255 is for WUSB devices, we actually need to use
             * 512 (WUSB1.0[4.8.1]).
             */
            for (j = 0; j < 3; ++j) {
                buf->bMaxPacketSize0 = 0;
                r = usb_control_msg(udev, usb_rcvaddr0pipe(),
                        USB_REQ_GET_DESCRIPTOR, USB_DIR_IN,
                        USB_DT_DEVICE << 8, 0,
                        buf, GET_DESCRIPTOR_BUFSIZE,
                        USB_CTRL_GET_TIMEOUT);
                switch (buf->bMaxPacketSize0) {
                    case 8: case 16: case 32: case 64: case 255:
                        if (buf->bDescriptorType ==
                                USB_DT_DEVICE) {
                            r = 0;
                            break;
                        }
                        /* FALL THROUGH */
                    default:
                        if (r == 0)
                            r = -EPROTO;
                        break;
                }
                if (r == 0)
                    break;
            }
            udev->descriptor.bMaxPacketSize0 =
                buf->bMaxPacketSize0;
            kfree(buf);

            retval = hub_port_reset(hub, port1, udev, delay);
            if (retval < 0)		/* error or disconnect */
                goto fail;
            if (oldspeed != udev->speed) {
                dev_dbg(&udev->dev,
                        "device reset changed speed!\n");
                retval = -ENODEV;
                goto fail;
            }
            if (r) {
                dev_err(&udev->dev, "device descriptor "
                        "read/%s, error %d\n",
                        "64", r);
                retval = -EMSGSIZE;
                continue;
            }
            //#undef GET_DESCRIPTOR_BUFSIZE
        }

        for (j = 0; j < SET_ADDRESS_TRIES; ++j) {
            retval = hub_set_address(udev);
            if (retval >= 0)
                break;
            msleep(200);
        }
        if (retval < 0) {
            dev_err(&udev->dev,
                    "device not accepting address %d, error %d\n",
                    udev->devnum, retval);
            goto fail;
        }

        /* cope with hardware quirkiness:
         *  - let SET_ADDRESS settle, some device hardware wants it
         *  - read ep0 maxpacket even for high and low speed,
         */
        msleep(10);
        if (USE_NEW_SCHEME(retry_counter))
            break;

        retval = usb_get_device_descriptor(udev, 8);
        if (retval < 8) {
            dev_err(&udev->dev, "device descriptor "
                    "read/%s, error %d\n",
                    "8", retval);
            if (retval >= 0)
                retval = -EMSGSIZE;
        } else {
            retval = 0;
            break;
        }
    }
    if (retval)
        goto fail;

    i = udev->descriptor.bMaxPacketSize0 == 0xff?
        512 : udev->descriptor.bMaxPacketSize0;
    if (le16_to_cpu(udev->ep0.desc.wMaxPacketSize) != i) {
        if (udev->speed != USB_SPEED_FULL ||
                !(i == 8 || i == 16 || i == 32 || i == 64)) {
            dev_err(&udev->dev, "ep0 maxpacket = %d\n", i);
            retval = -EMSGSIZE;
            goto fail;
        }
        dev_dbg(&udev->dev, "ep0 maxpacket = %d\n", i);
        udev->ep0.desc.wMaxPacketSize = cpu_to_le16(i);
        ep0_reinit(udev);
    }

    retval = usb_get_device_descriptor(udev, USB_DT_DEVICE_SIZE);
    if (retval < (signed)sizeof(udev->descriptor)) {
        dev_err(&udev->dev, "device descriptor read/%s, error %d\n",
                "all", retval);
        if (retval >= 0)
            retval = -ENOMSG;
        goto fail;
    }

    retval = 0;

fail:
    if (retval)
        hub_port_disable(hub, port1, 0);
    mutex_unlock(&usb_address0_mutex);
    return retval;
}

``` 

 ```c

/work/system/linux-2.6.22.6/drivers/usb/core/hub.c:1132:
static void choose_address(struct usb_device *udev)
{
    int		devnum;
    struct usb_bus	*bus = udev->bus;

    /* If khubd ever becomes multithreaded, this will need a lock */

    /* Try to allocate the next devnum beginning at bus->devnum_next. */
    devnum = find_next_zero_bit(bus->devmap.devicemap, 128,
            bus->devnum_next);
    if (devnum >= 128)
        devnum = find_next_zero_bit(bus->devmap.devicemap, 128, 1);

    bus->devnum_next = ( devnum >= 127 ? 1 : devnum + 1);

    if (devnum < 128) {
        set_bit(devnum, bus->devmap.devicemap);
        udev->devnum = devnum;
    }
}

```

 
```
```c

/work/system/linux-2.6.22.6/drivers/usb/core/hub.c:2078:
static int hub_set_address(struct usb_device *udev)
{
    int retval;

    if (udev->devnum == 0)
        return -EINVAL;
    if (udev->state == USB_STATE_ADDRESS)
        return 0;
    if (udev->state != USB_STATE_DEFAULT)
        return -EINVAL;
    retval = usb_control_msg(udev, usb_sndaddr0pipe(),
            USB_REQ_SET_ADDRESS, 0, udev->devnum, 0,
            NULL, 0, USB_CTRL_SET_TIMEOUT);
    if (retval == 0) {
        usb_set_device_state(udev, USB_STATE_ADDRESS);
        ep0_reinit(udev);
    }
    return retval;
}

``` 
 ```c

/work/system/linux-2.6.22.6/drivers/usb/core/message.c:860:
int usb_get_device_descriptor(struct usb_device *dev, unsigned int size)
{
    struct usb_device_descriptor *desc;
    int ret;

    if (size > sizeof(*desc))
        return -EINVAL;
    desc = kmalloc(sizeof(*desc), GFP_NOIO);
    if (!desc)
        return -ENOMEM;

    ret = usb_get_descriptor(dev, USB_DT_DEVICE, 0, desc, size);
    if (ret >= 0) 
        memcpy(&dev->descriptor, desc, size);
    kfree(desc);
    return ret;
}


 ```c

/work/system/linux-2.6.22.6/drivers/usb/core/hub.c:1295:
int usb_new_device(struct usb_device *udev)
{
    int err;

    /* Determine quirks */
    usb_detect_quirks(udev);

    err = usb_get_configuration(udev);
    if (err < 0) {
        dev_err(&udev->dev, "can't read configurations, error %d\n",
                err);
        goto fail;
    }

    /* read the standard strings and cache them if present */
    udev->product = usb_cache_string(udev, udev->descriptor.iProduct);
    udev->manufacturer = usb_cache_string(udev,
            udev->descriptor.iManufacturer);
    udev->serial = usb_cache_string(udev, udev->descriptor.iSerialNumber);

    /* Tell the world! */
    dev_dbg(&udev->dev, "new device strings: Mfr=%d, Product=%d, "
            "SerialNumber=%d\n",
            udev->descriptor.iManufacturer,
            udev->descriptor.iProduct,
            udev->descriptor.iSerialNumber);
    show_string(udev, "Product", udev->product);
    show_string(udev, "Manufacturer", udev->manufacturer);
    show_string(udev, "SerialNumber", udev->serial);

//#ifdef	CONFIG_USB_OTG
    /*
     * OTG-aware devices on OTG-capable root hubs may be able to use SRP,
     * to wake us after we've powered off VBUS; and HNP, switching roles
     * "host" to "peripheral".  The OTG descriptor helps figure this out.
     */
    if (!udev->bus->is_b_host
            && udev->config
            && udev->parent == udev->bus->root_hub) {
        struct usb_otg_descriptor	*desc = 0;
        struct usb_bus			*bus = udev->bus;

        /* descriptor may appear anywhere in config */
        if (__usb_get_extra_descriptor (udev->rawdescriptors[0],
                    le16_to_cpu(udev->config[0].desc.wTotalLength),
                    USB_DT_OTG, (void **) &desc) == 0) {
            if (desc->bmAttributes & USB_OTG_HNP) {
                unsigned		port1 = udev->portnum;

                dev_info(&udev->dev,
                        "Dual-Role OTG device on %sHNP port\n",
                        (port1 == bus->otg_port)
                        ? "" : "non-");

                /* enable HNP before suspend, it's simpler */
                if (port1 == bus->otg_port)
                    bus->b_hnp_enable = 1;
                err = usb_control_msg(udev,
                        usb_sndctrlpipe(udev, 0),
                        USB_REQ_SET_FEATURE, 0,
                        bus->b_hnp_enable
                        ? USB_DEVICE_B_HNP_ENABLE
                        : USB_DEVICE_A_ALT_HNP_SUPPORT,
                        0, NULL, 0, USB_CTRL_SET_TIMEOUT);
                if (err < 0) {
                    /* OTG MESSAGE: report errors here,
                     * customize to match your product.
                     */
                    dev_info(&udev->dev,
                            "can't set HNP mode; %d\n",
                            err);
                    bus->b_hnp_enable = 0;
                }
            }
        }
    }

    if (!is_targeted(udev)) {

        /* Maybe it can talk to us, though we can't talk to it.
         * (Includes HNP test device.)
         */
        if (udev->bus->b_hnp_enable || udev->bus->is_b_host) {
            err = __usb_port_suspend(udev, udev->bus->otg_port);
            if (err < 0)
                dev_dbg(&udev->dev, "HNP fail, %d\n", err);
        }
        err = -ENODEV;
        goto fail;
    }
//#endif

    /* export the usbdev device-node for libusb */
    udev->dev.devt = MKDEV(USB_DEVICE_MAJOR,
            (((udev->bus->busnum-1) * 128) + (udev->devnum-1)));

    /* Increment the parent's count of unsuspended children */
    if (udev->parent)
        usb_autoresume_device(udev->parent);

    /* Register the device.  The device driver is responsible
     * for adding the device files to sysfs and for configuring
     * the device.
     */
    err = device_add(&udev->dev);
    if (err) {
        dev_err(&udev->dev, "can't device_add, error %d\n", err);
        if (udev->parent)
            usb_autosuspend_device(udev->parent);
        goto fail;
    }

exit:
    return err;

fail:
    usb_set_device_state(udev, USB_STATE_NOTATTACHED);
    goto exit;
}

``` 

 ```c

/work/system/linux-2.6.22.6/drivers/usb/core/config.c:476:
int usb_get_configuration(struct usb_device *dev)
{
    struct device *ddev = &dev->dev;
    int ncfg = dev->descriptor.bNumConfigurations;
    int result = -ENOMEM;
    unsigned int cfgno, length;
    unsigned char *buffer;
    unsigned char *bigbuffer;
    struct usb_config_descriptor *desc;

    if (ncfg > USB_MAXCONFIG) {
        dev_warn(ddev, "too many configurations: %d, "
                "using maximum allowed: %d\n", ncfg, USB_MAXCONFIG);
        dev->descriptor.bNumConfigurations = ncfg = USB_MAXCONFIG;
    }

    if (ncfg < 1) {
        dev_err(ddev, "no configurations\n");
        return -EINVAL;
    }

    length = ncfg * sizeof(struct usb_host_config);
    dev->config = kzalloc(length, GFP_KERNEL);
    if (!dev->config)
        goto err2;

    length = ncfg * sizeof(char *);
    dev->rawdescriptors = kzalloc(length, GFP_KERNEL);
    if (!dev->rawdescriptors)
        goto err2;

    buffer = kmalloc(USB_DT_CONFIG_SIZE, GFP_KERNEL);
    if (!buffer)
        goto err2;
    desc = (struct usb_config_descriptor *)buffer;

    for (cfgno = 0; cfgno < ncfg; cfgno++) {
        /* We grab just the first descriptor so we know how long
         * the whole configuration is */
        result = usb_get_descriptor(dev, USB_DT_CONFIG, cfgno,
                buffer, USB_DT_CONFIG_SIZE);
        if (result < 0) {
            dev_err(ddev, "unable to read config index %d "
                    "descriptor/%s\n", cfgno, "start");
            dev_err(ddev, "chopping to %d config(s)\n", cfgno);
            dev->descriptor.bNumConfigurations = cfgno;
            break;
        } else if (result < 4) {
            dev_err(ddev, "config index %d descriptor too short "
                    "(expected %i, got %i)\n", cfgno,
                    USB_DT_CONFIG_SIZE, result);
            result = -EINVAL;
            goto err;
        }
        length = max((int) le16_to_cpu(desc->wTotalLength),
                USB_DT_CONFIG_SIZE);

        /* Now that we know the length, get the whole thing */
        bigbuffer = kmalloc(length, GFP_KERNEL);
        if (!bigbuffer) {
            result = -ENOMEM;
            goto err;
        }
        result = usb_get_descriptor(dev, USB_DT_CONFIG, cfgno,
                bigbuffer, length);
        if (result < 0) {
            dev_err(ddev, "unable to read config index %d "
                    "descriptor/%s\n", cfgno, "all");
            kfree(bigbuffer);
            goto err;
        }
        if (result < length) {
            dev_warn(ddev, "config index %d descriptor too short "
                    "(expected %i, got %i)\n", cfgno, length, result);
            length = result;
        }

        dev->rawdescriptors[cfgno] = bigbuffer;

        result = usb_parse_configuration(&dev->dev, cfgno,
                &dev->config[cfgno], bigbuffer, length);
        if (result < 0) {
            ++cfgno;
            goto err;
        }
    }
    result = 0;

err:
    kfree(buffer);
    dev->descriptor.bNumConfigurations = cfgno;
err2:
    if (result == -ENOMEM)
        dev_err(ddev, "out of memory\n");
    return result;
}

``` 

 ```c

/work/system/linux-2.6.22.6/drivers/usb/core/config.c:264:
static int usb_parse_configuration(struct device *ddev, int cfgidx,
        struct usb_host_config *config, unsigned char *buffer, int size)
{
    unsigned char *buffer0 = buffer;
    int cfgno;
    int nintf, nintf_orig;
    int i, j, n;
    struct usb_interface_cache *intfc;
    unsigned char *buffer2;
    int size2;
    struct usb_descriptor_header *header;
    int len, retval;
    u8 inums[USB_MAXINTERFACES], nalts[USB_MAXINTERFACES];

    memcpy(&config->desc, buffer, USB_DT_CONFIG_SIZE);
    if (config->desc.bDescriptorType != USB_DT_CONFIG ||
            config->desc.bLength < USB_DT_CONFIG_SIZE) {
        dev_err(ddev, "invalid descriptor for config index %d: "
                "type = 0x%X, length = %d\n", cfgidx,
                config->desc.bDescriptorType, config->desc.bLength);
        return -EINVAL;
    }
    cfgno = config->desc.bConfigurationValue;

    buffer += config->desc.bLength;
    size -= config->desc.bLength;

    nintf = nintf_orig = config->desc.bNumInterfaces;
    if (nintf > USB_MAXINTERFACES) {
        dev_warn(ddev, "config %d has too many interfaces: %d, "
                "using maximum allowed: %d\n",
                cfgno, nintf, USB_MAXINTERFACES);
        nintf = USB_MAXINTERFACES;
    }

    /* Go through the descriptors, checking their length and counting the
     * number of altsettings for each interface */
    n = 0;
    for ((buffer2 = buffer, size2 = size);
            size2 > 0;
            (buffer2 += header->bLength, size2 -= header->bLength)) {

        if (size2 < sizeof(struct usb_descriptor_header)) {
            dev_warn(ddev, "config %d descriptor has %d excess "
                    "byte%s, ignoring\n",
                    cfgno, size2, plural(size2));
            break;
        }

        header = (struct usb_descriptor_header *) buffer2;
        if ((header->bLength > size2) || (header->bLength < 2)) {
            dev_warn(ddev, "config %d has an invalid descriptor "
                    "of length %d, skipping remainder of the config\n",
                    cfgno, header->bLength);
            break;
        }

        if (header->bDescriptorType == USB_DT_INTERFACE) {
            struct usb_interface_descriptor *d;
            int inum;

            d = (struct usb_interface_descriptor *) header;
            if (d->bLength < USB_DT_INTERFACE_SIZE) {
                dev_warn(ddev, "config %d has an invalid "
                        "interface descriptor of length %d, "
                        "skipping\n", cfgno, d->bLength);
                continue;
            }

            inum = d->bInterfaceNumber;
            if (inum >= nintf_orig)
                dev_warn(ddev, "config %d has an invalid "
                        "interface number: %d but max is %d\n",
                        cfgno, inum, nintf_orig - 1);

            /* Have we already encountered this interface?
             * Count its altsettings */
            for (i = 0; i < n; ++i) {
                if (inums[i] == inum)
                    break;
            }
            if (i < n) {
                if (nalts[i] < 255)
                    ++nalts[i];
            } else if (n < USB_MAXINTERFACES) {
                inums[n] = inum;
                nalts[n] = 1;
                ++n;
            }

        } else if (header->bDescriptorType == USB_DT_DEVICE ||
                header->bDescriptorType == USB_DT_CONFIG)
            dev_warn(ddev, "config %d contains an unexpected "
                    "descriptor of type 0x%X, skipping\n",
                    cfgno, header->bDescriptorType);

    }	/* for ((buffer2 = buffer, size2 = size); ...) */
    size = buffer2 - buffer;
    config->desc.wTotalLength = cpu_to_le16(buffer2 - buffer0);

    if (n != nintf)
        dev_warn(ddev, "config %d has %d interface%s, different from "
                "the descriptor's value: %d\n",
                cfgno, n, plural(n), nintf_orig);
    else if (n == 0)
        dev_warn(ddev, "config %d has no interfaces?\n", cfgno);
    config->desc.bNumInterfaces = nintf = n;

    /* Check for missing interface numbers */
    for (i = 0; i < nintf; ++i) {
        for (j = 0; j < nintf; ++j) {
            if (inums[j] == i)
                break;
        }
        if (j >= nintf)
            dev_warn(ddev, "config %d has no interface number "
                    "%d\n", cfgno, i);
    }

    /* Allocate the usb_interface_caches and altsetting arrays */
    for (i = 0; i < nintf; ++i) {
        j = nalts[i];
        if (j > USB_MAXALTSETTING) {
            dev_warn(ddev, "too many alternate settings for "
                    "config %d interface %d: %d, "
                    "using maximum allowed: %d\n",
                    cfgno, inums[i], j, USB_MAXALTSETTING);
            nalts[i] = j = USB_MAXALTSETTING;
        }

        len = sizeof(*intfc) + sizeof(struct usb_host_interface) * j;
        config->intf_cache[i] = intfc = kzalloc(len, GFP_KERNEL);
        if (!intfc)
            return -ENOMEM;
        kref_init(&intfc->ref);
    }

    /* Skip over any Class Specific or Vendor Specific descriptors;
     * find the first interface descriptor */
    config->extra = buffer;
    i = find_next_descriptor(buffer, size, USB_DT_INTERFACE,
            USB_DT_INTERFACE, &n);
    config->extralen = i;
    if (n > 0)
        dev_dbg(ddev, "skipped %d descriptor%s after %s\n",
                n, plural(n), "configuration");
    buffer += i;
    size -= i;

    /* Parse all the interface/altsetting descriptors */
    while (size > 0) {
        retval = usb_parse_interface(ddev, cfgno, config,
                buffer, size, inums, nalts);
        if (retval < 0)
            return retval;

        buffer += retval;
        size -= retval;
    }

    /* Check for missing altsettings */
    for (i = 0; i < nintf; ++i) {
        intfc = config->intf_cache[i];
        for (j = 0; j < intfc->num_altsetting; ++j) {
            for (n = 0; n < intfc->num_altsetting; ++n) {
                if (intfc->altsetting[n].desc.
                        bAlternateSetting == j)
                    break;
            }
            if (n >= intfc->num_altsetting)
                dev_warn(ddev, "config %d interface %d has no "
                        "altsetting %d\n", cfgno, inums[i], j);
        }
    }

    return 0;
}

``` 
















































