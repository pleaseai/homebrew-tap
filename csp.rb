class Csp < Formula
  desc "Fast and accurate hybrid code search for agents"
  homepage "https://github.com/pleaseai/code-search"
  version "0.1.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/code-search/releases/download/v0.1.9/csp-darwin-arm64"
      sha256 "a1cf75b3770d148ee79956578480396a2b5d71a74728ca91fdf21ac15c21f7e6"
    else
      url "https://github.com/pleaseai/code-search/releases/download/v0.1.9/csp-darwin-x64"
      sha256 "cc763337a7ee1e72998d6a1c3354a28c2449f8864f5a8396b1836d99943e0e5e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/code-search/releases/download/v0.1.9/csp-linux-arm64"
      sha256 "bc1ead77259f4bdb0565e0d77438538a582c7f5c5671cdc2e3c376ead6ab3aba"
    else
      url "https://github.com/pleaseai/code-search/releases/download/v0.1.9/csp-linux-x64"
      sha256 "f4c94645fe0e3aef6e79c61f8b0c0c53daa4647c74f69efe095f243c9c2067ce"
    end
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "csp-darwin-arm64" => "csp"
      else
        bin.install "csp-darwin-x64" => "csp"
      end
    else
      if Hardware::CPU.arm?
        bin.install "csp-linux-arm64" => "csp"
      else
        bin.install "csp-linux-x64" => "csp"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/csp --version")
  end
end
