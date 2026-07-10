class Shunt < Formula
  desc "Claude Code LLM gateway - Anthropic Messages proxy for OpenAI/Codex and compatible backends"
  homepage "https://github.com/pleaseai/shunt"
  version "0.1.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v#{version}/shunt-darwin-arm64"
      sha256 "708cdd76331cad6c414186ef27f80673e8671cfe72683fb4156fa6b973dbc200"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v#{version}/shunt-darwin-x64"
      sha256 "ffdc0be5c20d0d91551bc0e3db946aa21f2dae1ef113aea6e09ff1f97d34059f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v#{version}/shunt-linux-arm64"
      sha256 "d363b3b694d18fa29ce1e7387ea5cea2a3222fb8bff848a1e3867b4667be9bcb"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v#{version}/shunt-linux-x64"
      sha256 "e04e44f368f59adbe534e02ad9310106e0e2ce8206d24b3b20030f18233d65ba"
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
