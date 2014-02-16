DotaKeys 0.1 version
====================

1. INTRODUCTION
---------------

DotaKeys is a set of AutoIt script for remapping keys, creating key macros and mouse clicking automation for Dota and Dota 2.

2. INSTALLATION
---------------

You need to download AutoIt interpreter from official website for launching DotaKeys:
http://www.autoitscript.com/site/autoit/downloads

The x64 interpreter version must be selected in installation dialog for users with x64 Windows version.

Then download archive with DotaKeys scripts and extract it:
https://github.com/ellysh/DotaKeys/archive/master.zip

3. CONFIGURATION
----------------

3.1 KEY MAPPING
---------------

The keys for mapping are specified in `run` directory scripts. You can open any script with the hero name in editor and fix key mapping.

This is example of key mapping for Admiral hero:
	global const $kKeys = "s,h|q,e|w,d|e,x|r,t"

This line means that these keys will be mapped (`->` symbol means `to`):
	s -> h
	q -> e
	w -> d
	e -> x
	r -> t

You can specify macros to map one key to several. This is an example:
	global const $kKeys = "x,q,w,e"

This means that pressing of the `x` key will lead to pressing `q`, `w` and `e` keys.

3.2 AUTOCLICK
-------------

The autoclick function is emulation left button mouse clicking to the current pointer position after any key pressing.

You can enable or disable autoclick mechanism by changing this variable in the `config\global.au3` file:
	global const $kIsAutoClick = false

The `false` variable matches to disable autoclick and `true` otherwise.

3.3 SYSTEM KEYS
---------------

The `Enter` key pressing will lead to pause DotaKeys script. You can reassign pause key in the `config\global.au3` file:
	global const $kPauseKey = Chr(13)

4. LAUNCHING
------------

NB: Bots of DotaKeys project is not executable `exe` files! All are placed to the `run` directory. You can run these scripts like the `exe` files.

There are steps to run DotaKeys script:
1. Run script with your hero name from the `run` directory.
2. Switch to the Warcraft 3/Dota 2 client window.
3. Press Alt+F2 to start script.
4. You can stop script by Alt+F1 pressing.

5. CONTACTS
-----------

You can ask any questions about usage DotaKeys, report about bugs, send your suggestions and patches in the DotaKeys project's groups and the developer's email.

Developer:
Ilya Shpigor <petrsum@gmail.com>

Project's group in vk:
https://vk.com/open_dotakeys
