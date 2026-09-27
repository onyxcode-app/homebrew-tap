cask "onyx-code" do
  arch arm: "arm64", intel: "universal"

  version "2.3.0"
  sha256 arm:   "bbebc740068936aaf0f9cc87f7616ed8eeabe2acc60244601ccc23066d028304",
         intel: "f1f9b07e128b5d6b6873ac5fc5562b50617cb6ba9c81ebbdbccce60c068e9359"

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
