return {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'

    -- Set header
    -- dashboard.section.header.val = {
    -- "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠛⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    -- "⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    -- "⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    -- "⣿⣿⣿⣿⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    -- "⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢀⣀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    -- "⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢀⠠⠄⠀⠀⠈⠀⠀⠀⠀⠀⠀⠊⠨⠀⢄⠀⠀⠙⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    -- "⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣄⠔⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿",
    -- "⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠆⠂⠀⠀⠀⠀⠀⣠⣄⢰⡆⢷⡘⣷⡆⢦⠰⣄⢠⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿",
    -- "⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠂⠉⠀⠀⠀⠀⠀⣰⢃⣾⣿⣿⡌⢷⠸⣷⡘⣿⡌⢇⢻⡄⢿⣎⢲⣄⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⣿",
    -- "⠀⠀⠀⠀⠀⠀⠀⠀⡠⠋⠀⠀⠀⠀⣠⡄⣼⢠⠃⣾⣿⣿⣿⣷⡘⡆⢻⣷⡌⢿⡌⠀⢿⡘⣿⡆⠿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿",
    -- "⠀⠀⠀⠀⠀⠀⡠⠊⠀⠀⠀⠀⣠⢀⣿⢠⡇⡎⣼⣿⣿⣿⣿⣿⣷⡔⠘⣿⣿⣦⠻⡌⠈⢷⡘⣷⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿",
    -- "⡇⠀⠀⠀⢀⠈⠁⠀⠀⠀⠀⣸⣿⢸⡏⠸⠐⢰⣿⣿⣿⣿⣿⣿⣿⣿⣦⣘⣿⣿⣷⣄⠀⠀⢳⡘⡆⠈⣿⠰⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹",
    -- "⣇⠀⠀⡠⠂⠀⠀⠀⠀⢠⢁⣿⣿⢸⡇⡆⢀⠿⠿⠿⠛⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣂⡀⠀⢳⠠⠀⣿⡀⡆⠀⠀⠀⠀⠀⠀⠀⠀⣼",
    -- "⣿⠀⠀⠀⠀⠀⠀⠀⢀⠎⣼⡟⠠⢸⡇⠀⣰⣶⣿⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⢋⣵⣿⣿⣷⣦⠀⠁⠀⣿⡇⠇⠀⠀⠀⠀⠀⠀⠀⣰⣿",
    -- "⣿⠁⠀⠀⠀⠀⠀⠀⠌⣼⠟⢀⠀⠀⡇⡆⣿⡿⠋⠉⠉⠡⢿⣿⣿⣿⣿⣿⠃⣾⡿⠋⠉⠠⠍⠡⠵⡀⣿⡇⠀⠀⠀⠀⠀⠀⠀⣴⣿⣿",
    -- "⠃⠀⠀⠀⠀⠀⠀⢀⠚⡣⢠⢊⠀⡄⠀⠗⣠⠘⠁⢀⣀⣈⣹⣿⣿⣿⣿⣿⢸⣿⠎⣀⣤⣤⡀⢁⣶⡇⣿⡇⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿",
    -- "⠀⠀⠀⠀⠀⠀⠀⡿⢡⡀⢡⢇⠀⣷⡀⡾⠁⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠿⣿⣿⣿⣿⣿⣿⣿⠀⣿⠁⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿",
    -- "⠀⠀⠀⠀⠀⠀⠀⡇⢸⢨⠂⡸⠀⢹⣿⣷⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢃⣴⣿⣿⣿⣿⣿⣿⡇⢠⡏⠀⣀⣴⣿⣿⣿⣿⣿⣿⣿⣿",
    -- "⠀⠀⠀⠀⠀⠀⠀⠁⠘⣆⠃⠱⡀⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡷⠿⠿⠿⢿⣿⣿⣿⣿⠀⡼⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    -- "⠀⠀⠀⠀⠀⠀⠀⠀⠠⡹⣄⡃⠉⢄⠘⣿⣿⣿⣿⣿⣿⣆⠠⢤⣤⣴⠶⠶⠒⠛⢀⣿⣿⣿⣿⠇⣸⠃⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    -- "⣧⡀⠀⠀⠀⠀⠀⠀⠀⠈⠢⢍⣑⠒⠄⠘⢿⣿⣿⣿⣿⣿⣷⣄⠠⢤⣤⣤⠀⣠⣿⣿⣿⡿⠋⢠⠃⢠⣄⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
    -- "⣿⣿⣦⣀⡀⠀⠀⠀⠀⠀⠀⠐⠨⢅⡚⡀⢤⠙⠻⢿⣿⣿⣿⣿⣿⡶⠤⠤⢊⣿⣿⡿⠛⠁⢀⠂⠀⠲⣌⠳⣦⣈⠛⢿⣿⣿⣿⣿⣿⣿",
    -- "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣦⣍⡈⠀⠀⠀⠈⠉⠛⠛⠿⠿⣿⣿⠿⠟⠋⠀⠀⡠⠁⡀⡄⣷⣌⢳⣌⠻⣿⣦⣄⡉⠫⠯⠉⠍",
    -- "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⣋⣥⠖⠂⠀⠀⢦⣀⠀⠠⠁⠀⠀⠀⠀⠀⠀⠀⣰⠄⢐⠳⡐⠘⠿⠢⠙⢷⠙⣿⣿⣿⣦⡙⢧⣴",
    -- "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣫⣴⡿⠋⣱⣿⠃⡇⠀⠈⣿⣧⣤⣤⡀⠀⠀⠀⣄⠆⡼⠋⣼⣿⣷⣤⣴⣿⣿⡗⠀⢇⠙⢿⣿⣿⣿⡆⢻",
    -- "⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⣴⣿⢏⠄⣴⣿⡟⡘⠐⡀⣄⢸⣿⣿⣿⣿⣿⡶⠀⢃⡾⠱⢀⣿⣿⣿⣿⣿⣿⠏⣴⡄⡌⣆⠈⢿⣿⣿⣿⠈",
    -- "⣿⣿⣿⣿⣿⣿⣿⣿⠃⣾⣿⢣⠎⣼⣿⡿⠀⠀⠐⠰⠿⢸⣿⣿⣿⡿⢋⣶⣿⣶⣤⣴⣿⡿⠛⠛⠋⠉⠁⠨⣽⣇⠰⢸⡄⠘⣿⣿⡿⠀",
    -- "⣿⣿⣿⣿⣿⣿⣿⠃⣼⣿⠃⠎⣼⣿⠟⢀⡾⢠⣴⠿⠃⢸⣿⣿⣿⡀⠻⣿⣿⣿⡿⠟⠉⣠⣶⣶⣾⣷⣶⣄⡀⠙⠀⡘⡇⡇⣿⡿⣡⢱",
    -- "⣿⣿⣿⣿⣿⣿⡏⢰⣿⣿⠀⢸⣿⠏⣴⣿⣷⡆⠁⠀⠀⣿⣿⣿⡿⢃⣼⣿⡿⠋⠄⣡⣾⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠌⢀⠀⡿⢡⡟⣿",
    -- "⣿⣿⣿⣿⣿⡿⢁⢸⣿⣿⡆⢈⢻⠸⢛⣉⣩⠂⠀⠀⣴⣿⣿⣿⡦⢸⡿⡋⠈⠌⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠉⢸⡇⣿⢹⣿",
    -- "⣿⣿⣿⣿⣿⢱⢃⡄⢻⣿⣿⠈⡆⠃⢾⣿⡏⠀⠀⣼⣿⣿⠟⣫⡴⢋⠀⡃⠈⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠄⣿⡅⣿⠸⣿",
    -- }
    --
    dashboard.section.header.val = {
      '         _,.-------.,_                              ',
      "     ,;~'             '~;,                          ",
      '   ,;                     ;,                        ',
      '  ;                         ;                       ',
      " ,'                         ',                      ",
      ',;                           ;,                     ',
      '; ;      .           .      ; ;                     ',
      '| ;   ______       ______   ; |                     ',
      '|  `/~"     ~" . "~     "~\'  |  ',
      '|  ~  ,-~~~^~, | ,~^~~~-,  ~  |  ',
      ' |   |        }:{        |   |                      ',
      ' |   l       / | \\       !   |                      ',
      ' .~  (__,.--" .^. "--.,__)  ~.                      ',
      " |     ---;' / | \\ `;---     |                      ",
      '  \\__.       \\/^\\/       .__/                       ',
      '   V| \\                 / |V                        ',
      '    | |T~\\___!___!___/~T| |                         ',
      "    | |`IIII_I_I_I_IIII'| |                         ",
      '    |  \\,III I I I III,/  |                         ',
      "     \\   `~~~~~~~~~~'    /                          ",
      '       \\   .       .   /                            ',
      '         \\.    ^    ./                              ',
      '           ^~~~^~~~^                                ',
      '                                                   ',
      '"Courage is not the absence of fear,               ',
      '    but the triumph over it."                       ',
    }

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button('e', '  > New File', '<cmd>ene<CR>'),
      dashboard.button('SPC ee', '  > Toggle file explorer', '<cmd>NvimTreeToggle<CR>'),
      dashboard.button('SPC wr', '󰁯  > Restore Session For Current Directory', '<cmd>SessionRestore<CR>'),
      dashboard.button('q', ' > Quit NVIM', '<cmd>qa<CR>'),
    }

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd [[autocmd FileType alpha setlocal nofoldenable]]
  end,
}
