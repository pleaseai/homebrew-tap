class Ask < Formula
  desc "Agent Skills Kit - Download version-specific library docs for AI coding agents"
  homepage "https://github.com/pleaseai/ask"
  version "0.4.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/ask/releases/download/ask-v0.4.7/ask-darwin-arm64"
      sha256 "956849471b06a75d83383a3689138b31b57a0ece1d57b535537bea85da3faa32"
    else
      url "https://github.com/pleaseai/ask/releases/download/ask-v0.4.7/ask-darwin-x64"
      sha256 "db26e6bc4a30db6f567ac5a1092fc3d8bbd19b10f19288c168f853ee62e9b065"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/ask/releases/download/ask-v0.4.7/ask-linux-arm64"
      sha256 "c3c1786eb8c84c403aaa5fa3f47cf6a47b5e94a464eb04255a412d1dfd7e8ac1"
    else
      url "https://github.com/pleaseai/ask/releases/download/ask-v0.4.7/ask-linux-x64"
      sha256 "eaf4ed8370f21d222693d559b32a581b90d3f4bdca732262fb3de9a1b9f6e815"
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
