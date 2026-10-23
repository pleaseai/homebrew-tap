class Shunt < Formula
  desc "Claude Code LLM gateway - Anthropic Messages proxy for OpenAI/Codex and compatible backends"
  homepage "https://github.com/pleaseai/shunt"
  version "0.59.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.59.0/shunt-darwin-arm64"
      sha256 "53d4e1a0f82e376a1734b18cc4fc2bb6a74f9d58581ac3603d35f89d2cea32fe"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.59.0/shunt-darwin-x64"
      sha256 "56ccc57e9758c237ca7e2f477404ef3d1a54e0f138c4e2711c241892f312c59a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.59.0/shunt-linux-arm64"
      sha256 "69ee51ab77c66dcc4a62a3ce2eacd6ca373de8fc989ec640717f146d8d0dd2bd"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.59.0/shunt-linux-x64"
      sha256 "7b18dba3dd6882d5c14aac636aa81f7bdd002b47b6e03362109fa3487ef28070"
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
