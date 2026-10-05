class Shunt < Formula
  desc "Claude Code LLM gateway - Anthropic Messages proxy for OpenAI/Codex and compatible backends"
  homepage "https://github.com/pleaseai/shunt"
  version "0.54.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.54.0/shunt-darwin-arm64"
      sha256 "ffa82b555b208db2ad3afed482ca4e3c5209e39198d1661d3744b69dc2f7aba3"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.54.0/shunt-darwin-x64"
      sha256 "e63fc3ebf51f29b86a6a9b161a8f06575d23b32d0730bc0377db30843d168256"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.54.0/shunt-linux-arm64"
      sha256 "d28746f06005d0c75083c73513a972f8a5cda25a14092eeff6c7995040182e68"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.54.0/shunt-linux-x64"
      sha256 "adb4792e5cfa09852459bce0f932f3ca993e39e477832ef00bdc13f988cc028a"
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
