class AsanaCli < Formula
  desc "Manage your Asana tasks from the command line"
  homepage "https://github.com/pleaseai/asana"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/asana/releases/download/v0.8.0/asana-darwin-arm64"
      sha256 "2907841fab14b6ba322b714f519e9e65745728e5c3a03590f544ca23270eeb23"
    else
      url "https://github.com/pleaseai/asana/releases/download/v0.8.0/asana-darwin-x64"
      sha256 "ba7ec69ee97040827eb285efdd65413096c659cb070da897eded2a7867577157"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/asana/releases/download/v0.8.0/asana-linux-arm64"
      sha256 "f7b9658a9d413d219353531c89824813826f59a66f4dd16da786825c45661f2f"
    else
      url "https://github.com/pleaseai/asana/releases/download/v0.8.0/asana-linux-x64"
      sha256 "37f1852f0a1cfd45a308c80a218bba811b1bd494a6e384f3db799e1ebb769ffa"
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
