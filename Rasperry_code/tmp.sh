#!/bin/bash

sudo chmod a+rw /dev/ttyACM0
sudo chmod -R 777 /home/ubberboy/Documents/RoghecV2/snowboy/
sudo chmod 777 /home/ubberboy/Documents/RoghecV2/snowboy/Gui.py
sudo chmod 777 /home/ubberboy/Documents/RoghecV2/snowboy/browser_helpers.py
sudo chmod 777 /home/ubberboy/Documents/RoghecV2/snowboy/assistant.py
sudo -H -u ubberboy /usr/bin/python3 /home/ubberboy/Documents/RoghecV2/snowboy/Gui.py >/home/ubberboy/Documents/RoghecV2/snowboy/log.txt 2>&1
