class Shunt < Formula
  desc "Claude Code LLM gateway - Anthropic Messages proxy for OpenAI/Codex and compatible backends"
  homepage "https://github.com/pleaseai/shunt"
  version "0.22.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.22.0/shunt-darwin-arm64"
      sha256 "34a7cb53c7e441eda76738c25821cb1378d19997cf469d8c7d364033f9804b41"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.22.0/shunt-darwin-x64"
      sha256 "4d2a8994924c70891f0c84aedbfb15d72e0a8fbc12072e77c70cd6565095ea23"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.22.0/shunt-linux-arm64"
      sha256 "ec601b714f9caa2e380a6dbf5c589e7c6cfa3a4c7b93bdc2fd1581339cfeffa0"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.22.0/shunt-linux-x64"
      sha256 "f5dc2275ea9536e58664c0334d9234134770b64d0ea1f0f3e84b31f7a46ed650"
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
