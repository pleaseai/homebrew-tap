class Shunt < Formula
  desc "Claude Code LLM gateway - Anthropic Messages proxy for OpenAI/Codex and compatible backends"
  homepage "https://github.com/pleaseai/shunt"
  version "0.29.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.29.0/shunt-darwin-arm64"
      sha256 "536f8f3d4dd3a8e1862a10f8a51cf7dd3cfd1ab595f4b089df4cbdb1641a1f38"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.29.0/shunt-darwin-x64"
      sha256 "a710e8a479111b6911e27734f3b85c1663ac1e23062b4476f48adc8a04466454"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.29.0/shunt-linux-arm64"
      sha256 "d32a4e1b4fc3559682141917b96d5ba40836965c5106c42364358a1ba4858b59"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.29.0/shunt-linux-x64"
      sha256 "7ac7011d62aa971a17fa814f9ae7505823d1fbad2babe123e09c013329b756df"
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
