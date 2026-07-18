class Shunt < Formula
  desc "Claude Code LLM gateway - Anthropic Messages proxy for OpenAI/Codex and compatible backends"
  homepage "https://github.com/pleaseai/shunt"
  version "0.21.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.21.0/shunt-darwin-arm64"
      sha256 "50cea22b65370c46d00d2c290c892558ec6b0d810a17f4a4867b371d36b7618e"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.21.0/shunt-darwin-x64"
      sha256 "bdf46462b39da5ba685910e5ae8e30069a93ee2fb3019c1b7c186310af3d09d5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.21.0/shunt-linux-arm64"
      sha256 "f399f5d7a61097eb11f33469b5772bd6487ddd48e9591f8d0cf26c503fc7302b"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.21.0/shunt-linux-x64"
      sha256 "82cbfaaa7931837440db971996c89192bea6f4bf1b36988f528046783dc4e3b5"
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
