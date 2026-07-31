class Shunt < Formula
  desc "Claude Code LLM gateway - Anthropic Messages proxy for OpenAI/Codex and compatible backends"
  homepage "https://github.com/pleaseai/shunt"
  version "0.33.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.33.0/shunt-darwin-arm64"
      sha256 "b0c111fbc9bfb5e3083bd62c0e1440194c6c31e50a71dbbaa3980aa687bbf854"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.33.0/shunt-darwin-x64"
      sha256 "cd9588be6bcf6e05c2f7cacc066a843f7330db157e9de40624e0c2bfc8ccb7b1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.33.0/shunt-linux-arm64"
      sha256 "b86c77700ff6219bf1a9815b806fa48980f1957472318e43430340226c2d4e4c"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.33.0/shunt-linux-x64"
      sha256 "cb45aee6e8e508cfd824fb1c80ddd9efbe702ef7fcf0567b8a3bf01a49c2bc7e"
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
