----

**Page:** [[Homepage]]/[[EndeavourOS]]/[[How to configure super button to open up whisker menu?]]

---
A detalied tutorial of how to add keybindings to*** Super ***key. You'll observe the following:
- The ***Super *** key (when pressed alone) opens the Whisker menu.
- Other keybinding with the ***Super*** key (for example ***Super+T***) works as expected and does not open the whisker menu.

We will be using xcape a program for modifing key as another key when pressed and released on its own. Open your terminal and download it by:

``` bash
sudo pacman -S xcape
```

Then go to ***Session and Startup*** app,  go to the ***Application Autostart *** tab and add this autostart task:

**Name**: `xcape`
**Description**: `Map Super Key to Alt+F1`
**Command**: ``/usr/bin/xcape -e 'Super_L=Alt_L|F1;Super_R=Alt_L|F1'``

Next go to the ***Keyboard*** app, on the ***Application Shortcuts*** tab and remove both `xfce4-popup-whiskermenu` shortcuts.

Then add a new shortcut:

**Command:** `xfce4-popup-whiskermenu`

Click **OK**. When prompted for the shortcut key, press ***Alt+F1***

Log out and log in again. It should be working. If it isn't, check all steps again because sometimes copy-pasting gets bugged.