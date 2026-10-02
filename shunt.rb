class Shunt < Formula
  desc "Claude Code LLM gateway - Anthropic Messages proxy for OpenAI/Codex and compatible backends"
  homepage "https://github.com/pleaseai/shunt"
  version "0.52.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.52.0/shunt-darwin-arm64"
      sha256 "41e98f6e80285a707be94767eda3198a49186b89ebcf17134edd0e17a291f02b"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.52.0/shunt-darwin-x64"
      sha256 "b8f41d6e509d980a8cc594b0f577e1aea396eb3120ff575ad63cb02e96191757"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.52.0/shunt-linux-arm64"
      sha256 "b53940109a32b285840b1d56d1c331da327c91122e29e78767c8242224b63a5c"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.52.0/shunt-linux-x64"
      sha256 "5e1e8748a8bf5cd733c252a8e82bdef89e08e06d995c4d80a77393ed0b7011ec"
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
