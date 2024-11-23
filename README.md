# dark.fish

## Installation

```fish
brew install dangh/formulae/dark
fisher install dangh/dark.fish
```

## Usage

Add a function that listen on `dark` event

```fish
function on_apple_interface_theme_changed -e apple_interface_theme_changed -a mode
    switch "$mode"
        case dark
            # do something for dark mode
        case light
            # do something else for light mode
    end
end
```
