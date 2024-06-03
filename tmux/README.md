## Table of contents
<!-- no toc -->
1. [Install tmux](#tmux)
2. [Install Tmux Plugin Manger](#tmux-plugin-manager)
3. [Download and configure Nerd Font](#nerd-font)
4. [Create symbolic links for tmux configuration files](#set-up-config-tmux-files)
5. [Install plugins](#tmux-beauty)

![tmux preview](https://lh3.googleusercontent.com/u/0/drive-viewer/AKGpihbUF_j0kOFus1ilHhWfuXuNzA3-3_uyRDyKQFqXacspcBwMS9Jrhd60-Jalm5LJ4fXI7E4fG7NSgzXE0tFwuDcutpyAqJOR9os=w1848-h968-rw-v1)

### [tmux](https://github.com/tmux/tmux/wiki/Installing)

```shell
sudo apt update && \
sudo apt install tmux
```


### [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm?tab=readme-ov-file#installation)

```shell
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```


### [Nerd font](https://www.nerdfonts.com/font-downloads)

1. Download your preferred font. My favorite ["JetBrainsMono"](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip).
2. Unzip archive and copy the directory to _/usr/local/share/fonts_.
3. Rebuild the font cache `fc-cache -fv`.
4. Change the terminal font. I use Xfce Terminal. Go to Edit > Preferences > Appearance > Font, and select "JetBrainsMonoNL Medium" typeface.


### Set up config tmux files
From the root of the repository

```shell
stow -v --adopt -t ~ tmux
```

If you want to dry run

```shell
stow -nv --adopt -t ~ tmux
```

I would like to place the configuration file in the _~/.config/tmux_ directory. Tmux
searches for files in this directory starting from version 3.1, but I have
version 3.0a installed. If you want to install the file(s) at this path, rename
the file from *.tmux.conf* to *tmux.conf* and update the reload line in the
configuration

```diff
- bind-key r source-file ~/.tmux.conf \; display-message "~/.tmux.conf reloaded"
+ bind-key r source-file ~/.config/tmux/tmux.conf \; display-message "~/.config/tmux/tmux.conf reloaded"
```

Then run

```shell
stow -v --adopt -t ~/.config/tmux tmux
```

Alternatively you can create an shell alias:

```shell
alias tmux="tmux -f ~/.config/tmux/tmux.conf"
```

### tmux beauty

You're all set now. We just need to install tmux plugins. Note that this configuration changes the prefix to `Ctrl+s`. Follow these steps:

1. Start tmux: `tmux`
2. Reload the config: `<Prefix>+r`
3. Install plugins: `<Prefix>+I`
4. Restart tmux: Detach with `<Prefix>+d`, then run `tmux kill-server`.
