
# amaduswaray tmux-zen - Catppuccin

This is more or less a fork of [tmux tokyo night](https://github.com/janoamaral/tokyo-night-tmux)

The pre-requisites are the same as the original.

A clean, dark Tmux theme that is a more of a zenful version of the original tokyo night-

The perfect companion for [catppuccin.nvim](https://github.com/catppuccin/nvim)

The colors are set to work perfectly with the catppuccin-mocha theme, but options for customizations will come in a later version :)

The purpose of this theme is to be as zenful as possible, so configuring options in the statusline is disabled. The original shell scripts from the [original repo](https://github.com/janoamaral/tokyo-night-tmux) are still available, so feel free apply changes directly in the source code.


## Requirements

This theme has the following hard requirements:

- Any patched [Nerd Fonts] (v3 or higher)
- Bash 4.2 or newer

The following are recommended for full support of all widgets and features:

- [Noto Sans] Symbols 2 (for segmented digit numbers)
- [bc] (for netspeed and git widgets)
- [jq], [gh], [glab] (for git widgets)
- [playerctl] (Linux) or [nowplaying-cli] (macOS) for music statusbar

### macOS

macOS still ships with bash 3.2 so you must provide a newer version.
You can easily install all dependencies via [Homebrew]:

```bash
brew install --cask font-monaspace-nerd-font font-noto-sans-symbols-2
brew install bash bc coreutils gawk gh glab gsed jq nowplaying-cli
```

### Linux

#### Alpine Linux

```bash
apk add bash bc coreutils gawk git jq playerctl sed
```

#### Arch Linux

```bash
pacman -Sy bash bc coreutils git jq playerctl
```

#### Ubuntu

```bash
apt-get install bash bc coreutils gawk git jq playerctl
```

Check documentation for installing on other operating systems.

## Installation using TPM

In your `tmux.conf`:

```bash
set -g @plugin "amaduswaray/tmux-zen"
```

## Configuration


### Number styles

Add these lines to your `tmux.conf` to change the number styles in the statusbar

Values are `digital`, `hsquare`, `dsquare`, `roman`, `super`, `sub` and `none`

```bash
tmux set @tmux_window_id_style digital 
tmux set @tmux_pane_id_style hsquare
tmux set @tmux_zoom_id_style dsquare
```



#### Path Widget

This is the only widget I've kept from the original

```bash
set -g @tmux_show_path 1
```


## Styles

- `hide`: hide number
- `none`: no style, default font
- `digital`: 7 segment number (🯰...🯹) (needs [Unicode support](https://github.com/janoamaral/tokyo-night-tmux/issues/36#issuecomment-1907072080))
- `roman`: roman numbers (󱂈...󱂐) (needs nerdfont)
- `fsquare`: filled square (󰎡...󰎼) (needs nerdfont)
- `hsquare`: hollow square (󰎣...󰎾) (needs nerdfont)
- `dsquare`: hollow double square (󰎡...󰎼) (needs nerdfont)
- `super`: superscript symbol (⁰...⁹)
- `sub`: subscript symbols (₀...₉)

