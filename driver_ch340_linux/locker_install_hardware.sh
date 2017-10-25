# Script just run with OS Linux, Board controller using ic CH341 or CH340, Scan barcode model made in China
# Run script ./locker_install_hardware
#1. Install the necessary software
sudo apt-get update
sudo apt-get install git -y
sudo apt-get install make -y
sudo apt-get update

#2. Install driver CH430 or CH341 with OS Linux
cd
git clone https://github.com/VanXungUIT/ch340-ubuntu-linux.git
cd ch340-ubuntu-linux/CH341SER_LINUX
sudo apt-get install v4l2loopback-dkms -y
sudo make
sudo make load

#Install done.
x=tem.tem
touch $x
echo "SUBSYSTEM=="tty", ATTRS{serial}=="0000:00:15.0", SYMLINK+="ttyLocker"" >>   $x
echo "SUBSYSTEM=="tty", ATTRS{idVendor}=="0403", ATTRS{idProduct}=="6001", ATTRS{serial}=="A6008isP",  SYMLINK+="ttyLocker"" >>   $x
echo "SUBSYSTEM=="tty", ATTRS{idVendor}=="0403", ATTRS{idProduct}=="6001", ATTRS{serial}=="A7004IXj",  SYMLINK+="ttyLocker"" >>   $x
echo "SUBSYSTEM=="tty", ATTRS{idVendor}=="0403", ATTRS{idProduct}=="6001", ATTRS{serial}=="FTDIF46B",  SYMLINK+="ttyLocker"" >>   $x
sudo mv  $x /etc/udev/rules.d/99-usb-serial.rules
sudo udevadm trigger


#2. Permission for Com Usb to serial Port
sudo adduser $USER dialout
sudo chmod 755 /dev/ttyLocker
sudo chmod 755 /dev/input/by-id/usb-Totinfo_TOT2D_PRODUCT_HID_KBW_MS002-000000000-event-kbd
sudo rm -rf ch340-ubuntu-linux
