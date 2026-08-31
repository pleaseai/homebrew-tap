class Shunt < Formula
  desc "Claude Code LLM gateway - Anthropic Messages proxy for OpenAI/Codex and compatible backends"
  homepage "https://github.com/pleaseai/shunt"
  version "0.39.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.39.0/shunt-darwin-arm64"
      sha256 "4bf951b0f9450bd68eae0ec31eb973bd97397ac7d9fd4a5d5be6c9f41dde4027"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.39.0/shunt-darwin-x64"
      sha256 "b4bd24c641d09f1dd437d549409513da203d1832552b46347cac53d7e8ffb29e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pleaseai/shunt/releases/download/v0.39.0/shunt-linux-arm64"
      sha256 "52e65293af0bab572c0ac82e6bf3b91bd4a0cc1e6fbddd0f625bb6c2c31ba6a4"
    else
      url "https://github.com/pleaseai/shunt/releases/download/v0.39.0/shunt-linux-x64"
      sha256 "283bed5ff9c3b658edff3eb3f571d390e4cd8a74f9ea14fa913733405371e6c1"
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
