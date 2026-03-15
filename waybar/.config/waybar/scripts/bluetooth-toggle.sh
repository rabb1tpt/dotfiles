#!/bin/bash

# Ensure bluetooth is powered on before launching GUI
timeout 3 bluetoothctl power on

# Launch the bluetooth GUI
/home/rabb1tl0ka/.local/bin/bt-connect-gui
