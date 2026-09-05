cask "nembrix" do
  version "0.5.1"

  # Per-arch dmgs (no universal build). Homebrew picks the matching
  # arch; the release job fills in each sha256 below.
  on_arm do
    sha256 "8c32b468fe1d605111c4531de0b489560fd486d36a2f71293ecd2b060f2b594e"
    url "https://github.com/Nembrix/nembrix/releases/download/v#{version}/Nembrix_#{version}_macOS_Apple_Silicon.dmg",
        verified: "github.com/Nembrix/nembrix/"
  end
  on_intel do
    sha256 "595e9dfc934ef427c6bf053dcc205e4822dbc2c24f9d03658b08cc10b770e65f"
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
