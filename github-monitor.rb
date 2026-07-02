class GithubMonitor < Formula
  desc "Claude Code channel server streaming GitHub events into the session"
  homepage "https://github.com/pleaseai/github-monitor"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/github-monitor/releases/download/v0.1.0/github-monitor-channel-darwin-arm64"
      sha256 "0f982d3ba4d5891db3a5e933563996423c0fafba9a01b3619c30f47b5615f385"
    else
      url "https://github.com/pleaseai/github-monitor/releases/download/v0.1.0/github-monitor-channel-darwin-x64"
      sha256 "46cd6a9fc48d8733ffc8d9970870f0ad5de4fc58f2c4a3f72eaad306c2007cc4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/github-monitor/releases/download/v0.1.0/github-monitor-channel-linux-arm64"
      sha256 "3ce4b2b4a464b99a651214e23ac6fe5845eec98fed631ce5552eb5b1adff6735"
    else
      url "https://github.com/pleaseai/github-monitor/releases/download/v0.1.0/github-monitor-channel-linux-x64"
      sha256 "83467cdb6abfc5caf7619d404b4f5e0b05c460eb4392806364b0232ef60d2765"
    end
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "github-monitor-channel-darwin-arm64" => "github-monitor-channel"
      else
        bin.install "github-monitor-channel-darwin-x64" => "github-monitor-channel"
      end
    else
      if Hardware::CPU.arm?
        bin.install "github-monitor-channel-linux-arm64" => "github-monitor-channel"
      else
        bin.install "github-monitor-channel-linux-x64" => "github-monitor-channel"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/github-monitor-channel --version")
  end
end
