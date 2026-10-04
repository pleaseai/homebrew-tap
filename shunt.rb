class Shunt < Formula
  desc "Claude Code LLM gateway - Anthropic Messages proxy for OpenAI/Codex and compatible backends"
  homepage "https://github.com/pleaseai/shunt"
  version "0.53.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.53.0/shunt-darwin-arm64"
      sha256 "6c831c889fd3d122d053ea8b4adacf230b1ff284a67466ef3810c0b984be6267"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.53.0/shunt-darwin-x64"
      sha256 "c05255a29ce0bb373be1e2e73fbbeda3bb2b8a82609bf230caaab7c218ffe77e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.53.0/shunt-linux-arm64"
      sha256 "cc13cb06534a1c6ede615a8fe8b71c66629f43b9354ade9c39fcdfb661cf54f4"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.53.0/shunt-linux-x64"
      sha256 "e52b98c2e2d7e7c678e76ef3bc42cb4fd83e1202c06aef388c8a035e073bdca3"
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
