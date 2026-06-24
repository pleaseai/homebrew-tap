class AsanaCli < Formula
  desc "Manage your Asana tasks from the command line"
  homepage "https://github.com/pleaseai/asana"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/asana/releases/download/v0.6.0/asana-darwin-arm64"
      sha256 "ea50b1a567ddc04d7f267b32c96493a702a8d4e102158e22141288eb0b386e2f"
    else
      url "https://github.com/pleaseai/asana/releases/download/v0.6.0/asana-darwin-x64"
      sha256 "ae518ef5d2d1b8ade82be610b07eb391ce2735bcff46fc5c714bd71c93df58a1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/asana/releases/download/v0.6.0/asana-linux-arm64"
      sha256 "13eec748eb6f928efcca603b07ae40f0854faf55175eafba4d6adf31e555c577"
    else
      url "https://github.com/pleaseai/asana/releases/download/v0.6.0/asana-linux-x64"
      sha256 "20f88e1c3bc391346475ea1cfbced5495807a27e68f0dc589fa18d0d4bb813a7"
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
