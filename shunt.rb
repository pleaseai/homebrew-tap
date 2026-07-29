class Shunt < Formula
  desc "Claude Code LLM gateway - Anthropic Messages proxy for OpenAI/Codex and compatible backends"
  homepage "https://github.com/pleaseai/shunt"
  version "0.28.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.28.0/shunt-darwin-arm64"
      sha256 "85d1a57d554323de671652277da99715d23dede4a4c5688ac0e9f8b118f8fcd4"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.28.0/shunt-darwin-x64"
      sha256 "947dc59e7b5af3bc68abf68028096ef043a31eff90be0cc6ae756519fe67a892"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.28.0/shunt-linux-arm64"
      sha256 "562c301e6ac0ad03f48ed6c729be997ecb19e6decdfa92fab4c4d292852da303"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.28.0/shunt-linux-x64"
      sha256 "fc91f953abfe69f625e2719c0f818543506e253de827bbdad34f8690e6885ddd"
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
