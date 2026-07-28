cask "openhwp" do
  arch arm: "darwin-arm64", intel: "darwin-x64"

  version "0.2.2"
  sha256 arm:   "023e2a48511f7b40e6c0df505713b7ad9301392db98d3e768dc8c056e8dd7a19",
         intel: "bf8414224420a5e372f7f014dbaba9149a61cbd3df6b183ff00d4a4990f3c09b"

  url "https://github.com/pleaseai/openhwp/releases/download/v#{version}/OpenHWP-#{arch}.dmg"
  name "OpenHWP"
  desc "Open-source HWP/HWPX desktop editor"
  homepage "https://github.com/pleaseai/openhwp"

  depends_on macos: ">= :monterey"

  app "OpenHWP.app"

  zap trash: [
    "~/Library/Application Support/dev.pleaseai.openhwp",
    "~/Library/Caches/dev.pleaseai.openhwp",
    "~/Library/Preferences/dev.pleaseai.openhwp.plist",
    "~/Library/Saved Application State/dev.pleaseai.openhwp.savedState",
  ]
end
