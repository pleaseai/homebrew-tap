class Shunt < Formula
  desc "Claude Code LLM gateway - Anthropic Messages proxy for OpenAI/Codex and compatible backends"
  homepage "https://github.com/pleaseai/shunt"
  version "0.20.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.20.0/shunt-darwin-arm64"
      sha256 "85f2eefb05433e148d21ccd6c0783962bf01b62efe652f9841a50a75493892dd"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.20.0/shunt-darwin-x64"
      sha256 "f9c4e4e564589e3edb635c58f2540b343cf68dfe4946eb94607cbf98ea5d782f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.20.0/shunt-linux-arm64"
      sha256 "b88bb71a1329d8d1ef2bf29f633a3a21c772af8c1a830d760881052402fb3e63"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.20.0/shunt-linux-x64"
      sha256 "6d3bc829ec88b30c9890b954175bf4aae3fe9b0ed64436922abcbd084e7e460d"
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
