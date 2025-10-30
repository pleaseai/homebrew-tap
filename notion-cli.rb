class NotionCli < Formula
  desc "Notion CLI - Manage Notion from the command line"
  homepage "https://github.com/pleaseai/notion"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/notion/releases/download/v0.3.0/notion-darwin-arm64"
      sha256 "e0fabc8e2ef2a94decdbf9c4cc9a05548d15ccfa78777c69fb54ceab5093bc78"
    else
      url "https://github.com/pleaseai/notion/releases/download/v0.3.0/notion-darwin-x64"
      sha256 "fce23930d1d248814239ac5561c9c64271d81d4fde7e39db20aea6c39ee281eb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/notion/releases/download/v0.3.0/notion-linux-arm64"
      sha256 "5ea8b4b33c6f1f81a82a5f5f7fedab798715ffccaeadff0f3aae7d4549847f33"
    else
      url "https://github.com/pleaseai/notion/releases/download/v0.3.0/notion-linux-x64"
      sha256 "a3e52b56ff6c6da9f616f6ed5daf6b433627b6cff09e27fe364f48d37a0d2606"
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
