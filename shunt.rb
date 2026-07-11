class Shunt < Formula
  desc "Claude Code LLM gateway - Anthropic Messages proxy for OpenAI/Codex and compatible backends"
  homepage "https://github.com/pleaseai/shunt"
  version "0.5.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.5.0/shunt-darwin-arm64"
      sha256 "d19aed4814f91dadb09e3022cd7cfc7e745899031079e239a136c4ddf9d8336f"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.5.0/shunt-darwin-x64"
      sha256 "eb576dc7189bd7db97ae085644fac850d4576886986edf7ae6f3fc856b00e1b9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.5.0/shunt-linux-arm64"
      sha256 "099bd181b07a5665e01c54049cb97c94f612a5dadc7320968b14381cc0b670d6"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.5.0/shunt-linux-x64"
      sha256 "1a88ef87c1847ff434fd5acc0e5e2c975e6d885f7778275e5ada87d30d0f91fc"
    end
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "shunt-darwin-arm64" => "shunt"
      else
        bin.install "shunt-darwin-x64" => "shunt"
      end
    else
      if Hardware::CPU.arm?
        bin.install "shunt-linux-arm64" => "shunt"
      else
        bin.install "shunt-linux-x64" => "shunt"
      end
    end
  end

  test do
    assert_match "shunt", shell_output("#{bin}/shunt --help")
  end
end
