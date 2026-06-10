class AsanaCli < Formula
  desc "Manage your Asana tasks from the command line"
  homepage "https://github.com/pleaseai/asana"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/asana/releases/download/v0.5.0/asana-darwin-arm64"
      sha256 "52a9125d954063e1965f165f3b3fd523157ff5adab48764f446da06788a8b28a"
    else
      url "https://github.com/pleaseai/asana/releases/download/v0.5.0/asana-darwin-x64"
      sha256 "5b894d90623527acae7561f350b35773bd1847cb1fcf3bfd36372b0781da2fe9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/asana/releases/download/v0.5.0/asana-linux-arm64"
      sha256 "4b68b2248551d3f6186fe16dca164eb28b4d45af23d07bb429ca568440aa44ce"
    else
      url "https://github.com/pleaseai/asana/releases/download/v0.5.0/asana-linux-x64"
      sha256 "46e7cc0de3cc4860c7d6e4a3165c79697c6ff16470c99aa5f460a8a79e465c4b"
    end
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "asana-darwin-arm64" => "asana"
      else
        bin.install "asana-darwin-x64" => "asana"
      end
    else
      if Hardware::CPU.arm?
        bin.install "asana-linux-arm64" => "asana"
      else
        bin.install "asana-linux-x64" => "asana"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asana --version")
  end
end
