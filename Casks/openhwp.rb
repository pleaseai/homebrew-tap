cask "openhwp" do
  arch arm: "darwin-arm64", intel: "darwin-x64"

  version "0.2.3"
  sha256 arm:   "a90be872cce0312b830ce78cf8230e8bc05ebbcaa67b936e56cfa91ea0173a4b",
         intel: "864134a74fa0c7504829d21d71e136a6b7eedeaa4436505e32cb71e184d5d65f"

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
