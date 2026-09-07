class Shunt < Formula
  desc "Claude Code LLM gateway - Anthropic Messages proxy for OpenAI/Codex and compatible backends"
  homepage "https://github.com/pleaseai/shunt"
  version "0.41.1"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.41.1/shunt-darwin-arm64"
      sha256 "7cab67230896a942d0e7db48dfb60a7510fb9b05287bef2bf9082c25912374f6"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.41.1/shunt-darwin-x64"
      sha256 "26986a7d8afdac06e96665b30354e05eda90e76e170501583a6e0df5325d0a52"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.41.1/shunt-linux-arm64"
      sha256 "5dd7f910ab96073f0ff288b9c0eed3b81c3c91626b35276ccfb1464d1b3e4599"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.41.1/shunt-linux-x64"
      sha256 "c5e762b4fff68dedf47cd29cda075d1f921ff8f0ae2a95044e284f4a7c695555"
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
