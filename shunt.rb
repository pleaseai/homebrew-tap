class Shunt < Formula
  desc "Claude Code LLM gateway - Anthropic Messages proxy for OpenAI/Codex and compatible backends"
  homepage "https://github.com/pleaseai/shunt"
  version "0.15.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.15.0/shunt-darwin-arm64"
      sha256 "55a621794ac3ba11691dd8124d5d55e674b498ef109e6a5910be660d63e508a4"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.15.0/shunt-darwin-x64"
      sha256 "2868dcdd00853dc0198b4cdaa7a4b3c1d05b256878fa8a86d13d4f4e97cc1414"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.15.0/shunt-linux-arm64"
      sha256 "241149e954710f1e40e9795cad83a29d85e3ee02700ff6a84205a0942830a973"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.15.0/shunt-linux-x64"
      sha256 "f52ac15abeba4b9d704808457e7d9302831df513bc685886abce4ef661cb4504"
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
