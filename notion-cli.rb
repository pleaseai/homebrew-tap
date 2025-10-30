class NotionCli < Formula
  desc "Manage Notion from the command line"
  homepage "https://github.com/pleaseai/notion"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/notion/releases/download/notion-cli-v0.2.0/notion-darwin-arm64"
      sha256 "b757497577de1e6d671d5d1f99e7490eb15ae82d1c90b6b7faa8110437fb0b23"
    else
      url "https://github.com/pleaseai/notion/releases/download/notion-cli-v0.2.0/notion-darwin-x64"
      sha256 "9acb46e93d2b38bbad8d47774dc53f1c466bab6895ed9e50992f1935b0efcc2a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/notion/releases/download/notion-cli-v0.2.0/notion-linux-arm64"
      sha256 "db4b9d10f59adb1dcc41da4718974fef58dec23945ff52a7bbc85a6c24288f29"
    else
      url "https://github.com/pleaseai/notion/releases/download/notion-cli-v0.2.0/notion-linux-x64"
      sha256 "be72b4a4acefda4203046956739b5a65ce5af224edfeac54287773153bfb6c5a"
    end
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "notion-darwin-arm64" => "notion"
      else
        bin.install "notion-darwin-x64" => "notion"
      end
    else
      if Hardware::CPU.arm?
        bin.install "notion-linux-arm64" => "notion"
      else
        bin.install "notion-linux-x64" => "notion"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/notion --version")
  end
end