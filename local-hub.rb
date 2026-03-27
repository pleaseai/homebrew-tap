class LocalHub < Formula
  desc "Local GitHub API cache proxy — reduce latency and save rate limits"
  homepage "https://github.com/pleaseai/local-hub"
  license "MIT"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/pleaseai/local-hub/releases/download/v#{version}/local-hub-darwin-arm64.tar.gz"
      # sha256 will be updated by CI on release
      sha256 "UPDATE_ON_RELEASE"
    end

    on_intel do
      url "https://github.com/pleaseai/local-hub/releases/download/v#{version}/local-hub-darwin-x64.tar.gz"
      sha256 "UPDATE_ON_RELEASE"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pleaseai/local-hub/releases/download/v#{version}/local-hub-linux-arm64.tar.gz"
      sha256 "UPDATE_ON_RELEASE"
    end

    on_intel do
      url "https://github.com/pleaseai/local-hub/releases/download/v#{version}/local-hub-linux-x64.tar.gz"
      sha256 "UPDATE_ON_RELEASE"
    end
  end

  def install
    bin.install "local-hub"
  end

  test do
    assert_match "local-hub", shell_output("#{bin}/local-hub --version")
  end
end
