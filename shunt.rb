class Shunt < Formula
  desc "Claude Code LLM gateway - Anthropic Messages proxy for OpenAI/Codex and compatible backends"
  homepage "https://github.com/pleaseai/shunt"
  version "0.17.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.17.0/shunt-darwin-arm64"
      sha256 "f6dd8eb3980c454edd02ca43b979ccd238aa85eb6e2ac3d74bb4551083998437"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.17.0/shunt-darwin-x64"
      sha256 "a624106821594caecbc6f3eca095add108ff222b6e3fa859e412128182237d2d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.17.0/shunt-linux-arm64"
      sha256 "618bbdcee92c3767ce63d4e7dc48d21395eee47cfc5d6a807a4c41d681e5c00a"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.17.0/shunt-linux-x64"
      sha256 "c915b525bb02479779ddfd515c020320f5da8c6e5e27d076d4cfadb27eb5a1c1"
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
