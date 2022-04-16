#!/bin/bash
/srv/tf2/srcds_run -console -game tf -secured -port 27015 +sv_pure 1 +randommap +maxplayers 24 +sv_lan 0
#
# For your server to be listed in the server browser you will need to add: +sv_setsteamaccount [STEAMTOKEN]
# Note: you will need to replace [STEAMTOKEN] with a token generated from here:
# https://steamcommunity.com/dev/managegameservers
#
# Please follow this link for a full list of arguments you can pass to srcds_run
# https://developer.valvesoftware.com/wiki/Command_Line_Options#Source_Dedicated_Server
