class Shunt < Formula
  desc "Claude Code LLM gateway - Anthropic Messages proxy for OpenAI/Codex and compatible backends"
  homepage "https://github.com/pleaseai/shunt"
  version "0.2.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.2.0/shunt-darwin-arm64"
      sha256 "d55bd219a5ac2039b529a9b6c8f5f2b5ccb5639986fe9e18b5924a4b32e92f70"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.2.0/shunt-darwin-x64"
      sha256 "ae61d0697f958b0d20788c6dafbbb3c9bce8d3b5f7ef2074ec8268bdecc2bdd9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.2.0/shunt-linux-arm64"
      sha256 "312cc26fa2a7c7f01f7fed24a01191cbd3d574b074cb8dec7ec328899da2cff2"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.2.0/shunt-linux-x64"
      sha256 "cb52e1955b21a43868951b41f06eb0cb4b47f240d3937ca04cb1a52f3d92e99f"
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
