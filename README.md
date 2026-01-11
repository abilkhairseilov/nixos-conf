# My NixOS setup
A nix config tailored to my fragile laptop. It has 8 gigs of RAM, so bear with the 12 GiB swapfile.

Keep in mind that the disk partitioning is not declarative. So is the theme and the doomemacs and sway config.

## Issues
### Waybar
On boot, the wireplumber and bluetooth modules are broken functionally. Wireplumber does not update its volume value, and the bluetooth module does not toggle the state of the bluetooth device.
