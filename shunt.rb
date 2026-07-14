class Shunt < Formula
  desc "Claude Code LLM gateway - Anthropic Messages proxy for OpenAI/Codex and compatible backends"
  homepage "https://github.com/pleaseai/shunt"
  version "0.16.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.16.0/shunt-darwin-arm64"
      sha256 "35be826e1f1d3c8f7d4b0564468efd9c2ec69f16610cf7b77d21a608476c0a87"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.16.0/shunt-darwin-x64"
      sha256 "8f7918b77d3fb3cfdedd4c9da1ad69bbebe683fb96b165572c47922ae8fa2890"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.16.0/shunt-linux-arm64"
      sha256 "91a600937a83a439a996fa09bcf5526c4a6ebf17d81b27b0758ccd595a113297"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.16.0/shunt-linux-x64"
      sha256 "2f59ff866799ddd349b1d90666452b04e7e1b319924ba0ad0a46ae5f9a302fff"
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
