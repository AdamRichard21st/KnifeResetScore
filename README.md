# Description
Whenever a player gets killed by knife, his score (kills and deaths) is reseted to `0/0`.

# About
This is a very simple plugin that executes a very simple concept.
However, I've reproduced this concept in the past when helping some server owners and fortunately with owners feedback, we noticed some mistakes that may have caused the plugin to fail in some scenarios.

So, I'm publishing this fixed source code on my personal github page to keep the feedback over my support, since I've been informed that my previous source code got shared by others including these mistakes.

# Installation
First and foremost, your server must to have [amxmodx](https://wiki.alliedmods.net/Category:Documentation_(AMX_Mod_X)#Installation) installed & running.

* Copy `knife_reset_score.txt` dictionary file to `$addons/amxmodx/data/lang` folder in your server.
* Copy `knife_reset_score.amxx` to `$addons/amxmodx/plugins` folder in your server.
* Add `knife_reset_score.amxx` line to your `plugins.ini` file located at `addons/amxmodx/configs` folder.

[read more](https://wiki.alliedmods.net/Configuring_AMX_Mod_X#Plugins)

# Want to help?
Feel free to suggest changes or create [pull requests](https://help.github.com/en/articles/about-pull-requests) to this repository, including source changes or dictionary translations improvements/additions.
