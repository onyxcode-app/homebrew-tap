cask "onyx-code" do
  arch arm: "arm64", intel: "universal"

  version "2.2.0"
  sha256 arm:   "7882dae5167e93cabc6734bf4aa396c701284fcbdea25f1becd823a099bbf94a",
         intel: "91c3bdb91569f0080683345d3676a7c93e68f71392854bbe9fba395def3789ab"

  url "https://github.com/onyxcode-app/onyxcode-releases/releases/download/v#{version}/OnyxCode-darwin-#{arch}.dmg",
      verified: "github.com/onyxcode-app/onyxcode-releases/"
  name "Onyx Code"
  desc "Private-by-design AI code editor with local inference and air-gap mode"
  homepage "https://www.onyxcode.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Onyx Code ships its own in-app updater, so Homebrew should not try to
  # manage version upgrades itself.
  auto_updates true
  depends_on macos: :monterey

  app "Onyx Code.app"

  # The bundled CLI shim is named `code`, which would collide with Visual
  # Studio Code's own `code` command on any machine that has both. Link it as
  # `onyxcode` instead, matching product.json's applicationName.
  binary "#{appdir}/Onyx Code.app/Contents/Resources/app/bin/code", target: "onyxcode"

  zap trash: [
    "~/.onyxcode",
    "~/Library/Application Support/Onyx Code",
    "~/Library/Caches/com.onyxcode.app",
    "~/Library/Caches/com.onyxcode.app.ShipIt",
    "~/Library/HTTPStorages/com.onyxcode.app",
    "~/Library/Preferences/ByHost/com.onyxcode.app.ShipIt.*.plist",
    "~/Library/Preferences/com.onyxcode.app.plist",
    "~/Library/Saved Application State/com.onyxcode.app.savedState",
  ]
end
