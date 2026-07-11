class Shunt < Formula
  desc "Claude Code LLM gateway - Anthropic Messages proxy for OpenAI/Codex and compatible backends"
  homepage "https://github.com/pleaseai/shunt"
  version "0.7.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.7.0/shunt-darwin-arm64"
      sha256 "b3924c5250bfc08f2e5c572e7c943761bfb877503d4d6f8620c5bd19200779bd"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.7.0/shunt-darwin-x64"
      sha256 "cb438b5e122cb8521ab7400417d2a163fed98b4f40238f7031820313397c97d2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.7.0/shunt-linux-arm64"
      sha256 "1e3936f6616fe0ee7b58875f9d1cf88726bb6449d12a05a30e2c82169dc03e01"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.7.0/shunt-linux-x64"
      sha256 "2acbeeac8dcc14206394f041999644b4223a09df02153f58f07532b0c76f02cd"
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
