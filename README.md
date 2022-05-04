# when-am-i

Find out when you are

# Boot to a Website

### Hide the mouse

Install unclutter which we can use in the autostart file

```
sudo apt-get install unclutter
```

### Create the autostart file or link to the one included in this repo

```
sudo mkdir -p ~pi/.config/lxsession/LXDE-pi/
sudo nano ~pi/.config/lxsession/LXDE-pi/autostart
```

# Speed up boot

```
# find out what's taking so long
systemd-analyze
systemd-analyze blame
# remove some stuff
sudo systemctl disable raspi-config.service
sudo systemctl disable avahi-daemon.service
sudo systemctl disable keyboard-setup.service
sudo systemctl disable dphys-swapfile.service
# remove bluetooth
sudo systemctl disable hciuart.service
sudo systemctl disable bluetooth.service
```
