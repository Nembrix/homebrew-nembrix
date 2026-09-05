cask "nembrix" do
  version "0.4.6"

  # Per-arch dmgs (no universal build). Homebrew picks the matching
  # arch; the release job fills in each sha256 below.
  on_arm do
    sha256 "9e47eee89eeceb6987f87cb814972e5201d3ffda3e14c42003e73886c296a2ed"
    url "https://github.com/Nembrix/nembrix/releases/download/v#{version}/Nembrix_#{version}_macOS_Apple_Silicon.dmg",
        verified: "github.com/Nembrix/nembrix/"
  end
  on_intel do
    sha256 "c1f1c5b056b63c33ae304134031c831bcaf70a02beda2eb7b010bb7ff63e59fe"
    url "https://github.com/Nembrix/nembrix/releases/download/v#{version}/Nembrix_#{version}_macOS_Intel.dmg",
        verified: "github.com/Nembrix/nembrix/"
  end

  name "Nembrix"
  desc "Connect. Query. Control."
  homepage "https://github.com/Nembrix/nembrix"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "Nembrix.app"

  zap trash: [
    "~/Library/Application Support/dev.nembrix.app",
    "~/Library/Preferences/dev.nembrix.app.plist",
    "~/Library/Caches/dev.nembrix.app",
  ]
end
