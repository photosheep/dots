# photosheep's dotfiles
The dotfiles I'm using on a day to day basis.

Tested on thinkpad T550, X260 and an asrock X399M w/ 2970WX. Some configs are specific to the workstation, e.g. PSU functions.

#### Deps
**Desktop:** i3, xsecurelock, [polybar](https://github.com/polybar/polybar), dunst, pcmanfm, termite, [cpsumon](https://github.com/audiohacked/cpsumon)
**GTK:** [equilux-theme](https://github.com/ddnexus/equilux-theme), qt5-styleplugins
**General:** fish, nvim, when, firefox, [starship](https://starship.rs), ranger, mpv, lsd, ibus, [greenclip](https://github.com/erebe/greenclip), rime-cantonese
**Photography:** rawtherapee, GIMP, graphicsmagick, xf86-input-wacom, rsync

##### Notes
Very little is implicitly integrated, and I've attempted to make the config as modular as possible. Most non-desktop things aren't required, and are just preferences of mine.
rime-cantonese only needs to be installed and ibus launched, it copies files to your config and populates a build list there.
