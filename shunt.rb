class Shunt < Formula
  desc "Claude Code LLM gateway - Anthropic Messages proxy for OpenAI/Codex and compatible backends"
  homepage "https://github.com/pleaseai/shunt"
  version "0.12.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.12.0/shunt-darwin-arm64"
      sha256 "bec416e21c23eebe0f68d58291ca4c29601cb583d2216c41fb5b9dac3069afe0"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.12.0/shunt-darwin-x64"
      sha256 "86c8273e5f9bfc338bde1c694f61b844c12708473abb2abba1aac84e0c8b21aa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.12.0/shunt-linux-arm64"
      sha256 "f7746c478844759bef502ffaa5c449c7eea71dcde5455fd3f0eb26f6618cd376"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.12.0/shunt-linux-x64"
      sha256 "524625af78eb21e7300d6a1a1dd01d58f4dfb810886a5418f0fd7e5ef39ee7d9"
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
