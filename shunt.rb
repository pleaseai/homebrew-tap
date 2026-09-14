class Shunt < Formula
  desc "Claude Code LLM gateway - Anthropic Messages proxy for OpenAI/Codex and compatible backends"
  homepage "https://github.com/pleaseai/shunt"
  version "0.45.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.45.0/shunt-darwin-arm64"
      sha256 "e8a4bad16d98f8dd166a8e13e562c923b142f4ff4dbeff4e0d331a5ff4a1d97a"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.45.0/shunt-darwin-x64"
      sha256 "fe544a3d30c22291daedaed4fb1b7164fc538ca75702cfd8a49f4d184b4e1b9a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.45.0/shunt-linux-arm64"
      sha256 "c7ea20c7ef14261376c1f7d7cc8749a12328ead76bc3362b3bc04c39569481e4"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.45.0/shunt-linux-x64"
      sha256 "176f28bfbe5e13db837a5df6e28a8c0b4f4f6d694c95c0af55b9bbb61b61212e"
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
