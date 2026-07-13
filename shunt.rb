class Shunt < Formula
  desc "Claude Code LLM gateway - Anthropic Messages proxy for OpenAI/Codex and compatible backends"
  homepage "https://github.com/pleaseai/shunt"
  version "0.11.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.11.0/shunt-darwin-arm64"
      sha256 "c00d67828c5207237297419b14991e22c82a041f16555e9955860cc4d4588845"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.11.0/shunt-darwin-x64"
      sha256 "1569a067e31841fcff8be73989f83075a3eabdd8b0fe2f10f05d0b0257eb4d28"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.11.0/shunt-linux-arm64"
      sha256 "bb259c9f3ede5ae716457d9a791a4a04d85b54a48d07d73e310100fe53f1c0c5"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.11.0/shunt-linux-x64"
      sha256 "932a026a3f843d5d0709b195b56ab473a6ea7b4e52a5895fd514c59294b9b3fe"
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
