class Shunt < Formula
  desc "Claude Code LLM gateway - Anthropic Messages proxy for OpenAI/Codex and compatible backends"
  homepage "https://github.com/pleaseai/shunt"
  version "0.13.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.13.0/shunt-darwin-arm64"
      sha256 "301bb45de14a120d1b3e3ce15cdb48cd35af0e01ef26963b6bc41de27fa46ef5"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.13.0/shunt-darwin-x64"
      sha256 "a47683779e829e609cf1bdbd6257b207f75e83b1f9033e2302ef5a51aa8ea0ab"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.13.0/shunt-linux-arm64"
      sha256 "a01932c0fcee06b8ab0245c81323d0ffac86ca6da7a925dc27e5ab6485167ce9"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.13.0/shunt-linux-x64"
      sha256 "2202e3a5cd74caaa1e90576c74ecdceb5a70c9239de574de00a9b6db60aac04c"
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
