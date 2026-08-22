cask "nembrix" do
  version "0.4.4"

  # Per-arch dmgs (no universal build). Homebrew picks the matching
  # arch; the release job fills in each sha256 below.
  on_arm do
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
    url "https://github.com/Nembrix/nembrix/releases/download/v#{version}/Nembrix_#{version}_macOS_Apple_Silicon.dmg",
        verified: "github.com/Nembrix/nembrix/"
  end
  on_intel do
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
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
