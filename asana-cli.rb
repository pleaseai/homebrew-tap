class AsanaCli < Formula
  desc "Manage your Asana tasks from the command line"
  homepage "https://github.com/pleaseai/asana"
  version "0.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/asana/releases/download/v0.9.0/asana-darwin-arm64"
      sha256 "e16d8ded5b9b519b1703f3b0fbbb966c504e589f541a861c59e703efe41dd3fa"
    else
      url "https://github.com/pleaseai/asana/releases/download/v0.9.0/asana-darwin-x64"
      sha256 "dddcc59b93995bdadad32fb2e3c5248f169862f17414eba323f77edd11dcd095"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/asana/releases/download/v0.9.0/asana-linux-arm64"
      sha256 "ef3c538c527638661fd2808984c0da6f9b06eba515d2464cb4377d0a869eda9b"
    else
      url "https://github.com/pleaseai/asana/releases/download/v0.9.0/asana-linux-x64"
      sha256 "53f39b70708cb80bdf53631c46e7b10c0533d3bede5fff2b9bd979b3b3fd43a5"
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
