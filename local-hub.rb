class LocalHub < Formula
  desc "Local GitHub API cache proxy — reduce latency and save rate limits"
  homepage "https://github.com/pleaseai/local-hub"
  version ""
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/local-hub/releases/download//local-hub-darwin-arm64.tar.gz"
      sha256 "Not"
    else
      url "https://github.com/pleaseai/local-hub/releases/download//local-hub-darwin-x64.tar.gz"
      sha256 "Not"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/local-hub/releases/download//local-hub-linux-arm64.tar.gz"
      sha256 "Not"
    else
      url "https://github.com/pleaseai/local-hub/releases/download//local-hub-linux-x64.tar.gz"
      sha256 "Not"
    end
  end

  def install
    bin.install "local-hub"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/local-hub --version")
  end
end
