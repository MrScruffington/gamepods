#!/bin/sh
./srcds_run -console -game tf -secured -port 27015 +sv_pure 1 +randommap +maxplayers 24 +sv_lan 0 -debug

# For your server to be listed in the server browser you will need to add to the end of above: +sv_setsteamaccount [STEAMTOKEN]
# Note: you will need to replace [STEAMTOKEN] with a token generated from here:
# https://steamcommunity.com/dev/managegameservers
