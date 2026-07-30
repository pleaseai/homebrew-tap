class Shunt < Formula
  desc "Claude Code LLM gateway - Anthropic Messages proxy for OpenAI/Codex and compatible backends"
  homepage "https://github.com/pleaseai/shunt"
  version "0.31.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.31.0/shunt-darwin-arm64"
      sha256 "b50bf48216cfe874418ead2e8c62c78be46d63a774967a4a568306895fbf61f8"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.31.0/shunt-darwin-x64"
      sha256 "3b6f18e4780963340eae86c77e1c9bf7c25b2fe02b53ab1d021641be8a1e7aed"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.31.0/shunt-linux-arm64"
      sha256 "f9d0420e07cd0bb09d20b0f122c7a93d3df8edfe2961069eb39cdad8219dd916"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.31.0/shunt-linux-x64"
      sha256 "57463584da9104222ed0199a3c1f3d619d9777b1bc41d96c7e424bfaf25b3f11"
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
