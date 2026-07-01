class Csp < Formula
  desc "Fast and accurate hybrid code search for agents"
  homepage "https://github.com/pleaseai/code-search"
  version "0.1.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/code-search/releases/download/v0.1.7/csp-darwin-arm64"
      sha256 "8f06d5ebd6e057c2f864e1b4eacd16e0d6affab0c4a58a746cc9ca52cb42c275"
    else
      url "https://github.com/pleaseai/code-search/releases/download/v0.1.7/csp-darwin-x64"
      sha256 "e0ce7d59a9ff9f1af16e56d461495ab9d4ee93618fd923c68738f92e71dd91d4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/code-search/releases/download/v0.1.7/csp-linux-arm64"
      sha256 "54698a3da0cfd4ea5ccc1c88025a271b92345ca68e5b164493af2028b3f58713"
    else
      url "https://github.com/pleaseai/code-search/releases/download/v0.1.7/csp-linux-x64"
      sha256 "f626fabce3ab3a2afa71cffaa2faa6725e79da259e0f0e3f239c7a470a002361"
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
