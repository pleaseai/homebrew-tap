class Shunt < Formula
  desc "Claude Code LLM gateway - Anthropic Messages proxy for OpenAI/Codex and compatible backends"
  homepage "https://github.com/pleaseai/shunt"
  version "0.18.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.18.0/shunt-darwin-arm64"
      sha256 "02039fe1862d60aea9b99f00cb4999d09c573a840d2eca176e82eed61286b0fc"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.18.0/shunt-darwin-x64"
      sha256 "0ef5092a926f0858da70a85acbab98d44c3ff2cc317e7d79fc22d8ea0c8f429e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.18.0/shunt-linux-arm64"
      sha256 "8302cf0fa95eabaf43217d1f1020f6ca348ab06003342438731a3120f970d033"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.18.0/shunt-linux-x64"
      sha256 "1eec0cb5d8a5808439d8233c40d50705e11c6b66ecec890aaae166dfd6487957"
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
