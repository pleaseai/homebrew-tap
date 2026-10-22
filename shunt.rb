class Shunt < Formula
  desc "Claude Code LLM gateway - Anthropic Messages proxy for OpenAI/Codex and compatible backends"
  homepage "https://github.com/pleaseai/shunt"
  version "0.58.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.58.0/shunt-darwin-arm64"
      sha256 "27d8c4a16c09b84a5ba10442e48c07bc571bafcd6e8b1eb001d80dd49f2ec9a8"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.58.0/shunt-darwin-x64"
      sha256 "971c2846ebd29b89d48c4f29371ce2113f6b12efd5595c8ea383f15153a9a5df"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.58.0/shunt-linux-arm64"
      sha256 "89a5b3826f23cf205bd3cd6ea927e134a72cd9607c6c080f8df9283514dc81f8"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.58.0/shunt-linux-x64"
      sha256 "6129d0077dc9c8713965ac85c629ac77c0b5acdbc41c4b5e68fe1a8730a95f96"
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
