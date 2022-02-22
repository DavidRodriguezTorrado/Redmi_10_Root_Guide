# Guide to ROOT Xiaomi Redmi 10

## Prerequisites
* Xiaomi Redmi 10 (unlocked carrier phone)
* SIM card (your main phone SIM card can be used), it must have internet connection
* Windows 7/8/10/11
* Mi Flash Unlock Tool

## Considerations
Not stock Android phones usually have a locked bootloader. This means it must be unlocked by manufacturer before being able to Root them.

## Unlocking bootloader
Firstly, we need to create a Google Account. This is a needed step on every Android phone to use main functions such as downloading apps from Google Play Store. In our case it is also needed to sign up a new Mi Account for our phone.
Creating a new Google Account can be done through Settings > Google.

After creating our Google Account we will use it now to sign up on Mi.

Therefore, we will go to Settings > Mi Account > Sign up > More Options (click on Google logo)
Using the previous created Google Account we will be asked for a phone number. We will receive an OTP password to introduce afterwards.

Now we will unlock Developer options. To achieve it navegate to Settings > About phone >  click on MIUI version several times until "You are now developer" message appears.

Then go to Settings > Additional settings > Developer options > and enable "OEM unlocking" and "USB debugging".
Now you have to get the SIM card into the phone and after turning off WiFi, go to Settings > Additional settings > Developer options > click on Mi Unlock status > Agree > Add account and device
If an error message pops up saying "Couldn't verify, wait one minute or two and try again", you need to log out from Mi Account and signing in again with Google Account and password. You can be asked to change your Mi password here. Try again and check device is correctly added to Mi Account.

It is now time to download Mi Unlock software only available for Windows PC. Most recent version can be downloaded from [here](https://mi-globe.com/download-xiaomi-mi-unlock-tool-all-versions/). After unziping the file double click on .exe extension file to run the tool.
Log into your Mi Account and make sure your Redmi 10 is connected to the PC and file transfer is allowed. Remember OTP can be asked for.

Now we have to enter on fastboot mode. Turn off the phone and then press and hold Power button + Volume down button until Android bunny appears, meaning you entered fastboot.

A device should now appear on Unlock Mi tool. Status should be set to Locked, so now click on it and then press Unlock. This process may last some hours. In our case it says to wait for 168h to unlock it. Fastboot mode can be exited by turning off the phone and then holding Volume Up button until a menu appears. Then click on reboot and phone will start up on normal mode.

Once the waiting time expires, enter again in fastboot mode, plug in the phone through USB and start the Xiaomi Unlock tool. Press again in "Unlock" button and it should unlock it. Then the phone will show MIUI letters on the screen, reboot it to start normally.

You will have to set up the phone again, connecting to network and configuring it.

### Check if bootloader is correctly unlocked
* Open settings > About phone
* Tap several times on MIUI version until you activate developer mode
* Open settings > Additional settings > Developer options > Mi Unlock status It might say "Unlocked"


## Root Redmi 10

Before start to root Redmi 10 remember to allow again USB debugging in developer options menu.

We will need the original Redmi firmware, which can be downloaded from official Redmi website. Check current version in About phone settings and download Redmi 10 Global version that matches. There are two choices; fastboot and recovery ROMs, in our case we are downloading fastboot one.

### [Option 1: Using MTKroot sotfware]

Then we must download MTKroot software. In our case we are downloading version 2.5.8

Open MTKroot software and click on drivers > mediatek. Downloading and installing process will begin now. (Phone must be disconnected during this process).

Now connect phone again and click on "Reiniciar USB".

Then you have to allow "install via USB" on Developer Options menu. To allow it, you will need to log in your Mi account and insert a SIM card for that.

Go to Apps and install Magisk. You will have to allow the installation on phone screen.

Click on top left corner "No hay boot !!" and click "cargar", find boot.img file in previous step firmware download.

Then click on "procesar parche".

Magisk app will open on phone, then click on install, now mark option "Select and Patch a File". Phone folders will open and you have to search for unroot.img file copied on phone. Then click on "let's go" to start the installation process.
The installation will be made on folder /storage/emulated/0/Download/magisk_patched.img
When "All done" message appear, click on top left corner to go back and close the app.


### [Option 2: Without MTKroot sotfware]

Go to https://magiskmanager.com/es/ and download latest Magisk version. Then you must allow the searcher to install from unknown sources.

Then we have to copy the boot.img file into the phone:

$ adb push [Path to boot.img file] /sdcard

Now open Magisk app then click on install, now mark option "Select and Patch a File". Phone folders will open and you have to search for /sdcard/boot.img (file just copied). Then click on "let's go" to start the installation process.
The installation will be made on folder /storage/emulated/0/Download/magisk_patched.img
When "All done" message appear, click on top left corner to go back and close the app.

### After option 1 or 2 has been carried out...

Our phone has now the bootable image of magisk to become superuser on /storage/emulated/0/Download/magisk_patched.img so by adb command lets do:

$ adb pull /storage/emulated/0/Download/magisk_patched.img magisk_patched.img
Previous command will copy the previous image on our current folder.

$ adb devices

$ adb reboot bootloader

As our device has A/B partition we must do (it can be verified downloading Treble check app from Google Play Store):

$ fastboot flash boot_a magisk_patched.img
$ fastboot flash boot_b magisk_patched.img

Then

$ fastboot reboot

Enter in Magisk app and check bottom navbar has been unlocked so you can access superuser option.

### Verify you are root

Open again MTKroot software and press:

* "Reiniciar USB" button
* Check Root button

If everything went right a message saying "superusuario detectado" should pop up.

