class GithubMonitor < Formula
  desc "Claude Code channel server streaming GitHub events into the session"
  homepage "https://github.com/pleaseai/github-monitor"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/github-monitor/releases/download/v0.1.2/github-monitor-channel-darwin-arm64"
      sha256 "8387a4b3348639efd3ba3fea265dd194d5a7afa2d5bb42a54f0e79b7b691cc2f"
    else
      url "https://github.com/pleaseai/github-monitor/releases/download/v0.1.2/github-monitor-channel-darwin-x64"
      sha256 "dd0994ec59d42c62f99e797937d62ef1dd5f9e070ee2c6ad2e0e6198fc053f1d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/github-monitor/releases/download/v0.1.2/github-monitor-channel-linux-arm64"
      sha256 "08527e904d6c0d2a00cec1d18c46489f175c4ee521015f1edcf69fd9ec0a4302"
    else
      url "https://github.com/pleaseai/github-monitor/releases/download/v0.1.2/github-monitor-channel-linux-x64"
      sha256 "92cc801ca44e74b7dc73534527f00be9fba74adb682e021da5410c6bbfd1339b"
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
