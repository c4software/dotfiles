# Activer les Emoji’s sur Archilnux

```sh
yaourt -S noto-fonts-emoji
mkdir -p ~/.config/fontconfig/conf.d/
```

```sh
vim ~/.config/fontconfig/conf.d/01-emoji.conf
```

```conf
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
  <!-- Use Google Emojis -->
  <match target="pattern">
    <test qual="any" name="family"><string>Segoe UI Emoji</string></test>
    <edit name="family" mode="assign" binding="same"><string>Noto Color Emoji</string></edit>
  </match>
</fontconfig>
```
