## Cutting-edge dotfiles, personally ~~snatched~~ created

###  Table of contents
<!-- no toc -->
1. [Prerequisites](#prerequisites)
2. [Stow dotfiles](#stow-dotfiles)
3. [Do not forget](#do-not-forget)
4. [Cleaning up symbolic links](#cleaning-up-symbolic-links)

### Prerequisites

Before using these dotfiles ensure everything works as expected. You need the following dependencies.

 - [stow](https://www.gnu.org/software/stow/stow.html)
 - [tpm](https://github.com/tmux-plugins/tpm)
 - [urlview](https://github.com/sigpipe/urlview "https://github.com/sigpipe/urlview") or [extract_url](http://www.memoryhole.net/~kyle/extract_url/ "http://www.memoryhole.net/~kyle/extract_url/")
 - [fzf](https://github.com/junegunn/fzf)
 - [nvm](https://github.com/nvm-sh/nvm)
 - [zoxide](https://github.com/ajeetdsouza/zoxide)
 - [Nerd Font](https://www.nerdfonts.com/font-downloads)

### Stow dotfiles

```shell
cd ~
git clone git@github.com:lytvynda/dotfiles.git
cd "$(basename "$_" .git)"
stow .
```

### Do not forget

1. Make WezTerm your default terminal.
2. Make zsh your default user shell.

### Cleaning up symbolic links

If you'd like to get rid of all the symbolic links that Stow created in your home folder, you can do that with the following command:

```shell
stow -D .
```
