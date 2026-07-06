class AsanaCli < Formula
  desc "Manage your Asana tasks from the command line"
  homepage "https://github.com/pleaseai/asana"
  version "0.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/asana/releases/download/v0.11.0/asana-darwin-arm64"
      sha256 "746444e05074d6eb67d4ff900148a872534bdb141c6bf063de0675be07584d20"
    else
      url "https://github.com/pleaseai/asana/releases/download/v0.11.0/asana-darwin-x64"
      sha256 "851cb784c4418ff49cac64f20b4e0c6433c4b538e8151b46a8a6976074f0e4c2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/asana/releases/download/v0.11.0/asana-linux-arm64"
      sha256 "f246847eb153d1595d8bd0927df67ca26d016cefa8c29c06bdcafb4f5179bb22"
    else
      url "https://github.com/pleaseai/asana/releases/download/v0.11.0/asana-linux-x64"
      sha256 "d6b8a96535dc54eda19b2b33df24c3240b33d0c8fe28f088e46604b337c6937b"
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
