cask "openhwp" do
  arch arm: "darwin-arm64", intel: "darwin-x64"

  version "0.2.0"
  sha256 arm:   "97b4b5c7dbd92abaf4a6cad2fb49d7fe089796e26bc87d13095f65e797ac15cb",
         intel: "e96fd9b1db84310a24487441df739686d8f8d5ba3ee21ead82491d6da138eab3"

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
