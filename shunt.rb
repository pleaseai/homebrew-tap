class Shunt < Formula
  desc "Claude Code LLM gateway - Anthropic Messages proxy for OpenAI/Codex and compatible backends"
  homepage "https://github.com/pleaseai/shunt"
  version "0.24.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.24.0/shunt-darwin-arm64"
      sha256 "1e042ab91ae470aa6decc7e0d57b7d6da50006b944b1c9f9892c86c7918de84c"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.24.0/shunt-darwin-x64"
      sha256 "4ab31c3f0623f3f4b54ef316eeac0870c4736a8cb688db69149f384db7b7a5d0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.24.0/shunt-linux-arm64"
      sha256 "ced2b15cb42eab8aeff54d1abe8d8362be5aca1847b7b5b2fbd2798328ec72f5"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.24.0/shunt-linux-x64"
      sha256 "e67ae22e1ece51232cfa09c282da1a324f6b198c63af81cc4ea31a821c583770"
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
