class Ask < Formula
  desc "Agent Skills Kit - Download version-specific library docs for AI coding agents"
  homepage "https://github.com/pleaseai/ask"
  version "0.4.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/ask/releases/download/ask-v0.4.8/ask-darwin-arm64"
      sha256 "adfb3d0f87bb0a7c6ac0055a1c5f056118d2957a0cefc24757fb848bce8235cb"
    else
      url "https://github.com/pleaseai/ask/releases/download/ask-v0.4.8/ask-darwin-x64"
      sha256 "6056040ee12353f56cd6547d60ded87841d05447179d56892ddb23c1fa398ca4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/ask/releases/download/ask-v0.4.8/ask-linux-arm64"
      sha256 "2164620da130e95c701b6b2d603196915d6f58431defd78945c69f583c6d0b8e"
    else
      url "https://github.com/pleaseai/ask/releases/download/ask-v0.4.8/ask-linux-x64"
      sha256 "d44ef4349b31332c17d42dcc6d9bbf5d174d5ed7cfcdcafd3082d67a47f05dcf"
    end
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "ask-darwin-arm64" => "ask"
      else
        bin.install "ask-darwin-x64" => "ask"
      end
    else
      if Hardware::CPU.arm?
        bin.install "ask-linux-arm64" => "ask"
      else
        bin.install "ask-linux-x64" => "ask"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ask --version")
  end
end
