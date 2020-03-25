#!/bin/bash
if [ $(pidof kanshi) ]; then
    kill $(pidof kanshi)
fi
kanshi &
