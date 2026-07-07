class Ask < Formula
  desc "Agent Skills Kit - Download version-specific library docs for AI coding agents"
  homepage "https://github.com/pleaseai/ask"
  version "0.4.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/ask/releases/download/ask-v0.4.9/ask-darwin-arm64"
      sha256 "0becaebb8aa7d74b24a210fe4604ffdc274b5c5d14898cdaf229b9259c5df18f"
    else
      url "https://github.com/pleaseai/ask/releases/download/ask-v0.4.9/ask-darwin-x64"
      sha256 "30643e5872fa43121408553ee1049e77c382c79406d39b360012255d02f84388"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/ask/releases/download/ask-v0.4.9/ask-linux-arm64"
      sha256 "2e48bf228abd32cc3e1dd0fb9bc3c18da3c9e3faca36ad50e8dd04e1f2ee907a"
    else
      url "https://github.com/pleaseai/ask/releases/download/ask-v0.4.9/ask-linux-x64"
      sha256 "809f4a058062537a632e175d2de0d3b6a70cb4218dd845f7b659d728c0d05c64"
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
