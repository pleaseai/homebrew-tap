class Shunt < Formula
  desc "Claude Code LLM gateway - Anthropic Messages proxy for OpenAI/Codex and compatible backends"
  homepage "https://github.com/pleaseai/shunt"
  version "0.34.1"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.34.1/shunt-darwin-arm64"
      sha256 "c9915e6bd292f3c7d4b22002ff8d4ce93e89e5d190462cf096b95e38e5d7113f"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.34.1/shunt-darwin-x64"
      sha256 "228ed8bfc6140005d7cbbe84a99a8316b6db392933da924518e29e86396c4c05"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.34.1/shunt-linux-arm64"
      sha256 "38b0ee1122047a36c2440a1364d8d3ad66d7e9b8c2e76425479a7f0bb5c9671f"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.34.1/shunt-linux-x64"
      sha256 "0c93aa8e874f2d8305b88a69b0450defd226e23cf780cae8cb8976cf8a7f4bd1"
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
