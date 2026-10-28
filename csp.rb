class Csp < Formula
  desc "Fast and accurate hybrid code search for agents"
  homepage "https://github.com/pleaseai/code-search"
  version "0.1.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/code-search/releases/download/v0.1.11/csp-darwin-arm64"
      sha256 "5404230ad91a81b8035cba925ea327ea2c8d3496c4648cb6df79ab7330b5a9d8"
    else
      url "https://github.com/pleaseai/code-search/releases/download/v0.1.11/csp-darwin-x64"
      sha256 "9d2c4e9c73d8eb1d7161081a8e23721c89506b72338aa533ec8cf1464fba11b0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/code-search/releases/download/v0.1.11/csp-linux-arm64"
      sha256 "dca476b931de54a9af513284d5c72ae89f89a9926d66859d70de5d72a0d4d8c1"
    else
      url "https://github.com/pleaseai/code-search/releases/download/v0.1.11/csp-linux-x64"
      sha256 "ba326a19684bfda81a1d795f6d5cc7b9a7c62421a2c8499944cb2356a7f8e9b0"
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
