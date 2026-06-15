class Ttt < Formula
  desc "Terminal text editor"
  homepage "https://tttedit.dev"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v0.3.0/ttt-darwin-arm64"
      sha256 "6479a1f0e7a57d2d695c12cd35b158e4617fbef1487aa57280eb6e3f6df54eca"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v0.3.0/ttt-darwin-amd64"
      sha256 "2e41912f0676bb34bea86cdc6acce62151d041dc7086565efabac33a4aee072b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v0.3.0/ttt-linux-arm64"
      sha256 "ebca92bb3fa307e8a900da4fe52b6716f5184069d4ceb53e7dd46fe776b8f784"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v0.3.0/ttt-linux-amd64"
      sha256 "3242dfdc045d014e58c9e1db2e0ffc6cba377311a900661526232da114bfc392"
    end
  end

  def install
    binary = Dir.glob("ttt-*").first || "ttt"
    bin.install binary => "ttt"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ttt --version 2>&1", 0)
  end
end
