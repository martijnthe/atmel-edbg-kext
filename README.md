# Atmel EDBG Virtual COM Port driver for OS X

This codeless kext uses OS X' built-in [AppleUSBCDCACMData driver][1] to make the serial port of Atmel development boards available as a character device through `/dev/usbmodem*`.

Once installed, you'll be able to attach any serial port program and let it talk to the Atmel board.

For example, using [pyserial miniterm][2] to connect to a [SAMR21 board][3] running one of the example projects:

```
$ python -m serial.tools.miniterm /dev/cu.usbmodem* 115200
--- Miniterm on /dev/cu.usbmodem142422: 115200,8,N,1 ---
--- Quit: Ctrl+]  |  Menu: Ctrl+T | Help: Ctrl+T followed by Ctrl+H ---
 Starting the SmartConnect-6LoWPAN
 Platform : Atmel IoT device...
 ...
```


## Installing

- Current versions of OS X won't allow you to install .kexts that are not properly signed. This .kext is not signed at all (it's pretty hard to get a signing identity from Apple to sign .kexts). You can disable OS X' kext signature checking by doing:

```
sudo nvram boot-args=kext-dev-mode=1
```

To re-enable it (you'll no longer be able to use this driver):

```
sudo nvram boot-args=kext-dev-mode=0
```
- On current versions of OS X, you will have to disable another security feature called "System Integrity Protection". [Check out these instructions on how to do this.][4]
- Finally, `cd` into the root of this repo, then run `./install.sh`.

[1]: http://opensource.apple.com//source/AppleUSBCDCDriver/AppleUSBCDCDriver-4002.4.1/AppleUSBCDCACM/DataDriver/Classes/AppleUSBCDCACMData.cpp
[2]: http://pyserial.readthedocs.io/en/latest/tools.html#module-serial.tools.miniterm
[3]: http://www.atmel.com/tools/ATSAMR21-XPRO.aspx
[4]: http://osxdaily.com/2015/10/05/disable-rootless-system-integrity-protection-mac-os-x/

