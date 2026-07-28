class Shunt < Formula
  desc "Claude Code LLM gateway - Anthropic Messages proxy for OpenAI/Codex and compatible backends"
  homepage "https://github.com/pleaseai/shunt"
  version "0.26.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.26.0/shunt-darwin-arm64"
      sha256 "59e5b084786e007fb0f31575d132189cab26a333f395ad6b942100fddc76274a"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.26.0/shunt-darwin-x64"
      sha256 "20aa2982742894bb32bb0a54f3d057e63cd055e77c027b588f177a174470a825"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.26.0/shunt-linux-arm64"
      sha256 "ca323867dc5556feae98f8859b6b218aaf3f341f5abb6a3c883b2cbbce3c75ea"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.26.0/shunt-linux-x64"
      sha256 "07750a60c326513b69c20d878a0a877c4878e5b0db4dba83e7601d382f47a0da"
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
