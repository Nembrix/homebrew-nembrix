cask "nembrix" do
  version "0.4.0"

  # Per-arch dmgs (no universal build). Homebrew picks the matching
  # arch; the release job fills in each sha256 below.
  on_arm do
    sha256 "07767db582e21a6531dbba820e64ca0218e7c641186eb4bb986f137d879bb1a2"
    url "https://github.com/Nembrix/nembrix/releases/download/v#{version}/Nembrix_#{version}_macOS_Apple_Silicon.dmg",
        verified: "github.com/Nembrix/nembrix/"
  end
  on_intel do
    sha256 "0112df69325be4b80c01bc32bca8513dd283cd0c9bcbec904abcbb7d26cef9c3"
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
