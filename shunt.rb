class Shunt < Formula
  desc "Claude Code LLM gateway - Anthropic Messages proxy for OpenAI/Codex and compatible backends"
  homepage "https://github.com/pleaseai/shunt"
  version "0.6.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.6.0/shunt-darwin-arm64"
      sha256 "c278fe0821bf313bd748d774406315dbb0dda7b59bea6a12aa7ef088f4273d49"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.6.0/shunt-darwin-x64"
      sha256 "c75b97b4baae776c9f485c37cfc9c2344bec1fcd4b6027d511880b216546259c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.6.0/shunt-linux-arm64"
      sha256 "6d62ae96e0c2f71b7e3b446ace9f226964a7d5297583e41327af04bdd7be5f20"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.6.0/shunt-linux-x64"
      sha256 "893f18990097ce36b0695a2b4f817f829eaf5f6ed488d442770003d803dceff5"
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
