#!/usr/bin/env bash

# Copy and set correct perms:
sudo cp -R atmel-edbg.kext /System/Library/Extensions/ && \
sudo chmod -R 755 /System/Library/Extensions/atmel-edbg.kext && \
sudo chown -R root:wheel /System/Library/Extensions/atmel-edbg.kext && \

# Load it:
sudo kextload -b com.atmel.edbg.tty
