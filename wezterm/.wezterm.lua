local wezterm = require('wezterm')
local config = wezterm.config_builder()

-- Police et taille
config.font_size = 14.0

-- Couleurs de base
config.colors = {
  -- Couleurs générales
  foreground = '#eff0eb',
  background = '#282a36',
  cursor_fg = '#282A36',
  cursor_bg = '#97979B',
  cursor_border = '#97979B',
  
  -- Couleurs de sélection
  selection_fg = '#000000',
  selection_bg = '#FFFACD',
  
  -- Couleurs des liens
  compose_cursor = '#0087BD',
  
  -- Palette de couleurs ANSI
  ansi = {
    '#282a36', -- Noir (0)
    '#FF5C57', -- Rouge (1)
    '#5AF78E', -- Vert (2)
    '#F3F99D', -- Jaune (3)
    '#57C7FF', -- Bleu (4)
    '#FF6AC1', -- Magenta (5)
    '#9AEDFE', -- Cyan (6)
    '#F1F1F0', -- Blanc (7)
  },
  
  -- Couleurs ANSI brillantes
  brights = {
    '#686868', -- Noir brillant (8)
    '#FF5C57', -- Rouge brillant (9)
    '#5AF78E', -- Vert brillant (10)
    '#F3F99D', -- Jaune brillant (11)
    '#57C7FF', -- Bleu brillant (12)
    '#FF6AC1', -- Magenta brillant (13)
    '#9AEDFE', -- Cyan brillant (14)
    '#EFF0EB', -- Blanc brillant (15)
  },
}

return config
