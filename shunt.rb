class Shunt < Formula
  desc "Claude Code LLM gateway - Anthropic Messages proxy for OpenAI/Codex and compatible backends"
  homepage "https://github.com/pleaseai/shunt"
  version "0.27.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.27.0/shunt-darwin-arm64"
      sha256 "3e345ffa4b71c47e612c93cc48bf63b4935eea7a53e8fcae9b0434120979f273"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.27.0/shunt-darwin-x64"
      sha256 "ec00e8434dbd672d85c39dc7cc3b8d3df069931034b1c481a83861421ccb07fa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.27.0/shunt-linux-arm64"
      sha256 "334add06f6467f86f5b2056e7280cb0c7aeba9fc5f416dac0705e2792671cf54"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.27.0/shunt-linux-x64"
      sha256 "7f5e0b9313568f5a8c37aa2c8f919491be3d417ff60a6df7f8489a24fbed5752"
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
