class LocalHub < Formula
  desc "Local GitHub API cache proxy — reduce latency and save rate limits"
  homepage "https://github.com/pleaseai/local-hub"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/local-hub/releases/download/local-hub-v0.4.0/local-hub-darwin-arm64.tar.gz"
      sha256 "157b550b6bec89a7858bf37dbf21de57346c12d853a48d40d9e0bacec7cfbb92"
    else
      url "https://github.com/pleaseai/local-hub/releases/download/local-hub-v0.4.0/local-hub-darwin-x64.tar.gz"
      sha256 "48f78263c31c1422eb6ef6a34a47c1a77ebfa470508a29ff284b12434597c56c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/local-hub/releases/download/local-hub-v0.4.0/local-hub-linux-arm64.tar.gz"
      sha256 "73b2c3746ceee49b59990b74a0cbb4a87ea3539b7baa1d8e5799fbb8730de39c"
    else
      url "https://github.com/pleaseai/local-hub/releases/download/local-hub-v0.4.0/local-hub-linux-x64.tar.gz"
      sha256 "9a845bf7a0ded2f4c3fe92b83a875417450046b65ee4eee40e0819a40fb6b27c"
    end
  end

  def install
    bin.install "local-hub"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/local-hub --version")
  end
end
