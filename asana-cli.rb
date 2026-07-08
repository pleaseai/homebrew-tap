class AsanaCli < Formula
  desc "Manage your Asana tasks from the command line"
  homepage "https://github.com/pleaseai/asana"
  version "0.11.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/asana/releases/download/v0.11.1/asana-darwin-arm64"
      sha256 "2617113c817fc6bb98514432c0c910051f994f8fb9eac36aff1971a58951b37e"
    else
      url "https://github.com/pleaseai/asana/releases/download/v0.11.1/asana-darwin-x64"
      sha256 "a21cbf72dea1b7d44f4752fe7e88d5e26131fb7372081932142c127c90856fb2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/asana/releases/download/v0.11.1/asana-linux-arm64"
      sha256 "088b1be06108851d42b728517771a0bc8de159665f608d261af4731623bf2d6b"
    else
      url "https://github.com/pleaseai/asana/releases/download/v0.11.1/asana-linux-x64"
      sha256 "adf6ff740ef1a207f5f5909e14d05251b12c3dbef29331c214ed43022d735669"
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
