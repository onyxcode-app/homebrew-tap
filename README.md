# Onyx Code Homebrew tap

The official Homebrew tap for **[Onyx Code](https://www.onyxcode.app/)**, a private-by-design AI
code editor with a bundled local inference engine and a one-click air-gap mode.

## Install

```sh
brew install --cask onyxcode-app/tap/onyx-code
```

That is the whole thing: the tap is added automatically on first use.

To upgrade or remove:

```sh
brew upgrade --cask onyx-code
brew uninstall --cask onyx-code

# also remove models, settings, and the activity log
brew uninstall --zap --cask onyx-code
```

## Notes

- **Onyx Code updates itself.** The cask is marked `auto_updates true`, so the app's built-in
  updater keeps you current and Homebrew does not fight it. `brew upgrade` is there if you prefer
  to drive it manually.
- **The CLI is `onyxcode`, not `code`.** The bundled shim would otherwise collide with Visual
  Studio Code on any machine that has both, so the tap links it as `onyxcode`:

  ```sh
  onyxcode .              # open the current folder
  ```

- **Apple Silicon gets the native `arm64` build**; Intel Macs get the universal build. Homebrew
  picks the right one for you.
- **macOS 12 Monterey or later.** Every build is code-signed and notarized by Apple.

## Why a tap rather than homebrew-cask

Homebrew's main cask repository applies [notability
thresholds](https://docs.brew.sh/Acceptable-Casks) to new submissions, and they are stricter again
for software submitted by its own developers. Onyx Code does not meet them yet, and submitting
anyway would waste a maintainer's time on a PR that gets closed.

This tap gives you the same one-line install today. The main repository is the goal once the
project has the public traction Homebrew asks for.

## Links

- [Onyx Code](https://www.onyxcode.app/)
- [Documentation](https://www.onyxcode.app/docs)
- [Releases and installers](https://github.com/onyxcode-app/onyxcode-releases/releases)
- [Questions and bug reports](https://github.com/onyxcode-app/onyxcode-releases/discussions)
