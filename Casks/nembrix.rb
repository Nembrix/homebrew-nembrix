cask "nembrix" do
  version "0.4.3"

  # Per-arch dmgs (no universal build). Homebrew picks the matching
  # arch; the release job fills in each sha256 below.
  on_arm do
    sha256 "728cdf197f8bb33a6aef71f88db2d5feaf7198917e66dd26de270dd5bbb21fab"
    url "https://github.com/Nembrix/nembrix/releases/download/v#{version}/Nembrix_#{version}_macOS_Apple_Silicon.dmg",
        verified: "github.com/Nembrix/nembrix/"
  end
  on_intel do
    sha256 "583f067a771afa2fb4fb88b130db796e406f6dc130b69e1e15b59f478c481a5c"
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
