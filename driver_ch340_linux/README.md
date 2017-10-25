

### Installing driver
* Program running and installing driver CH340 or CH341 for Linux OS such as flatform: Ubuntu, Raspbian, LUbuntu, Yocto, ...

* Scan barcode model Scan Module Engine Datalogic Gryphon I GFS4400 2D Fixed Barcode Scanner

* You dowload file git, open folder and run command
```sh
$ ./locker_install_hardware.sh
```
or
```sh
$ sudo ./locker_install_hardware.sh
```
* After installed and not see error. You can check again usb using command:
```sh
ls /dev/
```
if you see Com gate name "ttyLocker" then you install success!
Note:
* Chip producted by China
* Link information driver  [Link] (http://www.wch.cn/download/CH341SER_LINUX_ZIP.html)

### If Installing error
You can check usb serial using command
```
lsusb
```
You see new usb to serial
*Output command*: Inportant ID **8087:0a2a**. *It is idVendor and idProduct*
```
Bus 001 Device 005: ID 8087:0a2a Intel Corp.
```
Using command show *ATTRS {serial}*:
```sh
udevadm info -a -n /dev/ttyUSB* | grep '{serial}' | head -n1
```
*Example out command*:
```
ATTRS{serial}=="AL00FNEH"
```
After you edit a few value in file /etc/udev/rules.d/99-usb-serial.rules

You can check again usb using command:
```sh
ls /dev/
```
And you can follow [Link]
(http://hintshop.ludvig.co.nz/show/persistent-names-usb-serial-dev)
