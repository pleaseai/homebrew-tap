class NotionCli < Formula
  desc "Notion CLI - Manage Notion from the command line"
  homepage "https://github.com/pleaseai/notion"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/notion/releases/download/v0.3.1/notion-darwin-arm64"
      sha256 "33054fae3292803249086a074e8f37bc6807528341b5156b0763b0d1892a15f9"
    else
      url "https://github.com/pleaseai/notion/releases/download/v0.3.1/notion-darwin-x64"
      sha256 "5a0829963313cb311a58623d8fddc114db942a1f30b94878fefa41c08c414c01"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/notion/releases/download/v0.3.1/notion-linux-arm64"
      sha256 "585cf558758722f0a9af67120343aab64b0a855bdce0005ae49a97b59beda61d"
    else
      url "https://github.com/pleaseai/notion/releases/download/v0.3.1/notion-linux-x64"
      sha256 "c220ca8d5a07898680908b26ddc4d7f9e7e4b8042ad6c4d2b6d4127ac9e73d69"
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
