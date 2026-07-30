class Shunt < Formula
  desc "Claude Code LLM gateway - Anthropic Messages proxy for OpenAI/Codex and compatible backends"
  homepage "https://github.com/pleaseai/shunt"
  version "0.30.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.30.0/shunt-darwin-arm64"
      sha256 "fa550006ec75cb38362ea0b0ee35bd7dcb2d355d14739f0041e33d39d1869c1b"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.30.0/shunt-darwin-x64"
      sha256 "497e3f1d8bfa1c6109fb2664e91c73160cbe33206af8f70c1e20a2a3712f936e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.30.0/shunt-linux-arm64"
      sha256 "cdb0dfbc51f0b963d61989c51be8e4a6e6b75477931b0633a7b64d1f02bbce44"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.30.0/shunt-linux-x64"
      sha256 "3d3ef6fc3ea390cc8143ae87b9041e8d9ad81b26baebec6f1ff49e836c5896af"
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
