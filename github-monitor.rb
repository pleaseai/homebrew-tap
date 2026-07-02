class GithubMonitor < Formula
  desc "Claude Code channel server streaming GitHub events into the session"
  homepage "https://github.com/pleaseai/github-monitor"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/github-monitor/releases/download/v0.1.1/github-monitor-channel-darwin-arm64"
      sha256 "94826c8ad5749b98eaf3ff73b2ed90d72de309e421bb903207dc1b62fca5903e"
    else
      url "https://github.com/pleaseai/github-monitor/releases/download/v0.1.1/github-monitor-channel-darwin-x64"
      sha256 "b060222c40fa52ea137195867e6f7476d093daf1c85d9f4c605ebed91c2caa73"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/github-monitor/releases/download/v0.1.1/github-monitor-channel-linux-arm64"
      sha256 "b2429966fca192954383abf77b65dd8b01756954dd49dfaa75061350aec9420c"
    else
      url "https://github.com/pleaseai/github-monitor/releases/download/v0.1.1/github-monitor-channel-linux-x64"
      sha256 "57516503b71c3eb83546b051d81791a0db492b4f5d1dc13442fcaa5a6f5bbc10"
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
