class Shunt < Formula
  desc "Claude Code LLM gateway - Anthropic Messages proxy for OpenAI/Codex and compatible backends"
  homepage "https://github.com/pleaseai/shunt"
  version "0.26.1"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.26.1/shunt-darwin-arm64"
      sha256 "f3748f4cb7337a0881ecfa6a2e51cde63e2b5bfc89cddca15937d02324967368"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.26.1/shunt-darwin-x64"
      sha256 "a0ff4d4c83b03564a5510708e8893049e02be3dd1030ef4173e1b34d6fbc707d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.26.1/shunt-linux-arm64"
      sha256 "d102672cb822a3116b0ec3276969b04f6bfe77bb329ccf4de8dcb4eeac5a100a"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.26.1/shunt-linux-x64"
      sha256 "6233663df6ba92f531889d95f5818f14057e2eed221ee0b2d5481b8decb37b1f"
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
