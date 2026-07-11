class Shunt < Formula
  desc "Claude Code LLM gateway - Anthropic Messages proxy for OpenAI/Codex and compatible backends"
  homepage "https://github.com/pleaseai/shunt"
  version "0.8.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.8.0/shunt-darwin-arm64"
      sha256 "2e53d3c75a2cd7a38858d2f6bed060ba483de6d02333b3a71dd229163c78baa4"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.8.0/shunt-darwin-x64"
      sha256 "2a3c3ca7b9c1c53551d821419d0073acb5ba583dff58339dc81962a2dc127fef"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.8.0/shunt-linux-arm64"
      sha256 "b4ba30d0645e93d7ac666a70264c9cb8a24816a164db739f6fae1fb2dbac6617"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.8.0/shunt-linux-x64"
      sha256 "3cd46052b5a10b9db6315b04b70d73f36e105f24f328e12656f45ecf493b8996"
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
