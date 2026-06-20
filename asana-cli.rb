class AsanaCli < Formula
  desc "Manage your Asana tasks from the command line"
  homepage "https://github.com/pleaseai/asana"
  version "0.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/asana/releases/download/v0.5.1/asana-darwin-arm64"
      sha256 "6df2f2403c7cb051e784b7a6a7e74fff3189a4200c1597e92f4c0083eb864d11"
    else
      url "https://github.com/pleaseai/asana/releases/download/v0.5.1/asana-darwin-x64"
      sha256 "42a1b65c8fc7a42a9ded55ec884269f267ebc1e8f8b556fdfb0b0b57ff53b538"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/asana/releases/download/v0.5.1/asana-linux-arm64"
      sha256 "4c1be47487c7c3625bbff6be2dab4e9f8d938113de20852f62e45c0c612a1955"
    else
      url "https://github.com/pleaseai/asana/releases/download/v0.5.1/asana-linux-x64"
      sha256 "954438e417bc5e2a74d9803e51a125ddc32c02c7aca0f229371b60b742d0bcda"
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
