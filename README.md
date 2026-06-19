# Rosé Pine Moon for hunk

A [Rosé Pine Moon](https://rosepinetheme.com/) theme for
[hunk](https://github.com/modem-dev/hunk), the review-first terminal diff
viewer for agentic coders.

It shows up in hunk's in-app theme menu as **Rosé Pine Moon**.

> All natural pine, faux fur and a bit of soho vibes for the classy minimalist.

## How hunk themes work

hunk ships a handful of built-in themes and **does not have a plugin system** —
there's no directory to drop theme files into. Custom themes are defined inline
in hunk's config under `theme = "custom"` with a `[custom_theme]` table. The
table's `label` is the name hunk shows in its theme menu, which is how this
theme appears as a selectable **Rosé Pine Moon** entry.

This repo is that `[custom_theme]` block, filled in with the Rosé Pine Moon
palette, plus a small installer.

## Install

### One-liner

```sh
git clone https://github.com/Derrekito/hunk-rose-pine-moon.git
cd hunk-rose-pine-moon
./install.sh
```

The installer writes to `${XDG_CONFIG_HOME:-~/.config}/hunk/config.toml`.

- **No existing hunk config** → it's copied in and you're done.
- **You already have a config** → it is **not** overwritten (your config may set
  `mode`, `line_numbers`, etc.). The installer backs up your config and prints
  exactly how to finish — either replace it or merge the `theme` line and the
  `[custom_theme]` tables by hand.

### Manual

Copy [`rose-pine-moon.toml`](./rose-pine-moon.toml) to
`~/.config/hunk/config.toml`. If you already have a config, copy just the
`theme = "custom"` line and the `[custom_theme]` / `[custom_theme.syntax]`
tables into it, replacing any existing theme block.

## Apply it

A plain `hunk diff` / `hunk show` reads the config fresh, so it's active
immediately. If you review through an editor or agent integration (which keeps a
live hunk session via the local daemon), reload that session so it picks up the
new theme:

```sh
hunk session reload --repo . -- diff
```

You can also switch to it any time from hunk's in-app theme menu — it's listed
as **Rosé Pine Moon**.

## Palette

Standard Rosé Pine Moon ([rose-pine/palette](https://github.com/rose-pine/palette)):

| Role  | Hex       | Role    | Hex       | Role  | Hex       |
|-------|-----------|---------|-----------|-------|-----------|
| base  | `#232136` | muted   | `#6e6a86` | love  | `#eb6f92` |
| surface | `#2a273f` | subtle | `#908caa` | gold  | `#f6c177` |
| overlay | `#393552` | text   | `#e0def4` | rose  | `#ea9a97` |
| pine  | `#3e8fb0` | foam    | `#9ccfd8` | iris  | `#c4a7e7` |

Diff lines: **added** leans pine (blue), **removed** leans love (red), tuned so
the two are distinguishable by both hue and brightness.

## Notes

- Built and tested against hunk `0.15.x`. The `[custom_theme]` field names
  (`background`, `addedBg`, `addedSignColor`, …) and the `[custom_theme.syntax]`
  keys are read by hunk's config loader; if a future hunk version renames or
  adds fields, those will fall back to the `base = "midnight"` theme until
  updated here.
- Want a real built-in instead of a custom block? Upstream feature request:
  [modem-dev/hunk#250](https://github.com/modem-dev/hunk/issues/250).

## License

[MIT](./LICENSE). Rosé Pine palette © the
[Rosé Pine](https://github.com/rose-pine) authors.
