class AsanaCli < Formula
  desc "Manage your Asana tasks from the command line"
  homepage "https://github.com/pleaseai/asana"
  version "0.10.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/asana/releases/download/v0.10.0/asana-darwin-arm64"
      sha256 "5d54d477251304e6955fc793d50e027f414850627958a513c78d4504413fbc08"
    else
      url "https://github.com/pleaseai/asana/releases/download/v0.10.0/asana-darwin-x64"
      sha256 "16b9d95c5d46b6b1198e5f178bbabf98e4bee1a798b6b74a49c98079a28c627f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/asana/releases/download/v0.10.0/asana-linux-arm64"
      sha256 "e6be54490d5ed366c315c5ee154151122ec6df1934c464c66ce0c5f406e4a0dd"
    else
      url "https://github.com/pleaseai/asana/releases/download/v0.10.0/asana-linux-x64"
      sha256 "16d3422d8780c4ae1442f2a92c4f53506dff0541b95676f21a56a99b7739cf95"
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
