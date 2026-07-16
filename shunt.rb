class Shunt < Formula
  desc "Claude Code LLM gateway - Anthropic Messages proxy for OpenAI/Codex and compatible backends"
  homepage "https://github.com/pleaseai/shunt"
  version "0.19.1"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.19.1/shunt-darwin-arm64"
      sha256 "bba0c698cd26024e5023cbb815f48824a22265fae460490cf245de554d096b1c"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.19.1/shunt-darwin-x64"
      sha256 "e1be031577eb51529605dd7567f031f2fadae5e5c74d120e854223af1b7db5d9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.19.1/shunt-linux-arm64"
      sha256 "7a28499b13bf72eb9bc25b02a712a3d74d7b3fba7772bc44685a1ef3ee5b4707"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.19.1/shunt-linux-x64"
      sha256 "390e3559b4f9b7ed7414c639948a58403b20e4dec3bcbef7933401228ccada52"
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
