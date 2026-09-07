class Shunt < Formula
  desc "Claude Code LLM gateway - Anthropic Messages proxy for OpenAI/Codex and compatible backends"
  homepage "https://github.com/pleaseai/shunt"
  version "0.41.3"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.41.3/shunt-darwin-arm64"
      sha256 "d13001a983b09de0cb91e710d626662c59b9acdd7ab2f98f71f438ee46c1c44f"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.41.3/shunt-darwin-x64"
      sha256 "76abd30fb6a5c0dadb4e645c33dc183d386abad4661e8d3e13e7c3a147c880b6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.41.3/shunt-linux-arm64"
      sha256 "28b22612fb321a91ffcd51ddbdad3f41dec42029b9785a7573110ca4b8ef82b1"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.41.3/shunt-linux-x64"
      sha256 "3eb169109bfa8004d665a6edfaffa828e46fa0a46b17b1d0268c88b2f329e75e"
    end
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "shunt-darwin-arm64" => "shunt"
      else
        bin.install "shunt-darwin-x64" => "shunt"
      end
    else
      if Hardware::CPU.arm?
        bin.install "shunt-linux-arm64" => "shunt"
      else
        bin.install "shunt-linux-x64" => "shunt"
      end
    end
  end

  service do
    run [opt_bin/"shunt", "run"]
    keep_alive true
    log_path var/"log/shunt.log"
    error_log_path var/"log/shunt.log"
    environment_variables PATH: std_service_path_env, HOMEBREW_PREFIX: HOMEBREW_PREFIX.to_s
  end

  def caveats
    <<~EOS
      shunt discovers its config file in order: the current directory, then
      $XDG_CONFIG_HOME/shunt (or ~/.config/shunt), then "#{etc}" (any of
      shunt.toml/.yaml/.yml) — an existing user config takes precedence over
      "#{etc}/shunt.toml". Run `shunt init --root #{etc}` to create one there,
      or place your own wherever should win.

      Manage the background service with:
        brew services start shunt
        brew services stop shunt   # sends SIGTERM; shunt drains in-flight requests
      Logs: #{var}/log/shunt.log
    EOS
  end

  test do
    assert_match "shunt", shell_output("#{bin}/shunt --help")
  end
end
