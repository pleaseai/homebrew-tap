class Shunt < Formula
  desc "Claude Code LLM gateway - Anthropic Messages proxy for OpenAI/Codex and compatible backends"
  homepage "https://github.com/pleaseai/shunt"
  version "0.25.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.25.0/shunt-darwin-arm64"
      sha256 "579e46825dacd17f2bc3a73f82bb1aceb96f973f5db4b14b47e84e17655329df"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.25.0/shunt-darwin-x64"
      sha256 "be239b0edbf5f3965eb36a8f7595781ab177e05585816aabd9bb1b3b1bc50d77"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.25.0/shunt-linux-arm64"
      sha256 "8b21529973c0ddb3c0c010b4cb61572b7e8a797d1f52e6d5ab5c2d43625debe1"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.25.0/shunt-linux-x64"
      sha256 "1336fada711963cdc19d27a1dae2835aeede712cc1ed99e4ea9c182f2eb73990"
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
