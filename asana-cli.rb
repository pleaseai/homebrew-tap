class AsanaCli < Formula
  desc "Manage your Asana tasks from the command line"
  homepage "https://github.com/pleaseai/asana"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/asana/releases/download/v0.3.0/asana-darwin-arm64"
      sha256 "9c3da061c3b688eefc825f4ceec3da2039ef88f386b61e8d25c2f0663bf4be42"
    else
      url "https://github.com/pleaseai/asana/releases/download/v0.3.0/asana-darwin-x64"
      sha256 "d3313e503bca22231ce2e5ec5c944ec22046ccb45f4dd9b0fd78a8a303117bc1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/asana/releases/download/v0.3.0/asana-linux-arm64"
      sha256 "49883367fb41cf2225e70e93264e03efd6ad908f44ac487d90f3258816e19027"
    else
      url "https://github.com/pleaseai/asana/releases/download/v0.3.0/asana-linux-x64"
      sha256 "fecddc8cbef0c666129bf113a0564f3461869815522f03e4191acf57cf553c53"
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
