class Shunt < Formula
  desc "Claude Code LLM gateway - Anthropic Messages proxy for OpenAI/Codex and compatible backends"
  homepage "https://github.com/pleaseai/shunt"
  version "0.4.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.4.0/shunt-darwin-arm64"
      sha256 "83f49dc7c4ad32ada449b67a6dd400403586a8d661402b1ed5c590d408e11088"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.4.0/shunt-darwin-x64"
      sha256 "cdf6099a5891b04014f3dbece48f95a32aa4219129c8bec8097c6101d966d57c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.4.0/shunt-linux-arm64"
      sha256 "40fe5307bbbc8e18fbe928fdf71aab2636514556ce3ad6aae8d0726032b5c60c"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.4.0/shunt-linux-x64"
      sha256 "cc4516526619d23c99c771fc4b2e6c92de79e7f869a79c18f6b777f8bb4e1e10"
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
