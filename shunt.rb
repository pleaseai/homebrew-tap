class Shunt < Formula
  desc "Claude Code LLM gateway - Anthropic Messages proxy for OpenAI/Codex and compatible backends"
  homepage "https://github.com/pleaseai/shunt"
  version "0.38.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.38.0/shunt-darwin-arm64"
      sha256 "de0a4cf1e47d6f49413cfbfef64a6da53a56c8c0a0cba7d87946927ef2d176f3"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.38.0/shunt-darwin-x64"
      sha256 "cb0f16ecd6ac53c1bfc8e00a7db77c7ebb2627fc2de9bd082f664f97d4c399cf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.38.0/shunt-linux-arm64"
      sha256 "ada29b8b6b588fa3bf20dc25fd12ef93cefee1059a1e8767e0e83f0cbab377dd"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.38.0/shunt-linux-x64"
      sha256 "629fd4e47a6c2b9bb823e8ba025e42d61af8cbe315a6a086588c5e998d1c5e7d"
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
