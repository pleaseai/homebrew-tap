class Shunt < Formula
  desc "Claude Code LLM gateway - Anthropic Messages proxy for OpenAI/Codex and compatible backends"
  homepage "https://github.com/pleaseai/shunt"
  version "0.51.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.51.0/shunt-darwin-arm64"
      sha256 "042f5007e9d1bce78a4b458c97ff19c63cea82432f5af0c666db4ac2d3468ce2"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.51.0/shunt-darwin-x64"
      sha256 "1d7cea4a7a02bdd557c66a5a7acf7aa9060cd0ba6edf6b7b057a4ff7a52056d3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.51.0/shunt-linux-arm64"
      sha256 "321fabb6c86d6d140cb5d006a4005f5e962793aaba906a0a0656f434d641da83"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.51.0/shunt-linux-x64"
      sha256 "b1622e98e91a94e3fb4cd90842dd72640bc61fd2a608d8160dd0e7786e90ee61"
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
