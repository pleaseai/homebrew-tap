class Shunt < Formula
  desc "Claude Code LLM gateway - Anthropic Messages proxy for OpenAI/Codex and compatible backends"
  homepage "https://github.com/pleaseai/shunt"
  version "0.14.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.14.0/shunt-darwin-arm64"
      sha256 "cdced1997b6ca16b3ab410702d3e3dc11cfd2e07eacc429fc860b51c581ae78d"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.14.0/shunt-darwin-x64"
      sha256 "7f8f52dc082699a76663a38c50ef4d62e8d252f69f5b4d5edf1f54c0f3b22e3d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.14.0/shunt-linux-arm64"
      sha256 "fa21a167453c300a53af0065ceae39edeb15f43e611998eccb150483d9b67319"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.14.0/shunt-linux-x64"
      sha256 "202db1ffa56d7d0298ed4ef14c46a067d74b968052f897fc237b182b917b9aea"
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
