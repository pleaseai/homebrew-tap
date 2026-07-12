class Shunt < Formula
  desc "Claude Code LLM gateway - Anthropic Messages proxy for OpenAI/Codex and compatible backends"
  homepage "https://github.com/pleaseai/shunt"
  version "0.9.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.9.0/shunt-darwin-arm64"
      sha256 "9209fc47f539aff10bd761e7b7778952bb601852a1cdd0aaadf4f48f6bb588cb"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.9.0/shunt-darwin-x64"
      sha256 "b71958875ed0577a1c855bd5af96fa1ede72780a4d4aba70b8904b66feedb6da"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.9.0/shunt-linux-arm64"
      sha256 "fb6f3efeef9bec9976267650f2a6ef0fecd23ff22377470d2ec5563745c2037c"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.9.0/shunt-linux-x64"
      sha256 "4d39a0ababd7486861c9cb9f08c901b29531534cb5a2910ac71976deab73ffb0"
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
