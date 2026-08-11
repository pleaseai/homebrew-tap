class Shunt < Formula
  desc "Claude Code LLM gateway - Anthropic Messages proxy for OpenAI/Codex and compatible backends"
  homepage "https://github.com/pleaseai/shunt"
  version "0.36.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.36.0/shunt-darwin-arm64"
      sha256 "63d15218abb88cac2615f92e43a5b3729925ce43461f3ed121b1fa0663ebd5cf"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.36.0/shunt-darwin-x64"
      sha256 "8e5c3e4b6395a621e9028076c48d7bfbff1fd4e05af35a0dce6d5a33fcaa48c0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.36.0/shunt-linux-arm64"
      sha256 "7773c131e865ab5bb5d88f2dae9444fd4ed92a7421b54bba921e58bdae92a943"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.36.0/shunt-linux-x64"
      sha256 "4ec20b7bee8410a92b2c6ea80dd690acc7dca8a80aefb86b8f50b6e7fd73e61b"
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
