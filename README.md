# windows-terminal-wsl-config
Stuff I configured while fiddling with WSL and windows terminal.

If you want to use this you will have to get a few stuff installed first :

* tmux
* fish
* neovim
* nodejs

Make fish your default shell :
`` chsh -s `which fish\` ``

With this the config should be working but there are a few optional thing you can do.

## terminal color

There's a folder that contains the color scheme I use for windows terminal along with a few other things.
You can use it for your own terminal. It should make for a more cohesive color palette.

## Set up spotify

Here is how I went about setting up spotify for my WSL environment :

* in WSL :
  * install spotifyd with the pulseaudio backend feature along with all the required libraries.
  * install spotify-tui
  
* in Windows :
  * download and install pulseaudio
  * set the content of the etc/pulse/default.pa file to this :
  ```
  #!/usr/i686-w64-mingw32/sys-root/mingw/bin/pulseaudio.exe -nF
  #
  # This file is part of PulseAudio.
  #
  # PulseAudio is free software; you can redistribute it and/or modify it
  # under the terms of the GNU Lesser General Public License as published by
  # the Free Software Foundation; either version 2 of the License, or
  # (at your option) any later version.
  #
  # PulseAudio is distributed in the hope that it will be useful, but
  # WITHOUT ANY WARRANTY; without even the implied warranty of
  # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
  # General Public License for more details.
  #
  # You should have received a copy of the GNU Lesser General Public License
  # along with PulseAudio; if not, write to the Free Software Foundation,
  # Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.

  # This startup script is used only if PulseAudio is started per-user
  # (i.e. not in system mode)

  .nofail

  ### Load something into the sample cache
  load-sample x11-bell %WINDIR%\Media\ding.wav
  load-sample-dir-lazy %WINDIR%\Media\*.wav

  .fail

  ### Automatically restore the volume of streams and devices
  load-module module-device-restore
  load-module module-stream-restore
  load-module module-card-restore

  ### Automatically augment property information from .desktop files
  ### stored in /usr/share/application
  load-module module-augment-properties

  ### Load audio drivers statically
  ### (it's probably better to not load these drivers manually, but instead
  ### use module-udev-detect -- see below -- for doing this automatically)
  load-module module-waveout sink_name=output source_name=input record=0
  #load-module module-null-sink

  ### Automatically load driver modules depending on the hardware available
  .ifexists module-detect.so
  ### Use the static hardware detection module (for systems that lack udev/hal support)
  load-module module-detect
  .endif

  ### Automatically connect sink and source if JACK server is present
  .ifexists module-jackdbus-detect.so
  load-module module-jackdbus-detect
  .endif



  ### Network access (may be configured with paprefs, so leave this commented
  ### here if you plan to use paprefs)
  #load-module module-esound-protocol-tcp
  load-module module-native-protocol-tcp port=4713 auth-ip-acl=172.16.0.0/12
  load-module module-esound-protocol-tcp port=4714 auth-ip-acl=172.16.0.0/12
  load-module module-waveout

  ### Make some devices default
  #set-default-sink output
  #set-default-source input
  ```
  
With this setup you should be able to get some sound when pulseaudio is running.
