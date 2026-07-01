class Csp < Formula
  desc "Fast and accurate hybrid code search for agents"
  homepage "https://github.com/pleaseai/code-search"
  version "0.1.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/code-search/releases/download/v0.1.8/csp-darwin-arm64"
      sha256 "bb8dd8d363ecd9a4fbd528f7d5308ab02967889a87ff37868b947382b9ae5c13"
    else
      url "https://github.com/pleaseai/code-search/releases/download/v0.1.8/csp-darwin-x64"
      sha256 "bd4e5b639ec91d141d9b169a9184d95df8f77b4867b012984b5ea164ae73ebfc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/code-search/releases/download/v0.1.8/csp-linux-arm64"
      sha256 "1b11a569d9d85385cdb64727f7a52a609a17c3f3fc89ae33ba62311661262e6f"
    else
      url "https://github.com/pleaseai/code-search/releases/download/v0.1.8/csp-linux-x64"
      sha256 "7fa152c3248fa2f07389c98906c9283c53515bb87a9aa90f881062079f4e45d8"
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
