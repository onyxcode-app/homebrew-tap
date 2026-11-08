cask "onyx-code" do
  arch arm: "arm64", intel: "universal"

  version "2.7.1"
  sha256 arm:   "6a41dba34ef531f2c3140334a35aa72df115e9652e3b5c189822d31ca55a736a",
         intel: "001779bfabe150287909b9fb82426a78a537bb5c95a1b250ede59172b4e620e8"

  url "https://github.com/onyxcode-app/onyxcode-releases/releases/download/v#{version}/OnyxCode-darwin-#{arch}.dmg"
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
