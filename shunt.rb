class Shunt < Formula
  desc "Claude Code LLM gateway - Anthropic Messages proxy for OpenAI/Codex and compatible backends"
  homepage "https://github.com/pleaseai/shunt"
  version "0.39.1"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.39.1/shunt-darwin-arm64"
      sha256 "fb3aea7e65a5f8ebd6af31f9d17144312bddb6bd9c86a9024b8a608e0264edbb"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.39.1/shunt-darwin-x64"
      sha256 "dda842e6f2a6a6f2f7d08f62b57ef849a5573a611d7839c801fff9ac3bd3ac5b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.39.1/shunt-linux-arm64"
      sha256 "0c7592a48a0e477c10d7ac0f7bd37f6beb4a7acfa6641f31a6597d7139851f19"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.39.1/shunt-linux-x64"
      sha256 "90d560bfe1956fdc4afd603e1d8488eff073191c5cb12191bc9c110ecc2d8dee"
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
