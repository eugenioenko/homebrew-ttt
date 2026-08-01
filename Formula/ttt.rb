class Ttt < Formula
  desc "Terminal text editor"
  homepage "https://tttedit.dev"
  version "1.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v1.2.0/ttt-darwin-arm64"
      sha256 "ac2bb949daa543bb4c2a2e24adc9d8c582e747a07c28b59948b6ff7bcf542f62"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v1.2.0/ttt-darwin-amd64"
      sha256 "5cf3b0f9d949eae9fec300667a56d532efc81e1dcc4a6f64f2b10fac40124fd5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v1.2.0/ttt-linux-arm64"
      sha256 "df8303ca7c674a703a2dd5a7389d54d3be472530f9b379ec261ec90f02907a34"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v1.2.0/ttt-linux-amd64"
      sha256 "3ff2fd898a4612e64e09305608c16194e304f396d894e4b02bcef9657229620b"
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
