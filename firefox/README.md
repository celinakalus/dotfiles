# Firefox

This configuration adds transparency to the tab bar of Firefox. Adding
it is not as trivial as having this folder in `~/.config/firefox`.

1. In `about:config`, change the following settings:
  - Set `toolkit.legacyUserProfileCustomizations.stylesheets` to `true`.
    This allows you to change the look of Firefox using `css` files.
  - Set `browser.tabs.allow_transparent_browser` to `true` to allow
    transparency.
  - Set `gfx.webrender.all` to `true`.
2. In `about:support`, find your Profile Directory. Copy the folder
   `chrome` into your Profile Directory (or symlink it).

