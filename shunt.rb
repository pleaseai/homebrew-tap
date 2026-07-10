class Shunt < Formula
  desc "Claude Code LLM gateway - Anthropic Messages proxy for OpenAI/Codex and compatible backends"
  homepage "https://github.com/pleaseai/shunt"
  version "0.3.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.3.0/shunt-darwin-arm64"
      sha256 "b659e74ce5dd7811cf2fe5fb623dece896f270d3ec6721334e4de448ef97b05e"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.3.0/shunt-darwin-x64"
      sha256 "5ee529f911262d1a36416bf38ddaea422af2605c0f654b7a1356b846fccd6ca4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.3.0/shunt-linux-arm64"
      sha256 "5d1f96be33d2428d10453a8f49f08d1af6e0dcced3e8d41322b24270aecedfc7"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.3.0/shunt-linux-x64"
      sha256 "1b87e4f5c45e298c43395f5e54437e843415411f19693bc202662b43c1e1ac5b"
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
