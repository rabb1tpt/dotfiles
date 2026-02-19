#!/bin/bash

# Ensure bluetooth is powered on before launching GUI
bluetoothctl power on

# Launch the bluetooth GUI
bt-connect-gui
