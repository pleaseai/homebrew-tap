class Shunt < Formula
  desc "Claude Code LLM gateway - Anthropic Messages proxy for OpenAI/Codex and compatible backends"
  homepage "https://github.com/pleaseai/shunt"
  version "0.23.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.23.0/shunt-darwin-arm64"
      sha256 "8e7b2d4c2ed2813926c3376ba204b2d4d1718fd9f9bb73586b58bad3584222fd"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.23.0/shunt-darwin-x64"
      sha256 "de21a8acb75bd7e2681c93ae6eeb21d1a3c0527b338a1e14030755f28009d98b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.23.0/shunt-linux-arm64"
      sha256 "4374ce1cda49526ee7251fa3ae8f4a054b337734499c123dde9cd2fe6df14fde"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.23.0/shunt-linux-x64"
      sha256 "0deb64e933fe1a1c0037816f3ff6ac0f54ed6de75f5ee56c9b9fa9879f2bebed"
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
