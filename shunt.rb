class Shunt < Formula
  desc "Claude Code LLM gateway - Anthropic Messages proxy for OpenAI/Codex and compatible backends"
  homepage "https://github.com/pleaseai/shunt"
  version "0.41.2"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.41.2/shunt-darwin-arm64"
      sha256 "d3ef24f9b7479ecc250a27669294a3b7727c7534b919bbc8b5bd96ef33103161"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.41.2/shunt-darwin-x64"
      sha256 "67c8d89443ae46abf74c144e5fb63f28fbdb78c725de25d84a863d83ab83b8b7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.41.2/shunt-linux-arm64"
      sha256 "e0b4c066735faf00c22e4ef92ded55c0700026d210b4d4d8bc92016fa9c80a0a"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.41.2/shunt-linux-x64"
      sha256 "7e7bf93f61d537f65e600ec0cd3da1e237a3cf45877cdf721e2e626748759ec9"
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
