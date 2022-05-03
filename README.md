# Hotpot Issue about Macro Expansion

This issue is about a difference between the result of a macro expansion in
`macrodebug` and the compilation result by using Hotpot.

## How to reproduce the issue

Executing the following Docker command:

```sh
docker build -t issue . && docker run -it issue
```

Inside the Docker container execute `nvim` to open Neovim, the result of
`macrodebug` will be printed and can be accessed using `:messages`.

When you open `/root/.cache/nvim/hotpot/root/.config/nvim/fnl/conf/init.lua`
the compilation result doesn't contain the underline as would be expected.

## Expected result

The macro...

```fennel
(highlight! MatchParen [:underline] {:bg "#262626"})
```

...should be expanded to:

```fennel
(vim.api.nvim_set_hl 0 "MatchParen" {:bg "#262626" :underline true})
```

## Current result

The macro...

```fennel
(highlight! MatchParen [:underline] {:bg "#262626"})
```

...is being expanded to:

```fennel
(vim.api.nvim_set_hl 0 "MatchParen" {:bg "#262626"})
```
