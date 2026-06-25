class AsanaCli < Formula
  desc "Manage your Asana tasks from the command line"
  homepage "https://github.com/pleaseai/asana"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/asana/releases/download/v0.7.0/asana-darwin-arm64"
      sha256 "3c87e7ce966bd06f10d26314477732fdb8f4695e9a09792bcfc1918164340781"
    else
      url "https://github.com/pleaseai/asana/releases/download/v0.7.0/asana-darwin-x64"
      sha256 "ed82d7273a0198d387dde61ae77680dca6206d4123a74bcc0d50df4488927ca0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/asana/releases/download/v0.7.0/asana-linux-arm64"
      sha256 "710cd5191c7118b38dcf0decc7e4dd492d8dc6633ad8e57e7f4a46951368f718"
    else
      url "https://github.com/pleaseai/asana/releases/download/v0.7.0/asana-linux-x64"
      sha256 "13b59fb7d4d04c8b6e0e4155a8de4682c39e96aa4d99a9cbe45c85bf201fd174"
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
