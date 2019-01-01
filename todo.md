Usability
=========

Settings and Prefs
------------------

* key repeat speed
* tap lock to drag
* three-finger horizontal for nav back and forth (vs. two-finger horizontal)
* four-finger vert for command center
* invert scroll direction


Applications
------------

* Divy (window resize management)
* Caffeine to prevent sleep
* NoSleep, to allow closed lid, no sleep
* TextWrangler (or other, Sublime?) for plaintext, no-save-needed notes



App-Specific Settings
=====================

TextWrangler
------------

* cmd + bracket for moving through file list (not last edited)
* shift + backspace just backspaces (doesn't reverse backspace)

IntelliJ
--------

* (Per project) Project Explorer on right
* Disable code collapsing
* Editor appearance
  - font size
  - low contrast (grey backdrop, lower saturation syntax colors)

MySql
-----

After running the ServiceNow homebrew setup `brew now install`, as desribed at https://buildtools1.service-now.com/kb_view_customer.do?sysparm_article=KB0523956, MySql will need additional setup to get up and running and to have the command line utility usable.  The instructions given by the `brew` command, for completing this setup go:
```
mysql56 is keg-only, which means it was not symlinked into /usr/local,
because this is an alternate version of another formula.

If you need to have mysql56 first in your PATH run:
  echo 'export PATH="/usr/local/opt/mysql56/bin:$PATH"' >> ~/.bash_profile

For compilers to find mysql56 you may need to set:
  export LDFLAGS="-L/usr/local/opt/mysql56/lib"
  export CPPFLAGS="-I/usr/local/opt/mysql56/include"


To have launchd start now/devtools/mysql56 now and restart at login:
  brew services start now/devtools/mysql56
Or, if you don't want/need a background service you can just run:
  /usr/local/opt/mysql56/bin/mysql.server start
```
