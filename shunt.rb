class Shunt < Formula
  desc "Claude Code LLM gateway - Anthropic Messages proxy for OpenAI/Codex and compatible backends"
  homepage "https://github.com/pleaseai/shunt"
  version "0.19.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.19.0/shunt-darwin-arm64"
      sha256 "646578ba07e12af75c377ebbb7873c5c307e732b770e7b4423f57bc4d5987850"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.19.0/shunt-darwin-x64"
      sha256 "8950c6c63d7c759707b780e6ae3f34131f9a57c8526a2223e66426606a2e8baf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.19.0/shunt-linux-arm64"
      sha256 "acd1d46570fed0c5d0d83bf0a20f5e7905fd26644f05af17a5337a0d15ed502e"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.19.0/shunt-linux-x64"
      sha256 "4cac07dffce459bb8210eb2a42834f840cd5846a6f677ae3f54c15fd05648d7c"
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
