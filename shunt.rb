class Shunt < Formula
  desc "Claude Code LLM gateway - Anthropic Messages proxy for OpenAI/Codex and compatible backends"
  homepage "https://github.com/pleaseai/shunt"
  version "0.18.1"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.18.1/shunt-darwin-arm64"
      sha256 "5ab83d931d99dcdacc72a6fedbcf0983087d22b0a668f93d456c611ff78ec64c"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.18.1/shunt-darwin-x64"
      sha256 "1df5b3737eff19dc4a9869c571c12e77ef9ed17268880b0bc432482d1ab2561e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.18.1/shunt-linux-arm64"
      sha256 "e7d181a23c21cc33011a435ba85e3a7535668c65dbe52adaf0f2d579c4dbfc52"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.18.1/shunt-linux-x64"
      sha256 "e31855e97ef8f8411c991d133165753c355edfb5542a38d899103484bd50aa0d"
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
