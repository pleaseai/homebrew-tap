class GithubMonitor < Formula
  desc "Claude Code channel server streaming GitHub events into the session"
  homepage "https://github.com/pleaseai/github-monitor"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/github-monitor/releases/download/v0.1.3/github-monitor-channel-darwin-arm64"
      sha256 "ca8e34be8fea7c11fdcc07c4fa01b19cc9a6eac2d278e92045f6a12162f525c0"
    else
      url "https://github.com/pleaseai/github-monitor/releases/download/v0.1.3/github-monitor-channel-darwin-x64"
      sha256 "21978b94a713604549818da09831bd37210612945b0851506100ef88f91d5073"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/github-monitor/releases/download/v0.1.3/github-monitor-channel-linux-arm64"
      sha256 "139a24f7573b274f6aa7960681fe1049817457dc116baf51525038a8e70e053d"
    else
      url "https://github.com/pleaseai/github-monitor/releases/download/v0.1.3/github-monitor-channel-linux-x64"
      sha256 "2ea9d391fac3746de676921598049abfcc7bbf04887b2b057d8c9ae534bba045"
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
