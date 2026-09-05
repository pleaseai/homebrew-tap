class Csp < Formula
  desc "Fast and accurate hybrid code search for agents"
  homepage "https://github.com/pleaseai/code-search"
  version "0.1.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/code-search/releases/download/v0.1.10/csp-darwin-arm64"
      sha256 "5e0bdf05414fa5ef8bf6ef8cf84d188f03786a0b98eef1c9041cd1ca6d3b1f63"
    else
      url "https://github.com/pleaseai/code-search/releases/download/v0.1.10/csp-darwin-x64"
      sha256 "d00a3c8a67648472a7ccc5476ba4e945166e2130fa0d523d13c26c2d80d79935"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/code-search/releases/download/v0.1.10/csp-linux-arm64"
      sha256 "7ac071efbae9cb89413ede92bad2f5de4f240f783ec0a629f1d970e126003268"
    else
      url "https://github.com/pleaseai/code-search/releases/download/v0.1.10/csp-linux-x64"
      sha256 "e5f3d2469808bb9470cfb6f5ebbd6356b364878949404a577fe4a1e9c16103fd"
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
