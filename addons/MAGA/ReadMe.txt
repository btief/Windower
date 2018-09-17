Author: Cairthenn
Version: 1.0.0.4
Date: March 6, 2017

MAGA (Make Augments Great Again)
After trading a piece of armor to Oseem, the addon will automatically expend stones (as specified) to augment your armor until augments that equal or are greater than your specified augments appear.
If you have created more than one augment set to compare against, it will stop if it matches the minimum specified augments in ANY set.
This uses a custom version of extdata for augment handling and user readability. Any augment in the extdata.lua file in this addon folder may be specified.
Please note that there is NO menu for Oseem while using this addon, and Oseem will retain your gear until (1) you exit the interaction using the 'cancel' or 'accept' sub-command, (2) you run out of stones, or (3) you unload the addon.
If you use this addon responsibly, your results will be positive. I am not responsible for any lost augments or lost armor for any uninformed or irresponsible use.
This addon injects packets. Do not use it if you aren't comfortable with that.
Settings
MAGA uses 'settings.xml' in its data folder for all settings.
If you choose to edit this manually, this file uses extdata.lua in the main addon folder for augment naming schemes.
Commands:
help : Shows a menu of commands in game
style [magic|melee|ranged|familiar|healing] : Sets the type of augments to select for the traded armor. If the armor does not support that type of augment, a notice will be displayed in the chat log and your armor will be returned to you.
pellucid : Toggles whether pellucid stones are used for augmenting. Takes optional parameter (t)rue/(f)alse/(y)es/(n)o
fern : Toggles whether fern stones are used for augmenting. Takes optional parameter (t)rue/(f)alse/(y)es/(n)o
taupe : Toggles whether taupe stones are used for augmenting. Takes optional parameter (t)rue/(f)alse/(y)es/(n)o
start <style> : After trading an item, starts the augmentation process. Style parameter is optional and will override the current style setting.
stop : Stops the augmentation process. NOTE: This does not return your item to you. You are still required to use an interaction-exiting command.
accept : Accepts the most recent augment that was applied to your gear.
cancel : Declines the selected augment and returns the gear to your inventory.
continue : Resumes the augmentation process after it has stopped for you to decide on an augment.
add <augment name> <minimum value> <set number> : Adds 'augment name' to the required augments list with 'minimum value' to the specified augment set (default: 1)
remove <augment name> : Removes 'augment name' from the required augments list in the specified augment set (default: 1)
search <search str> : Returns a list of valid augments that contain 'search str' and displays them in the chat log.
save <profile name> : Saves the current augment specification to 'profile name'
load <profile name> : Loads 'profile name' to the current augment specification
newset : Creates an additional augment set to compare against
delset <set number> : Deletes the specified augment set #
delay <#> : Sets the delay between augments to #. There is no minimum, but 5 is the maximum.
--