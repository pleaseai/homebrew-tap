class AsanaCli < Formula
  desc "Manage your Asana tasks from the command line"
  homepage "https://github.com/pleaseai/asana"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/asana/releases/download/v0.4.0/asana-darwin-arm64"
      sha256 "2caa72b19bec45dce66d17c7995116dd26130a1f3c80975a787f8b090afa8299"
    else
      url "https://github.com/pleaseai/asana/releases/download/v0.4.0/asana-darwin-x64"
      sha256 "532940939067c1db61f2d141d7840877b9200728dc98e35cb31cc36ccafe80d3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/asana/releases/download/v0.4.0/asana-linux-arm64"
      sha256 "f642409673e609dd41d55b516322999570cf8122d538d034e8d09dbc1d864f05"
    else
      url "https://github.com/pleaseai/asana/releases/download/v0.4.0/asana-linux-x64"
      sha256 "869e94c05e78159d1ed1f0dc280e060ffed0315c4e79a09534268660b0a40dd1"
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
