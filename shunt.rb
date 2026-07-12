class Shunt < Formula
  desc "Claude Code LLM gateway - Anthropic Messages proxy for OpenAI/Codex and compatible backends"
  homepage "https://github.com/pleaseai/shunt"
  version "0.10.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.10.0/shunt-darwin-arm64"
      sha256 "aa35a9b8e98a381e42a5c6dbf12f1564b2a74ecda3f85d8ea31b832d8925f783"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.10.0/shunt-darwin-x64"
      sha256 "c711b6429cb100bb1a46bc92c761e62bb120a589426cf1d6d14ecd70df643d9a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.10.0/shunt-linux-arm64"
      sha256 "710d6d157e2670f2d48869d8dc31296ae16099dcc61ea9b4b4b8cb0088cc0422"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.10.0/shunt-linux-x64"
      sha256 "67304039c9974a6c75d120f6029cdd16359652f7f6d09c8abba6da5f25220e27"
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
