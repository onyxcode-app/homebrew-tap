cask "onyx-code" do
  arch arm: "arm64", intel: "universal"

  version "2.1.1"
  sha256 arm:   "ccbe26469764c3b1e3b50a5ab871932d4f7aa280a89e6e52dcb8815fb13113ab",
         intel: "a2bf728e21b79af36da95406ebdab7acc63897db082e894fa0b53c8de33aca09"

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
    "~/Library/Preferences/com.onyxcode.app.plist",
    "~/Library/Saved Application State/com.onyxcode.app.savedState",
  ]
end
